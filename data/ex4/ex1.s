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
  ld a1, 0(a0)
  li a2, 3
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L2
  ld a1, 0(a0)
  li a2, 3
  add a1, a1, a2
  sd a1, 0(a0)
  j .L3
.L2:
  ld t2, 0(a0)
  li a1, 10
  add t2, t2, a1
  sd t2, 0(a0)
.L3:
  li t1, 16
  sd t1, 8(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size ex1, .-ex1
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits