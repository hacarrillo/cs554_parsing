{-
Division
Input: dividend, divisor
Output: result
-}

quotient := 0;
neg := dividend * divisor;

if neg < 0 then
    sign := -1;
    sign := -1;
else
    sign := 1;
fi;

while dividend >= divisor do
    quotient := quotient + 1;
    dividend := dividend - divisor;
od;

result := sign * quotient
