-- compute the sum of all 9 elements of the product of two 3x3 matrices

c_0_0 := 0;
c_0_1 := 0;
c_0_2 := 0;
c_1_0 := 0;
c_1_1 := 0;
c_1_2 := 0;
c_2_0 := 0;
c_2_1 := 0;
c_2_2 := 0;
i := 0;
while i < 3 do
  j := 0;
  while j < 3 do
    s := 0;
    k := 0;
    while k < 3 do
      if i = 0 then
        if k = 0 then
	   a := a_0_0
	else if k = 1 then
	   a := a_0_1
	else if k = 2 then
	   a := a_0_2
	else
	   a := 0
	fi fi fi
      else if i = 1 then
        if k = 0 then
	   a := a_1_0
	else if k = 1 then
	   a := a_1_1
	else if k = 2 then
	   a := a_1_2
	else
	   a := 0
	fi fi fi
      else if i = 2 then
        if k = 0 then
	   a := a_2_0
	else if k = 1 then
	   a := a_2_1
	else if k = 2 then
	   a := a_2_2
	else
	   a := 0
	fi fi fi
      else
        a := 0
      fi fi fi;
      if k = 0 then
        if j = 0 then
	   b := b_0_0
	else if j = 1 then
	   b := b_0_1
	else if j = 2 then
	   b := b_0_2
	else
	   b := 0
	fi fi fi
      else if k = 1 then
        if j = 0 then
	   b := b_1_0
	else if j = 1 then
	   b := b_1_1
	else if j = 2 then
	   b := b_1_2
	else
	   b := 0
	fi fi fi
      else if k = 2 then
        if j = 0 then
	   b := b_2_0
	else if j = 1 then
	   b := b_2_1
	else if j = 2 then
	   b := b_2_2
	else
	   b := 0
	fi fi fi
      else
        b := 0
      fi fi fi;
      s := s + a * b;
      k := k + 1
    od;
    if i = 0 then
      if j = 0 then
        c_0_0 := s
      else if j = 1 then
        c_0_1 := s
      else if j = 2 then
        c_0_2 := s
      else
        skip
      fi fi fi
    else if i = 1 then
      if j = 0 then
        c_1_0 := s
      else if j = 1 then
        c_1_1 := s
      else if j = 2 then
        c_1_2 := s
      else
        skip
      fi fi fi
    else if i = 2 then
      if j = 0 then
        c_2_0 := s
      else if j = 1 then
        c_2_1 := s
      else if j = 2 then
        c_2_2 := s
      else
        skip
      fi fi fi
    else
      skip
    fi fi fi;
    j := j + 1
  od;
  i := i + 1
od;
t := 0;
i := 0;
while i < 3 do
  j := 0;
  while j < 3 do
    if i = 0 then
      if j = 0 then
        c := c_0_0
      else if j = 1 then
        c := c_0_1
      else if j = 2 then
        c := c_0_2
      else
        c := 0
      fi fi fi
    else if i = 1 then
      if j = 0 then
        c := c_1_0
      else if j = 1 then
        c := c_1_1
      else if j = 2 then
        c := c_1_2
      else
        c := 0
      fi fi fi
    else if i = 2 then
      if j = 0 then
        c := c_2_0
      else if j = 1 then
        c := c_2_1
      else if j = 2 then
        c := c_2_2
      else
        c := 0
      fi fi fi
    else
      c := 0
    fi fi fi;
    t := t + c;
    j := j +1
  od;
  i := i + 1
od;
output := t

