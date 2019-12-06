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

def to_cfg(dast, root, block, variables, depth = 0):
  parents = root
  length = len(dast.children)
  for i, child in enumerate(dast.children):
    if child.label != dast.label:
      tmp = CFGNode(to_code(child), child.label, ast = child, variables=variables)
      block.nodes.append(tmp)
      for b in parents:
        b.add_child(tmp)
      parents = [tmp]
    elif child.name == 'if':
      thenblock = Block()
      elseblock = Block()
      afterblock = Block()
      block.children.append(thenblock)
      block.children.append(elseblock)
      block.children.append(afterblock)
      tmp_bool = CFGNode(to_code(child.children[0]), child.children[0].label, 'if', ast = child.children[0], variables=variables)
      block.nodes.append(tmp_bool)
      for b in parents:
        b.add_child(tmp_bool)
      tmp_then = to_cfg(child.children[1], [tmp_bool], thenblock, variables, depth+1)
      tmp_else = to_cfg(child.children[2], [tmp_bool], elseblock, variables, depth+1)
      parents = [tmp_then, tmp_else]
      block = afterblock
    elif child.name == 'while':
      doblock = Block()
      afterblock = Block()
      block.children.append(doblock)
      block.children.append(afterblock)
      tmp_bool = CFGNode(to_code(child.children[0]), child.children[0].label, 'while', ast = child.children[0], variables=variables)
      block.nodes.append(tmp_bool)
      for b in parents:
        b.add_child(tmp_bool)
      tmp_do = to_cfg(child.children[1], [tmp_bool], doblock, variables, depth+1)
      tmp_do.add_child(tmp_bool)
      parents = [tmp_bool]
      block = afterblock

    if length == i+1 and depth == 0:
      tmp = CFGNode('return', 999999, 'while', variables=variables)
      tmp.var = 'output'
      tmp.used = []
      for b in parents:
        b.add_child(tmp)
      parents = [tmp]

  return parents

def from_blocks_to_code(block, tab = 0):
  s = ''
  # if
  if len(block.children) == 3:
    for i in range(len(block.nodes)-1):
      n = block.nodes[i]
      for t in range(tab):
        s += '  '
      s += n.name + ';\n'
    for t in range(tab):
      s += '  '
    s += 'if ' + block.nodes[-1].name + ' then\n'
    s += from_blocks_to_code(block.children[0], tab + 1)
    for t in range(tab):
      s += '  '
    s += 'else\n'
    s += from_blocks_to_code(block.children[1], tab + 1)
    for t in range(tab):
      s += '  '
    s += 'fi;\n'
    s += from_blocks_to_code(block.children[2], tab)
  # while
  elif len(block.children) == 2:
    for i in range(len(block.nodes)-1):
      n = block.nodes[i]
      for t in range(tab):
        s += '  '
      s += n.name + ';\n'
    for t in range(tab):
      s += '  '
    s += 'while ' + block.nodes[-1].name + ' do\n'
    s += from_blocks_to_code(block.children[0], tab + 1)
    for t in range(tab):
      s += '  '
    s += 'od;\n'
    s += from_blocks_to_code(block.children[1], tab)
  else:
    for i in range(len(block.nodes)):
      n = block.nodes[i]
      for t in range(tab):
        s += '  '
      s += n.name + ';\n'
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
        changed = changed or not rds == tmp
      else:
        rds.union(node.rd_set_in)
        changed = changed or not rds == tmp

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
      s += '  '
    s += str(ast.children[0].name)
    s += ' := '
    s += to_code(ast.children[1], decorate)
    if decorate:
      s += '-- label ' + str(ast.label) + ' \n'
    else:
      s += '\n'
  elif ast.name == 'while':
    for i in range(tab):
      s += '  '
    s += 'while '
    s += to_code(ast.children[0], decorate)
    s += 'do '
    if decorate:
      s += '-- label ' + str(ast.children[0].label) + ' \n'
    else:
      s += '\n'
    s += to_code(ast.children[1], decorate, tab+1)
    for i in range(tab):
      s += '  '
    s += 'od '+ '\n'
  elif ast.name == 'if':
    for i in range(tab):
      s += '  '
    s += 'if '
    s += to_code(ast.children[0], decorate)
    for i in range(tab):
      s += '  '
    s += 'then '
    if decorate:
      s += '-- label ' + str(ast.children[0].label) + ' \n'
    else:
      s += '\n'
    s += to_code(ast.children[1], decorate, tab+1)
    for i in range(tab):
      s += '  '
    s += 'else '+ '\n'
    s += to_code(ast.children[2], decorate, tab+1)
    for i in range(tab):
      s += '  '
    s += 'fi '+ '\n'
  elif ast.name in ['*', '-', '+', '<', '<=', '>=', '>', '=', 'and', 'or']:
    s += to_code(ast.children[0], decorate)
    s += ast.name + ' '
    s += to_code(ast.children[1], decorate)
  elif ast.name == 'skip':
    for i in range(tab):
      s += '  '
    s += 'skip '
    if decorate:
      s += '-- label ' + str(ast.label) + ' \n'
    else:
      s += '\n'
  else:
    s += str(ast.name) + ' '
  return s

def generate_code(path, c):
  data = open(path).read()
  name = os.path.basename(path).split('.')[0]

  pt, variables = parse(data)

  # this makes the decorated ast
  # root contains the root of the ast
  astroot = ASTNode('block')
  to_ast(pt, astroot)

  # this just labels the code
  s = to_code(astroot, True, tab = 0)

  # this makes the the control flow graph and blocks
  # pretty much the same data structure as astnode
  cfgroot = CFGNode('root')
  blocks = Block()
  to_cfg(astroot, [cfgroot], blocks, variables)
  # dont need root
  cfgroot = cfgroot.children[0]
  nodes = get_cfg_nodes(cfgroot)

  # new stuff we don't need to visualize I think, but idk where to put it right now
  solve_rd(cfgroot, variables)

  const_folding(nodes, variables)
  s = from_blocks_to_code(blocks, tab = 0)
  print(s)

  # rebuild instead of having to deal with the ast again
  pt, variables = parse(s)
  astroot = ASTNode('block')
  to_ast(pt, astroot)
  cfgroot = CFGNode('root')
  blocks = Block()
  to_cfg(astroot, [cfgroot], blocks, variables)
  cfgroot = cfgroot.children[0]
  nodes = get_cfg_nodes(cfgroot)
  solve_rd(cfgroot, variables)

  #cfg_to_assembly_loop(nodes, variables)
  assembly = to_assembly(blocks, variables, name)

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

  # this makes the the control flow graph and blocks
  # pretty much the same data structure as astnode
  cfgroot = CFGNode('root')
  blocks = Block()
  to_cfg(astroot, [cfgroot], blocks, variables)
  # dont need root
  cfgroot = cfgroot.children[0]
  print()
  nodes = get_cfg_nodes(cfgroot)

  # new stuff we don't need to visualize I think, but idk where to put it right now
  solve_rd(cfgroot, variables)

  print()
  for f in nodes:
    print('IN '+str(f.label)+' '+f.rd_set_in.__str__())
  print()
  for f in nodes:
    print('OUT '+str(f.label)+' '+f.rd_set_out.__str__())
  print()

  const_folding(nodes, variables)
  s = from_blocks_to_code(blocks, tab = 0)
  print(s)

  # rebuild instead of having to deal with the ast again
  pt, variables = parse(s)
  astroot = ASTNode('block')
  to_ast(pt, astroot)
  cfgroot = CFGNode('root')
  blocks = Block()
  to_cfg(astroot, [cfgroot], blocks, variables)
  cfgroot = cfgroot.children[0]
  nodes = get_cfg_nodes(cfgroot)
  solve_rd(cfgroot, variables)

  #cfg_to_assembly_loop(nodes, variables)
  s = to_assembly(blocks, variables, name)
  print(s)

  #build_ast(astroot)
  #build_cfg(cfgroot)


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

def build_ast(ast_tree):
    import networkx as nx
    import matplotlib.pyplot as plt

    # create empty graph
    graph = nx.Graph()

    # add the root node to the graph
    root = tree[0]
    graph.add_node(root.count,
                   name = root.name,
                   label = root.label)


    # all nodes below root will have exactly one parent
    # add each node to the graph and its parent and create an edge between them
    # if parents are tried to be added more than one time it doesnt matter, they won't be added again

    for node in tree[1:]:
        graph_node = node.count
        node_name = node.name
        node_label = node.label

        graph.add_node(graph_node,
                       name = node_name,
                       label = node_label)

        if node.parent != None:
            parent = node.parent.count
            parent_name = node.parent.name
            parent_label = node.parent.label

            graph.add_node(parent,
                           name = parent_name,
                           label = parent_label)

        graph.add_edge(graph_node,parent)

    # plot the tree
    pos = nx.nx_agraph.graphviz_layout(graph, prog='dot')
    plt.figure(3,figsize=(20,20))

    colors = [node.label for node in tree]
    colors = [ int(-1) if value is None else value for value in colors]

    nx.draw(graph, pos, with_labels=False, arrows=False, font_size=10, node_size=2000, node_color=colors, cmap=plt.cm.Spectral, alpha = 0.5)
    node_labels = nx.get_node_attributes(graph,'name')
    nx.draw_networkx_labels(graph, pos, labels = node_labels, font_size=15, width=0.5)

    plt.savefig('ast_tree.png')
# -----------------------------------------------------------------------------------------------------------------
#

def build_cfg(cfg_tree):
    # create empty graph
    graph = nx.Graph()

    # add the root node to the graph
    root = tree[0]
    graph.add_node(root.count,
                   name = root.name,
                   label = root.label)


    # all nodes below root will have exactly one parent
    # add each node to the graph and its parents and create an edge between them
    # if parents are tried to be added more than one time it doesnt matter, they won't be added again

    for node in tree[1:]:
        graph_node = node.count
        node_name = node.name
        node_label = node.label

        graph.add_node(graph_node,
                       name = node_name,
                       label = node_label)

        if node.parents != None:
            for parent in node.parents:
                parent_node = parent.count
                parent_name = parent.name
                parent_label = parent.label

                graph.add_node(parent_node,
                               name = parent_name,
                               label = parent_label)

                graph.add_edge(graph_node,parent_node)

    # plot the tree

    # pos = nx.nx_agraph.graphviz_layout(graph, prog='dot')
    plt.figure(3,figsize=(10,10))

    colors = [node.label for node in tree]
    colors = [ int(-1) if value is None else value for value in colors]

    nx.draw(graph, pos, with_labels=False, arrows=False, font_size=10, node_size=2000, node_color=colors, cmap=plt.cm.Spectral, alpha = 0.5)
    node_labels = nx.get_node_attributes(graph,'name')
    nx.draw_networkx_labels(graph, pos, labels = node_labels, font_size=15, width=0.5)

    plt.savefig('cfg_tree.png')

# -----------------------------------------------------------------------------------------------------------------------------

def to_assembly(blocks, variables, name):
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

    assembly += blocks_to_assembly(blocks, variables)

    assembly += '\n  ld  s0,24(sp)\n  addi  sp,sp,32\n  jr  ra'
    assembly += '\n  .size ' + name +', .-'+name+'\n  .ident  \"GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)\"\n  .section  .note.GNU-stack,\"\",@progbits'
    return assembly

stack_height = 0
def assembly_loop(cst, variables, assembly = ''):
    global stack_height
    labels = []
    maxlabel = 2
    while len(cst) > 0:
        node = cst.pop()
        item = node.name
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
                assembly += '\n  not '+stackmap[stack_height-1]+', '+stackmap[stack_height-1]
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
                assembly += '\n  slt ' + stackmap[stack_height-2] + ', ' + stackmap[stack_height-2] + ', ' + stackmap[stack_height-1]
            elif item == '>':
                assembly += '\n  slt ' + stackmap[stack_height-2] + ', ' + stackmap[stack_height-1] + ', ' + stackmap[stack_height-2]
            elif item == '<=':
                assembly += '\n  addi ' + stackmap[stack_height-1] + ',' + stackmap[stack_height-1]+',1'
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
            var = node.children[0].name
            idx = variables.index(var)
            assembly += '\n  sd '+stackmap[stack_height-1]+', '+str(idx*8)+'(a0)'
            stack_height -= 1
        elif 'skip' == item:
            assembly += '\n  nop'

    return assembly

def get_cfg_nodes(cfgnode, found=[]):
  if cfgnode.info == 'if':
    if cfgnode not in found:
      found += [cfgnode]
    if cfgnode.children[0] not in found:
      found = get_cfg_nodes(cfgnode.children[0], found)
    if cfgnode.children[1] not in found:
      found = get_cfg_nodes(cfgnode.children[1], found)
  elif cfgnode.info == 'while':
    if cfgnode not in found:
      found += [cfgnode]
    for c in cfgnode.children:
      if c not in found:
        found = get_cfg_nodes(c, found)
  else:
    found += [cfgnode]
    if len(cfgnode.children) > 0:
      if cfgnode.children[0] not in found:
        found = get_cfg_nodes(cfgnode.children[0], found)
  return found

def get_ast_exp_nodes(ast, found = []):
  if ast.name != ':=':
    for child in ast.children:
      found = get_ast_exp_nodes(child, found)
    found += [ast]
  else:
    found = get_ast_exp_nodes(ast.children[1])
    found += [ast]
  return found

def blocks_to_assembly(block, variables):
  global stack_height

  s = ''
  nodes = block.nodes
  nodes.reverse()
  # if
  print(block.nodes)
  if len(block.children) == 3:
    while len(nodes) > 0:
      cfgnode = nodes.pop()
      astnodes = get_ast_exp_nodes(cfgnode.ast, [])
      astnodes.reverse()
      s += assembly_loop(astnodes, variables, '')

    label_then = str(block.children[0].nodes[0].label)
    label_else = str(block.children[1].nodes[0].label)
    if len(block.children[2].nodes) > 0:
      label_after = str(block.children[2].nodes[0].label)
    else:
      label_after = str(ASTNode.count)
      ASTNode.count += 1

    s += '\n  bnez ' + stackmap[stack_height-1]+', .L' + label_then
    stack_height -= 1
    s += '\n  j .L' + label_else
    s += '\n.L' + label_then +':'
    s += blocks_to_assembly(block.children[0], variables)
    s += '\n  j .L' + label_after
    s += '\n.L' + label_else +':'
    s += blocks_to_assembly(block.children[1], variables)
    s += '\n.L' + label_after +':'
    if len(block.children[2].nodes) > 0:
      s += blocks_to_assembly(block.children[2], variables)
    else:
      s += '\n  nop'
  # while
  elif len(block.children) == 2:
    while len(nodes) > 1:
      cfgnode = nodes.pop()
      astnodes = get_ast_exp_nodes(cfgnode.ast, [])
      astnodes.reverse()
      s += assembly_loop(astnodes, variables, '')

    cfgnode = nodes.pop()
    bool_label = cfgnode.label
    s += '\n.L' + str(bool_label) + ':'
    astnodes = get_ast_exp_nodes(cfgnode.ast, [])
    astnodes.reverse()
    s += assembly_loop(astnodes, variables, '')

    label_do = str(block.children[0].nodes[0].label)
    if len(block.children[1].nodes) > 0:
      label_after = str(block.children[1].nodes[0].label)
    else:
      label_after = str(ASTNode.count)
      ASTNode.count += 1

    s += '\n  bnez ' + stackmap[stack_height-1]+', .L' + label_do
    stack_height -= 1
    s += '\n  j .L' + label_after
    s += '\n.L' + label_do +':'
    s += blocks_to_assembly(block.children[0], variables)
    s += '\n j .L' + str(bool_label)
    s += '\n.L' + label_after +':'
    if len(block.children[1].nodes) > 0:
      s += blocks_to_assembly(block.children[1], variables)
    else:
      s += '\n  nop'
  else:
    while len(nodes) > 0:
      cfgnode = nodes.pop()
      astnodes = get_ast_exp_nodes(cfgnode.ast, [])
      astnodes.reverse()
      s += assembly_loop(astnodes, variables, '')
  nodes.reverse()
  return s

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
