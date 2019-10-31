  .file "ex1.c"
  .option nopic
  .text
  .comm vars,8,8
  .align  1
  .globl ex1
  .type ex1, @function
ex1:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  li a1, 1
  li a2, 2
  add a1, a1, a2
  li a2, 3
  li a3, 4
  add a2, a2, a3
  mul a1, a1, a2
  sd a1, 0(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size ex1, .-ex1
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits