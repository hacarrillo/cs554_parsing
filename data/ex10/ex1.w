{-
Division
Input: dividend, divisor
Output: result
-}

dividend := 22;
divisor := 2;
quotient := 0;
neg := dividend * divisor;

if neg < 0 then
    sign := -1
else
    sign := 1;
fi;

while dividend >= divisor do
    quotient := quotient + 1;
    dividend := dividend - divisor;
od;

result := sign * quotient
