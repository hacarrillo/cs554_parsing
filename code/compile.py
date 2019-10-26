import ply.yacc as yacc
from lexer import *
from parser import *
from collections import OrderedDict
import os.path
from functools import reduce
import argparse
import os

stackmap = ['a1','a2','a3','a4','a5','t0','t1','t2']
maxl = 2
# assign, booleans, skip, if, while, expr
def to_stack(ast):
    global maxl
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
        l = maxl
        maxl += 2
        res = ['IF']
        res.extend(to_stack(ast[1][1]))
        # where to jump
        res.append('THEN ' + str(l))
        res.extend(to_stack(ast[3][1]))
        # where to jump and what to name the else
        res.append('ELSE ' + str(l+1) + " " + str(l))
        res.extend(to_stack(ast[5][1]))
        # what to name the new jmp
        res.append('FI ' + str(l+1))
        return res
    elif ['command'] == derivation or ['newcommand'] == derivation:
        res = to_stack(ast[0][1])
        return res
    elif ['ID','ASSIGN','expression'] == derivation:
        res = to_stack(ast[2][1])
        res.append(ast[1][1] + " " + ast[0][1])
        return res
    elif ['LPAREN','expression','RPAREN'] == derivation:
        return to_stack(ast[1][1])
    elif ['WHILE','bool','DO','command','OD'] == derivation:
        l = maxl
        maxl += 2
        # what to call it and where to jump
        res = ['DO '+str(l) + " " + str(l+1)]
        res.extend(to_stack(ast[3][1]))
        # what to call it 
        res.append('WHILE '+ str(l+1))
        res.extend(to_stack(ast[1][1]))
        # where to jump
        res.append('OD ' + str(l))
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
    elif ld == 4:
        res = to_stack(ast[2][1])
        res.append(ast[0][1])
        return res

def generate_code(path, c):
    data = open(path).read()
    name = os.path.basename(path).split('.')[0]

    lexer = makelex()
    code_tokens = tokenize(lexer, data)

    # this is to keep track of variables
    var = []
    for t in code_tokens:
        if t.type == "ID":
            var.append(t.value)
    variables = []
    for v in var:
        if v not in variables:
            variables.append(v)
    variables_sorted = sorted(variables)
    
    parser = makeparser()
    try:
        result = parser.parse(data)
    except Exception as e:
        print('Syntax Error!')
        return

    # make the main file which we will link to
    make_main(name, variables, variables_sorted)

    # get a stack of commands, preprocess to make it easier to read
    cst = to_stack(result)
    cst.reverse()

    assembly = to_assembly(cst, variables, name)
    f = open(name + '.s','w')
    f.write(assembly)
    f.close()

    # compile if asked to
    if c:
        print('gcc main.c ' + name + '.s -o ' + name)
        os.system('gcc main.c ' + name + '.s -o ' + name)

def to_assembly(cst, variables, name):
    assembly = '''  .file "'''+name+'''.c"
  .option nopic
  .text
  .comm vars,''' + str(8*len(variables)) + ''',8
  .align  1
  .globl ''' + name + '''
  .type ''' + name + ''', @function
''' + name + ':' + '''
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32'''

    stack_height = 0
    assembly += assembly_loop(cst, variables, stack_height)         

    assembly += '\n  ld  s0,24(sp)\n  addi  sp,sp,32\n  jr  ra'
    assembly += '\n  .size ' + name +', .-'+name+'\n  .ident  \"GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)\"\n  .section  .note.GNU-stack,\"\",@progbits'
    return assembly

def assembly_loop(cst, variables, stack_height, assembly = ''):
    labels = []
    maxlabel = 2
    while len(cst) > 0:
        item = cst.pop()
        if isinstance(item, int):
            assembly += '\n  li '+stackmap[stack_height]+', '+str(item)
            stack_height += 1
        elif item in variables:
            idx = variables.index(item)
            assembly += '\n  ld '+stackmap[stack_height]+', '+str(idx*8)+'(a0)'
            stack_height += 1
        elif item in ['and', 'or', 'not']:
            if item == 'and':
                assembly += '\n  add '
                assembly += stackmap[stack_height-2]+', '+stackmap[stack_height-2]+', '+stackmap[stack_height-1]
                assembly += '\n  li '+stackmap[stack_height-1]+', 1'
                assembly += '\n  slt '+stackmap[stack_height-2]+', '+stackmap[stack_height-1]+', '+stackmap[stack_height-2]
                stack_height -= 1
            elif item == 'or':
                assembly += '\n  add '
                assembly += stackmap[stack_height-2]+', '+stackmap[stack_height-2]+', '+stackmap[stack_height-1]
                assembly += '\n  li '+stackmap[stack_height-1]+', 0'
                assembly += '\n  slt '+stackmap[stack_height-2]+', '+stackmap[stack_height-1]+', '+stackmap[stack_height-2]
                stack_height -= 1
            elif item == 'not':
                assembly += '\n  seqz '+stackmap[stack_height-1]+', '+stackmap[stack_height-1]
        elif item in ['*','+','-']:
            if item == '*':
                assembly += '\n  mul '
            elif item == '-':
                assembly += '\n  sub '
            elif item == '+':
                assembly += '\n  add '
            assembly += stackmap[stack_height-2]+', '+stackmap[stack_height-2]+', '+stackmap[stack_height-1]
            stack_height -= 1
        elif item in ['<','>','>=','<=','=']:
            if item == '<':
                assembly += '\n  sub '
                assembly += stackmap[stack_height-2]+', '+stackmap[stack_height-2]+', '+stackmap[stack_height-1]
                assembly += '\n  sltz ' + stackmap[stack_height-2] + ', ' + stackmap[stack_height-2]
            elif item == '>':
                assembly += '\n  sub '
                assembly += stackmap[stack_height-2]+', '+stackmap[stack_height-2]+', '+stackmap[stack_height-1]
                assembly += '\n  sgtz ' + stackmap[stack_height-2] + ', ' + stackmap[stack_height-2]
            elif item == '<=':
                assembly += '\n addi ' + stackmap[stack_height-1] + ', 1'
                assembly += '\n  slt '
                assembly += stackmap[stack_height-2]+', '+stackmap[stack_height-2]+', '+stackmap[stack_height-1]
            elif item == '>=':
                assembly += '\n addi ' + stackmap[stack_height-2] + ', 1'
                assembly += '\n  slt' 
                assembly += stackmap[stack_height-2]+', '+stackmap[stack_height-1]+', '+stackmap[stack_height-2]
            elif item == '=':
                assembly += '\n  sub '
                assembly += stackmap[stack_height-2]+', '+stackmap[stack_height-2]+', '+stackmap[stack_height-1]
                assembly += '\n  seqz ' + stackmap[stack_height-2] + ', ' + stackmap[stack_height-2]
            stack_height -= 1
        elif ':=' in item:
            var = item.split()[1]
            idx = variables.index(var)
            assembly += '\n  sd '+stackmap[stack_height-1]+', '+str(idx*8)+'(a0)'
            stack_height -= 1
        elif 'WHILE' in item:
            n = item.split()[1]
            assembly += '\n.L'+n+':'
            labels.append(maxlabel)
        elif 'DO' in item:
            n = item.split()[1]
            to = item.split()[2]
            assembly += '\n  j .L' + to + '\n.L' + n+':'
            stack_height -= 1
            labels.append(maxlabel)
        elif 'OD' in item:
            to = item.split()[1]
            assembly += '\n  bnez ' + stackmap[stack_height-1]+', .L' + to 
            stack_height -= 1
        elif 'THEN' in item:
            to = item.split()[1]
            assembly += '\n  beqz ' + stackmap[stack_height-1]+', .L' + to
            stack_height -= 1
        elif 'ELSE' in item:
            n = item.split()[2]
            to = item.split()[1]
            assembly += '\n  j .L' + to + '\n.L' + n+':'
            stack_height -= 1
        elif 'FI' in item:
            n = item.split()[1]
            assembly += '\n.L' + n+':'
            stack_height -= 1
    
    return assembly

def make_main(name, variables, variables_sorted):
    main = '''#include <stdlib.h>
#include <stdio.h>
extern void ''' + name + '''(long int * vars);
long int vars [''' + str(len(variables)) + '''];
int main (int argc, char ** argv)
{
    int i;
    if (argc != ''' + str(len(variables) + 1) + ''')
    {
        printf ("Usage: ''' + name + ' ' + reduce(lambda x, y : x + " " + y, variables_sorted) + '''\\n");
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
    main += name + '''(vars);
    printf("Final State:\\n");
    '''

    for i in range(len(variables_sorted)):
        main += '''printf("''' + str(variables[variables.index(variables_sorted[i])]) + '''=%ld\\n", vars[''' + str(variables.index(variables_sorted[i])) + ''']);
    '''
    main += '''
}'''
    f = open('main.c','w')
    f.write(main)
    f.close()

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--c", required=False, action='store_true')
    parser.add_argument("path")
    args = parser.parse_args()
    generate_code(args.path, args.c)