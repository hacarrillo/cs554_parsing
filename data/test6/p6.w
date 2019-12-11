{-
This example is meant to test out compiler to demonstrate complete coverage of the language features.
It uses all types of statements: variable assignments, skip, boolean expressions (<, > , =), if than else statements and while statements 
Input: a, w, x, y, z
Output: output 340
-}

a := 123456789;
w := 1111;
x := 2220;
y := 340000000;
z := 330;

if x > y or z > y then
    skip;
else
    while z < y do
        if a = 123456789 then
            z := z + 1;
            w := w * w * 44 * 158 * 196;
            m := 100 * 10000000 * 10;
            m := 5 * 5 * 5;
            m := 100 - 10 * 28;
            m := 333333 * 22333 * 12333336 * 45336;
            output := z;
        else
            skip;
        fi;
    od;
fi;
