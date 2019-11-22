class ASTNode:
  count = 0
  def __init__(self, name, label = None, leader = False, parent = None):
    self.name = name
    self.count = ASTNode.count
    ASTNode.count = ASTNode.count + 1
    self.parent = parent
    self.children = []
    
    if label != None: 
      self.label = int(label)
    else:
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
  def __init__(self, name, label = None):
    self.name = name
    self.parents = []
    self.children = []
    self.count = CFGNode.count
    if label != None: 
      self.label = int(label)
    else:
      self.label = label
    CFGNode.count = CFGNode.count + 1
   
  def add_child(self, child): 
    if isinstance(child, CFGNode):
      self.children.append(child)
      child.parents.append(self)

  def __repr__(self):
    return self.__str__()
    
  def __str__(self):
    return str(self.name)

  def __eq__(self, other):
    if isinstance(other, CFGNode):
      return self.count == other.count
    return False


