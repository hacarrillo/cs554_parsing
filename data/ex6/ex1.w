length := 1;
x := 0;
y := 1;
iteration := 0;
r := 0;

if length = 1 then
    r := x
else
    while iteration < length do
    z := x + y;
    x := y;
    y := z;
    iteration := iteration + 1;
    r := x;
od;
fi;
