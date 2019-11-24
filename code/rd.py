class RD:
  def __init__(self, x, label = None, node = None):
    self.x = x
    if label != None: 
      self.label = int(label)
    else:
      self.label = label
    self.node = node

  def __eq__(self, other):
    if isinstance(other, RD):
      return self.x == other.x and self.label == other.label
    return False

  def __repr__(self):
    return self.__str__()

  def __str__(self):
    return "(" + str(self.x) + " " + str(self.label) + ")"

class RDSet:
  def __init__(self):
    self.set = []
  
  def append(self, rd):
    found = None
    for i, s in enumerate(self.set):
      if s.x == rd.x and s.label == rd.label:
        found = s
        break

    if found == None:
      self.set.append(rd)

    return

  def copy(self):
    rds = RDSet() 
    for rd in self.set:
      rds.append(RD(rd.x, rd.label, rd.node))
    return rds

  def union(self, rdset):
    for rd in rdset.set:
      self.append(rd)
    return

  def getx(self, x):
    rds = []
    for rd in self.set:
      if rd.x == x:
        rds.append(rd)
    return rds

  def getl(self, label):
    for rd in self.set:
      if rd.label == label:
        return rd
    return None

  def remove(self, var):
    rd_remove = []
    for rd in self.set:
      if rd.x == var:
        rd_remove.append(rd)

    for rd in rd_remove:
      self.set.remove(rd)  

  def __str__(self):
    s = 'RD' + '['
    for rd in self.set:
      s += rd.__str__() + ', '
    s += ']'
    return s

  def __repr__(self):
    return self.__str__()

  def __eq__(self, other):
    for rd in other.set:
      if rd not in self.set:
        return False
    for rd in self.set:
      if rd not in other.set:
        return False
    return True
  
if __name__ == "__main__":
  import inspect
  '''
  x = lambda y : y + 2
  print(inspect.getsource(x))
  '''
  
  r1 = RD('x',1)
  r2 = RD('y',2)
  r3 = RD('y',2)
  r4 = RD('x')
  r5 = RD('x',3)
  r6 = RD('z',4)

  rds1 = RDSet(0) 
  rds2 = RDSet(1) 
  rds1.append(r6)
  rds1.append(r1)
  rds1.append(r2)
  rds1.append(r4)
  rds2.append(r3)
  rds2.append(r1)
  rds2.append(r5)

