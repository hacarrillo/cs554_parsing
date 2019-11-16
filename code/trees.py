class ASTNode:
  count = 0
  def __init__(self, name, label = None, leader = False, parent = None):
    self.name = name
    self.count = ASTNode.count
    ASTNode.count = ASTNode.count + 1
    self.parent = parent
    self.children = []
    
    self.label = label
    self.leader = leader
   
  def set_fine_label(self, label):
    self.fine_label = label
   
  def add_child(self, child):
    if isinstance(child, ASTNode):
      self.children.append(child)

  def __repr__(self):
    return str(self.name)
    #return str(self.name) + ' ' + str(self.count) + ' ' + str(self.label)
    
  def __str__(self):
    return str(self.name)
    #return str(self.name) + ' ' + str(self.count) + ' ' + str(self.label)

  def traverse(self):
    print(self)
    for child in self.children:
      child.traverse()

  def __eq__(self, other):
    if isinstance(other, ASTNode):
      return self.count == other.count
    return False

class CFGNode:
  count = 0
  def __init__(self, name, parent = None):
    self.name = name
    self.parent = parent
    self.children = []
    self.count = CFGNode.count
    ASTNode.count = CFGNode.count + 1
   
  def add_child(self, child): 
    if isinstance(child, CFGNode):
      self.children.append(child)

  def __repr__(self):
    return str(self.name)
    #return str(self.name) + ' ' + str(self.count) + ' ' + str(self.label)
    
  def __str__(self):
    return str(self.name)
    #return str(self.name) + ' ' + str(self.count) + ' ' + str(self.label)

  def traverse(self):
    for child in self.children:
      print(child)
    
    for child in self.children:
      child.traverse()
    
  def __eq__(self, other):
    if isinstance(other, CFGNode):
      return self.count == other.count
    return False


