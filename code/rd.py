class RD:
  def __init__(self, x, l = None):
    self.x = x
    if l != None: 
      self.l = int(l)
    else:
      self.l = l

  def __eq__(self, other):
    if isinstance(other, RD):
      return self.x == other.x and self.l == other.l
    return False

  def __repr__(self):
    return self.__str__()

  def __str__(self):
    return "(" + str(self.x) + " " + str(self.l) + ")"

class RDSet:
  def __init__(self, label):
    self.set = []
    if label != None: 
      self.label = int(label)
    else:
      self.label = label
  
  def append(self, rd):
    found = None
    for i, s in enumerate(self.set):
      if s.x == rd.x and (rd.l == None or s.l == None or s.l == rd.l):
        found = s
        break

    if found == None:
      self.set.append(rd)
      return True
    elif found.l == None: 
      found.l = rd.l
      return True
       
    return False

  def __add__(self, rdset):
    for rd in rdset.set:
      self.append(rd)
    return self

  def remove(self, var):
    rd_remove = []
    for rd in self.set:
      if rd.x == var:
        rd_remove.append(rd)

    for rd in rd_remove:
      self.set.remove(rd)  

  def __str__(self):
    s = 'RD' + str(self.label) + '['
    for rd in self.set:
      s += rd.__str__() + ', '
    s += ']'
    return s

  def __repr__(self):
    return self.__str__()
  
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

