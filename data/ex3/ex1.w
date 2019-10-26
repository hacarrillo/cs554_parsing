b := 0;
a := 0;
c := 0;
while a < 3 do
  b := 0;
  while b < 3 do
    c := b + a + c;
    b := b + 1;
  od;
  a := a + 1;
od;
