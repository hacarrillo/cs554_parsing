  .file "ex.c"
  .option nopic
  .text
  .comm vars,40,8
  .align  1
  .globl ex
  .type ex, @function
ex:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  ld a1, 8(a0)
  sd a1, 0(a0)
  li a1, 1
  li a2, 4
  add a1, a1, a2
  sd a1, 16(a0)
  li a1, 2
  ld a2, 16(a0)
  add a1, a1, a2
  sd a1, 24(a0)
  ld a1, 24(a0)
  ld a2, 16(a0)
  add a1, a1, a2
  sd a1, 32(a0)
  j .L3
.L2:
  li a1, 2
  sd a1, 16(a0)
  li a1, 4
  sd a1, 16(a0)
  ld a1, 16(a0)
  ld a2, 0(a0)
  mul a1, a1, a2
  sd a1, 16(a0)
  ld a1, 0(a0)
  li a2, 1
  sub a1, a1, a2
  sd a1, 0(a0)
.L3:
  ld a1, 0(a0)
  li a2, 0
  sub a1, a1, a2
  sltz a1, a1
  bnez a1, .L2
  li a1, 0
  sd a1, 0(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size ex, .-ex
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits