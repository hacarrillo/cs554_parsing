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
  li a1, 2
  sd a1, 0(a0)
  li a1, 100
  sd a1, 8(a0)
  j .L3
.L2:
  ld t2, 0(a0)
  ld a1, 0(a0)
  mul t2, t2, a1
  sd t2, 0(a0)
  ld t2, 8(a0)
  li a1, 1
  add t2, t2, a1
  sd t2, 8(a0)
.L3:
  ld t2, 0(a0)
  ld a1, 8(a0)
  sub t2, t2, a1
  sltz t2, t2
  bnez t2, .L2
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size ex1, .-ex1
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits