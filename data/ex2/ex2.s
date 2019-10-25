  .file "ex2.c"
  .option nopic
  .text
  .comm vars,24,8
  .align  1
  .globl ex2
  .type ex2, @function
ex2:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  li a1, 1
  ld a2, 8(a0)
  add a1, a1, a2
  li a2, 1
  ld a3, 16(a0)
  add a2, a2, a3
  mul a1, a1, a2
  sd a1, 0(a0)
  ld a1, 0(a0)
  ld a2, 8(a0)
  add a1, a1, a2
  ld a2, 16(a0)
  add a1, a1, a2
  sd a1, 16(a0)
  ld a1, 8(a0)
  li a2, 2
  sub a1, a1, a2
  sd a1, 8(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size ex2, .-ex2
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits