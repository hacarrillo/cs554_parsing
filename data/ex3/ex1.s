  .file "ex1.c"
  .option nopic
  .text
  .comm vars,16,8
  .align  1
  .globl ex1
  .type ex1, @function
ex1:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  li a1, 0
  sd a1, 0(a0)
  li a1, 1
  sd a1, 8(a0)
  .L3
.L2
  ld t2, 0(a0)
  ld a1, 8(a0)
  add t2, t2, a1
  sd t2, 0(a0)
  .L5
.L4
  ld t1, 0(a0)
  ld t2, 8(a0)
  add t1, t1, t2
  sd t1, 0(a0)
.L5
  ld t1, 8(a0)
  li t2, 10
  sub t1, t1, t2
  sltz t1, t1
  bgtz t1 .L4
.L3
  ld t1, 8(a0)
  li t2, 10
  sub t1, t1, t2
  sltz t1, t1
  bgtz t1 .L2
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size ex1, .-ex1
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits