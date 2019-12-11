{-
This example is meant to test out compiler to demonstrate complete coverage of the language features.
It uses all types of statements: variable assignments, skip, boolean expressions (<, > , =), if than else statements and while statements 
Input: a, w, x, y, z
Output: output 340
-}

a := 123456789;
w := 111;
x := 222;
y := 340;
z := 330;

if x > y then
    skip;
else
    while z <= y do
        if a = 123456789 then
            z := z + 1;
            w := w * w;
            m := 10 * 10 * 10;
            m := 5 * 5 * 5;
            m := 100 - 10 * 28;
            m := 33 * 22;
            output := z;
        else
            skip;
        fi;
    od;
fi;
