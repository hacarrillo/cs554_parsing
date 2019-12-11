{-
Test program for liveness analysis
Output should be 333
-}

x := 15 + 15;
y := 20 + 20;
z := 30 + 30;

m := 1 + 10 + 100 + 100 * 256;
n := 18 + 18 + 18 + 18;
q := 10 * 10 * 10;

a := 2 * 2;
b := 1 * 1;
c := 0;
output := 0;

if a > b then
    output := 333;
else
    skip;

fi;