{-
    useful Input:
        range: search range from [2, range]
    tmp variable:
         result, count, k, i
    output:
        result: how many prime numbers exist between [2, range]
-}

result := 0;
while range >= 2 do
    count := 0;
    i := 2;

    while i * i <= range do
        k := range;
        if count > 0 then
            skip;
        else
            while k >= 1 do
                if k * i = range then
                    count := count + 1;
                else
                     skip;
                fi;
                k := k - 1;
            od;
        fi;
        i := i + 1;
    od;

    if count > 0 then
        skip;
    else
        result := 1 + result;
    fi;
    range := range - 1;
od;

