import ply.yacc as yacc
from lexer import *
from parser import *
from collections import OrderedDict
import os.path
from functools import reduce
import argparse
import os
from trees import *
from rd import *
from utils import *
#import networkx as nx
#import matplotlib.pyplot as plt
#import pygraphviz
#from networkx.drawing.nx_agraph import write_dot
#import pydot
#from networkx.drawing.nx_pydot import write_dot

stackmap = ['a1','a2','a3','a4','a5','a6','a7','t0','t1','t2','t3','t4','t5','t6']
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
    elif ['SKIP'] == derivation:
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

lc = 0
def to_ast(pt, tree):
    global lc
    if pt == None:
      return
    ld = len(pt)
    derivation = [a[0] for a in pt]
    if ['command','SEMICOLON','newcommand'] == derivation:
        to_ast(pt[0][1], tree)
        to_ast(pt[2][1], tree)
    elif ['IF', 'bool', 'THEN', 'command', 'ELSE', 'command', 'FI'] == derivation:
        node = ASTNode('if', label = None, parent = tree)
        tree.add_child(node)
        to_ast(pt[1][1], node)
        lc = lc + 1
        block = ASTNode('block', label = None, parent = node)
        to_ast(pt[3][1], block)
        node.add_child(block)
        block = ASTNode('block', label = None, parent = node)
        to_ast(pt[5][1], block)
        node.add_child(block)
    elif ['command'] == derivation or ['newcommand'] == derivation:
        to_ast(pt[0][1], tree)
    elif ['ID','ASSIGN','expression'] == derivation:
        node = ASTNode(pt[1][1], label = lc, parent = tree)
        tree.add_child(node)
        node.add_child(ASTNode(pt[0][1], label = lc, parent = node))
        to_ast(pt[2][1], node)
        lc = lc + 1
    elif ['LPAREN','expression','RPAREN'] == derivation:
        to_ast(pt[1][1], tree)
    elif ['WHILE','bool','DO','command','OD'] == derivation:
        node = ASTNode(pt[0][1], label = None, parent = tree)
        tree.add_child(node)
        to_ast(pt[1][1], node)
        lc = lc + 1
        block = ASTNode('block', label = None, parent = node)
        to_ast(pt[3][1], block)
        node.add_child(block)
    elif ('ID' in derivation or 'INT' in derivation or 'TRUE' in derivation or 'FALSE' in derivation) and ld == 1:
        node = ASTNode(pt[0][1], label = lc, parent = tree)
        tree.add_child(node)
    elif ['SKIP'] == derivation:
        node = ASTNode(pt[0][1], label = lc, parent = tree)
        lc = lc + 1
        tree.add_child(node)
    elif ld == 1:
        to_ast(pt[0][1], tree)
    elif ld == 3:
        node = ASTNode(pt[1][1], label = lc, parent = tree)
        tree.add_child(node)
        to_ast(pt[0][1], node)
        to_ast(pt[2][1], node)
    elif ld == 4:
        node = ASTNode(pt[0][1], label = lc, parent = tree)
        tree.add_child(node)
        to_ast(pt[2][1], node)

def to_cfg(dast, root):
  blocks = root
  for i, child in enumerate(dast.children):
    if child.label != dast.label:
      tmp = CFGNode(to_code(child), child.label)
      for b in blocks:
        b.add_child(tmp)
      blocks = [tmp]

    if child.name == 'if':
      tmp_bool = CFGNode(to_code(child.children[0]), child.children[0].label, 'if')
      for b in blocks:
        b.add_child(tmp_bool)
      tmp_then = to_cfg(child.children[1], [tmp_bool])
      tmp_else = to_cfg(child.children[2], [tmp_bool])
      blocks = [tmp_then, tmp_else]

    if child.name == 'while':
      tmp_bool = CFGNode(to_code(child.children[0]), child.children[0].label, 'while')
      for b in blocks:
        b.add_child(tmp_bool)
      tmp_do = to_cfg(child.children[1], [tmp_bool])
      tmp_do.add_child(tmp_bool)
      blocks = [tmp_bool]

  blocks = tmp
  return blocks

def from_cfg_to_code(cfgnode, found=[], tab = 0):
  s = ''
  for t in range(tab):
    s += '  '
  if cfgnode.info == 'if':
    s += 'if ' + cfgnode.name + 'then\n'
    if cfgnode.children[0] not in found:
      s += from_cfg_to_code(cfgnode.children[0], found + [cfgnode], tab + 1)
    s += 'else\n'
    if cfgnode.children[0] not in found:
      s += from_cfg_to_code(cfgnode.children[1], found + [cfgnode], tab + 1)
    s += 'fi;\n'
  elif cfgnode.info == 'while':
    s += 'while ' + cfgnode.name + ' do\n'
    if cfgnode.children[0] not in found:
      s += from_cfg_to_code(cfgnode.children[0], found + [cfgnode], tab + 1)
    s += 'od;\n'
  else:
    s += cfgnode.name + ';\n'
    if len(cfgnode.children) > 0:
      if cfgnode.children[0] not in found:
        s += from_cfg_to_code(cfgnode.children[0], found + [cfgnode], tab)
  return s
   
def solve_rd(cfg, variables):
  ineq = []
  outeq = []

  # ------------------------------------  
  current = cfg
  found = [cfg]
  stack = [cfg]
  while len(stack) != 0:
    current = stack.pop()
    for child in current.children:
      if child not in found:
        found.append(child)
        stack.insert(0,child)
  # ------------------------------------  

  rd_init = RDSet()
  rds_all = RDSet()
  all_nodes = []

  for v in variables:
    rd_init.append(RD(v))

  for node in found:
    if node.name != 'root':
      eq = node.name.split()
      x = eq[0]
      l = node.label
      all_nodes.append(node)
      if ':=' in eq:
        x = eq[0]
        l = node.label
        rds_all.append(RD(x, l, node))

  # initialize in
  all_nodes[0].rd_set_in.set = rd_init.set

  changed = True
  while changed:
    changed = False
    for node in all_nodes:
      rds = node.rd_set_in
      for p in node.parents:
        rds_parent = p.rd_set_out
        if p.label != None:
          rds.union(rds_parent)

    for node in all_nodes:
      rds = node.rd_set_out 
      tmp = rds.copy()
      rdgen = node.rdgen
      if rdgen != None:
        rds.union(node.rd_set_in)
        rds.remove(rdgen.x)
        rds.append(rdgen)
        changed = changed or tmp != rds
      else:
        rds.union(node.rd_set_in)
        changed = changed or tmp != rds


  return all_nodes

def const_folding(all_nodes, variables):
  for n in all_nodes:
    n.name = simplify(n.name)

  change = True
  while change:
    change = False
    for n in all_nodes:
      name = n.name
      name_as_list = name.split()
      if ":=" in name_as_list:
        exp = name_as_list[2:]
        prefix = name_as_list[:2]
      else:
        exp = name_as_list 
        prefix = []
      for v in variables:
        if v in exp:
          exps = []
          for rd in n.rd_set_in.set:
            if rd.x == v and rd.node != None and rd.node.name not in exps:
              exps.append(rd.node.name)
          if len(exps) == 1:
            e = to_string(exps[0].split()[2:])
            if is_exp(e):
              s = to_string(exp)
              s = s.replace(v, e)
              s = to_string(prefix) + s
              change = change or n.name != s
              n.name = s

    for n in all_nodes:
      change = n.name != simplify(n.name) or change
      n.name = simplify(n.name)
    
def to_code(ast, decorate = False, tab = 0):
  s = ''

  if ast.name == 'block':
    for child in ast.children:
      s += to_code(child, decorate, tab)
  elif ast.name == ':=':
    for i in range(tab):
      s += ' '
    s += str(ast.children[0].name)
    s += ' := '
    s += to_code(ast.children[1], decorate) 
    if decorate:
      s += '-- label ' + str(ast.label) + ' \n'
    else:
      s += '\n'
  elif ast.name == 'while':
    for i in range(tab):
      s += ' '
    s += 'while '
    s += to_code(ast.children[0], decorate)
    s += 'do '    
    if decorate:
      s += '-- label ' + str(ast.children[0].label) + ' \n'
    else:
      s += '\n'
    s += to_code(ast.children[1], decorate, tab+1)
    s += 'od '+ '\n'
  elif ast.name == 'if':
    for i in range(tab):
      s += '  '
    s += 'if '
    s += to_code(ast.children[0], decorate)
    s += 'then '
    if decorate:
      s += '-- label ' + str(ast.children[0].label) + ' \n'
    else:
      s += '\n'
    s += to_code(ast.children[1], decorate, tab+1)
    s += 'else '+ '\n'
    s += to_code(ast.children[2], decorate, tab+1)
  elif ast.name in ['*', '-', '+', '<', '<=', '>=', '>', '=', 'and', 'or']:
    s += to_code(ast.children[0], decorate)
    s += ast.name + ' '
    s += to_code(ast.children[1], decorate)
  else:
    s += str(ast.name) + ' '
  return s

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
        pt = parser.parse(data)
    except Exception as e:
        print('Syntax Error!')
        return

    # make the main file which we will link to
    make_main(name, variables, variables_sorted)

    # get a stack of commands, preprocess to make it easier to read
    cst = to_stack(pt)
    cst.reverse()
    
    assembly = to_assembly(cst, variables, name)
    f = open(name + '.s','w')
    f.write(assembly)
    f.close()

    # compile if asked to
    if c:
        print('gcc main.c ' + name + '.s -o ' + name)
        os.system('gcc main.c ' + name + '.s -o ' + name)

def parse(data):
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
      pt = parser.parse(data)
  except Exception as e:
      print('Syntax Error!')
      return
  return pt, variables
  
def visualize(path):
  data = open(path).read()
  name = os.path.basename(path).split('.')[0]

  pt, variables = parse(data)

  # this makes the decorated ast
  # root contains the root of the ast
  astroot = ASTNode('block')
  to_ast(pt, astroot)

  # this just labels the code
  s = to_code(astroot, True, tab = 0)
  print(s)

  # this makes the the control flow graph
  # pretty much the same data structure as astnode
  cfgroot = CFGNode('root')
  to_cfg(astroot, [cfgroot])
  # dont need root
  cfgroot = cfgroot.children[0]

  # new stuff we don't need to visualize I think, but idk where to put it right now
  nodes = solve_rd(cfgroot, variables)

  print()
  for f in nodes:
    print('IN '+str(f.label)+' '+f.rd_set_in.__str__())
  print()
  for f in nodes:
    print('OUT '+str(f.label)+' '+f.rd_set_out.__str__())
  print()

  const_folding(nodes, variables)
  s = from_cfg_to_code(cfgroot)
  print(s)

  pt, variables = parse(s)
  astroot = ASTNode('block')
  to_ast(pt, astroot)
  cfgroot = CFGNode('root')
  to_cfg(astroot, [cfgroot])
  cfgroot = cfgroot.children[0]
  nodes = solve_rd(cfgroot, variables)
  # this is already folded
  # const_folding(nodes, variables)

  '''
  count = 0
  preprocess(tree)
  G = nx.DiGraph()
  build(G, tree)
  # write_dot(G, "graph.dot")

  attributes = []
  for node in G.nodes():
      attr = node.split(' ')
      attributes.append(attr[0])

  node_list = list(G.nodes())
  type_dict = { k:v for k,v in zip(node_list,attributes)}
  nx.set_node_attributes(G, type_dict, 'type')
  G = nx.convert_node_labels_to_integers(G, first_label=0, ordering='default', label_attribute=None)
  '''

#   pos = nx.nx_agraph.graphviz_layout(G, prog='dot')
#    plt.figure(3,figsize=(5,5))
#    # 'E0E0E0', 'FFCC99', '#82A9D0', '#F9C56A', '#FF9999', '#A4CACA', '#7DCACA' '#F6D66F'
#    nx.draw(G, pos, with_labels=False, arrows=False, font_size=5, node_size=1000, node_color='#7DCACA')
#    node_labels = nx.get_node_attributes(G,'type')
#    nx.draw_networkx_labels(G, pos, labels = node_labels, font_size=15)
#    plt.savefig('tree.png')
#    # write_dot(G, "graph.dot")
  # ! dot -Tpdf graph.dot -o graph.pdf
  # run the following to print out the tree in a pdf: dot -Tpdf graph.dot -o graph.pdf
# ----------------------------------------------------------------------

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
                assembly += '\n  sgtz ' + stackmap[stack_height-2] + ', ' + stackmap[stack_height-2]
            elif item == '>':
                assembly += '\n  sub '
                assembly += stackmap[stack_height-2]+', '+stackmap[stack_height-2]+', '+stackmap[stack_height-1]
                assembly += '\n  sltz ' + stackmap[stack_height-2] + ', ' + stackmap[stack_height-2]
            elif item == '<=':
                assembly += '\n  addi ' + stackmap[stack_height-1] + ','+stackmap[stack_height-1]+',1'
                assembly += '\n  slt '
                assembly += stackmap[stack_height-2]+', '+stackmap[stack_height-2]+', '+stackmap[stack_height-1]
            elif item == '>=':
                assembly += '\n  addi ' + stackmap[stack_height-2] + ','+stackmap[stack_height-2]+',1'
                assembly += '\n  slt '
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
        elif 'skip' == item:
            assembly += '\n  nop'
        elif 'WHILE' in item:
            n = item.split()[1]
            assembly += '\n.L'+n+':'
            labels.append(maxlabel)
        elif 'DO' in item:
            n = item.split()[1]
            to = item.split()[2]
            assembly += '\n  j .L' + to + '\n.L' + n+':'
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
        elif 'FI' in item:
            n = item.split()[1]
            assembly += '\n.L' + n+':'

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
    parser.add_argument("--v", required=False, action='store_true')
    parser.add_argument("path")
    args = parser.parse_args()

    if args.v:
      visualize(args.path)

    tree = generate_code(args.path, args.c)
