{-
Simple test program for constant folding simple and liveness analysis (x is never used)
Output: y (should be 7450)
-}

x := 14;
z := 1 + 3 + 8;
w := 3 * 3 * 123456;
y := 7 + 14 - 2;
y := y * 28 * 14 + 2;
result := x + z + w + y;