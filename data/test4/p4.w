{-
Simple test program for constant folding simple and liveness analysis (x is never used)
Output: result should be result 1118580
-}

x := 14;
z := 1 + 3 + 8;
w := 3 * 3 * 123456;
y := 7 + 14 - 2;
y := y * 28 * 14 + 2;
output := x + z + w + y;