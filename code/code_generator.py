import ply.yacc as yacc
from lexer import *
from parser import *
from collections import OrderedDict
import numpy as np
import os.path
from functools import reduce
import argparse

stackmap = ['a1','a2','a3','a4','a5','t0','t1','t2']

# assign, booleans, skip, if, while, expr
def to_stack(ast):
    if ast == None:
        return []
   
    stack = []
    ld = len(ast)
    derivation = [a[0] for a in ast]
    if ['command','SEMICOLON','newcommand'] == derivation:
        res = to_stack(ast[0][1])
        res.extend(to_stack(ast[2][1]))
        return res
    elif ['IF', 'bool', 'THEN', 'command', 'ELSE', 'command', 'FI'] == derivation:
        res = ['IF']
        res.extend(to_stack(ast[1][1]))
        res.append('THEN')
        res.extend(to_stack(ast[3][1]))
        res.append('ELSE')
        res.extend(to_stack(ast[5][1]))
        return res
    elif ['command'] == derivation or ['newcommand'] == derivation:
        res = to_stack(ast[0][1])
        return res
    elif ['ID','ASSIGN','expression'] == derivation:
        res = to_stack(ast[2][1])
        #res.append(ast[0][1] + " " + ast[1][1])
        res.append(ast[1][1] + " " + ast[0][1])
        return res
    elif ['LPAREN','expression','RPAREN'] == derivation:
        return to_stack(ast[1][1])
    elif ['WHILE','bool','DO','command','OD'] == derivation:
        res = ['WHILE']
        res.extend(to_stack(ast[1][1]))
        res.append('DO')
        res.extend(to_stack(ast[3][1]))
        return res
    elif ('ID' in derivation or 'INT' in derivation or 'TRUE' in derivation or 'FALSE' in derivation) and ld == 1:
        return [ast[0][1]]
    elif ld == 1:
        return to_stack(ast[0][1])
    elif ld == 3:
        res = to_stack(ast[0][1])
        res.extend(to_stack(ast[2][1]))
        res.append(ast[1][1])
        return res

label = -1
# assign, booleans, skip, if, while, expr
def AST_to_CST(ast):
    if ast == None:
        return []
    
    ld = len(ast)
    derivation = [a[0] for a in ast]
    global label
    if ['command','SEMICOLON','newcommand'] == derivation:
        return ['command', AST_to_CST(ast[0][1]), AST_to_CST(ast[2][1])]
    elif ['IF', 'bool', 'THEN', 'command', 'ELSE', 'command', 'FI'] == derivation:
        label += 1 
        current = label
        return ['if', AST_to_CST(ast[1][1]), label, AST_to_CST(ast[3][1]), AST_to_CST(ast[5][1])]
    elif ['command'] == derivation or ['newcommand'] == derivation:
        return ['command', AST_to_CST(ast[0][1])]
    elif ['ID','ASSIGN','expression'] == derivation:
        label += 1 
        current = label
        return [ast[1][1], [ast[0][1]], AST_to_CST(ast[2][1]), label]
    elif ['LPAREN','expression','RPAREN'] == derivation:
        return AST_to_CST(ast[1][1])
    elif ['WHILE','bool','DO','command','OD'] == derivation:
        label += 1 
        current = label
        return ['while', AST_to_CST(ast[1][1]), label, AST_to_CST(ast[3][1])]
    elif ('ID' in derivation or 'INT' in derivation or 'TRUE' in derivation or 'FALSE' in derivation) and ld == 1:
        return [ast[0][1]]
    elif ld == 1:
        return AST_to_CST(ast[0][1])
    elif ld == 3:
        return [ast[1][1], AST_to_CST(ast[0][1]), AST_to_CST(ast[2][1])]

def compile(path):
    data = open(path).read()
    name = os.path.basename(path)

    print(data)

    lexer = makelex()
    code_tokens = tokenize(lexer, data)

    var = []
    for t in code_tokens:
        if t.type == "ID":
            var.append(t.value)
    variables = []
    for v in var:
        if v not in variables:
            variables.append(v)
    variables_sorted = sorted(variables)

    make_main(path, variables, variables_sorted)

    print('----------------------------------')
    parser = makeparser()

    result = parser.parse(data)
    cst = to_stack(result)
    cst.reverse()
    print(cst)

    assembly = to_assembly(cst, variables, name)
    print(assembly)

def to_assembly(cst, variables, name):
    assembly = '''  .file "computation.c"
  .option nopic
  .text
  .comm vars,''' + str(8*len(variables)) + ''',8
  .align  1
  .globl  example6
  .type ''' + name + ''', @function
''' + name + ':' + '''
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32'''

    stack_height = 0
    while len(cst) > 0:
        item = cst.pop()
        if isinstance(item, int):
            assembly += '\n  li '+stackmap[stack_height]+', '+str(item)
            stack_height += 1
        elif item in variables:
            idx = variables.index(item)
            assembly += '\n  ld '+stackmap[stack_height]+', '+str(idx*8)+'(a0)'
            stack_height += 1
        elif item in ['*','+','-']:
            if item == '*':
                assembly += '\n  mul '
            elif item == '-':
                assembly += '\n  sub '
            elif item == '+':
                assembly += '\n  add '
            assembly += stackmap[stack_height-2]+', '+stackmap[stack_height-2]+', '+stackmap[stack_height-1]
            stack_height -= 1
        elif ':=' in item:
            var = item.split()[1]
            idx = variables.index(var)
            assembly += '\n  sd '+stackmap[stack_height-1]+', '+str(idx*8)+'(a0)'
            stack_height -= 1

    assembly += '\n  ld  s0,24(sp)\n  addi  sp,sp,32\n  jr  ra'
    assembly += '\n  .size ' + name +', .-'+name+'\n  .ident  \"GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)\"\n  .section  .note.GNU-stack,\"\",@progbits'
    return assembly

def make_main(path, variables, variables_sorted):
    main = '''#include <stdlib.h>
#include <stdio.h>
extern void ''' + os.path.basename(path) + '''(long int * vars);
long int vars [''' + str(len(variables)) + '''];
int main (int argc, char ** argv)
{
    int i;
    if (argc != ''' + str(len(variables) + 1) + ''')
    {
        printf ("Usage: ''' + os.path.basename(path) + ' ' + reduce(lambda x, y : x + " " + y, variables_sorted) + '''\\n");
        exit(1);
    }
'''
    for i in range(len(variables_sorted)):
        main += '''
    vars[''' + str(variables.index(variables_sorted[i])) + '''] = atoi(argv[''' + str(i+1) + ''']);'''

    main += '''
    printf("Initial State:\\n");
    '''

    for i in range(len(variables_sorted)):
        main += '''printf("''' + str(variables[variables.index(variables_sorted[i])]) + '''=%ld\\n", vars[''' + str(variables.index(variables_sorted[i])) + ''']);
    '''
    main += os.path.basename(path) + '''(vars);
    printf("Final State:\\n");
    '''

    for i in range(len(variables_sorted)):
        main += '''printf("''' + str(variables[variables.index(variables_sorted[i])]) + '''=%ld\\n", vars[''' + str(variables.index(variables_sorted[i])) + ''']);
    '''
    main += '''
}'''
    f = open('main.c','w')
    f.write(main)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("path")
    args = parser.parse_args()
    compile(args.path)
