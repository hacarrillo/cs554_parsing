  .file "ex1.c"
  .option nopic
  .text
  .comm vars,24,8
  .align  1
  .globl ex1
  .type ex1, @function
ex1:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  li a1, 0
  sd a1, 0(a0)
  li a1, 0
  sd a1, 8(a0)
  li a1, 0
  sd a1, 16(a0)
  j .L3
.L2:
  li a1, 0
  sd a1, 0(a0)
  j .L5
.L4:
  ld a1, 0(a0)
  ld a2, 8(a0)
  add a1, a1, a2
  ld a2, 16(a0)
  add a1, a1, a2
  sd a1, 16(a0)
  ld a1, 0(a0)
  li a2, 1
  add a1, a1, a2
  sd a1, 0(a0)
.L5:
  ld a1, 0(a0)
  li a2, 3
  sub a1, a1, a2
  sltz a1, a1
  bnez a1, .L4
  ld a1, 8(a0)
  li a2, 1
  add a1, a1, a2
  sd a1, 8(a0)
  nop
.L3:
  ld a1, 8(a0)
  li a2, 3
  sub a1, a1, a2
  sltz a1, a1
  bnez a1, .L2
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size ex1, .-ex1
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits