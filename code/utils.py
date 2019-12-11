def is_exp(s):
  try:
    ans = eval(s)
    if isinstance(ans, int):
        return True
    else:
        return False
  except:
    return False

def simplify(exp_str):
  parts = exp_str.split()
  s = exp_str
  if ':=' in parts:
    exp = parts[2:]
    s = ''
    for n in exp:
      s += n
    exp = s
    if is_exp(exp):
      ans = eval(exp)
      ans = str(ans)
      s = ''
      for i in range(2):
        s += parts[i] + ' '
      s += ans
    else:
      s = exp_str
  return s

def to_string(l):
  s = ''
  for n in l:
    s += n + ' '
  return s
