{-
Test program for constant folding 
The output should be 1129
-}


a := 15 + 15;
b := 20 + 20;
c := 30 + 30;
d := 10 * 10 * 10;

e := 1 * 1;
while e < 2 do
    result := a + b + c + d - e;
    e := e + 1;
    od;