-- constant folding simple and liveness analysis (x is never used)
-- Output: y (should be 19)

x := 14;
y := 7 + 14 - 2;
y * (28 / 14 + 2);