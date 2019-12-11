  .file "p4.c"
  .option nopic
  .text
  .comm vars,8,8
  .align  1
  .globl p4
  .type p4, @function
p4:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  nop
  nop
  nop
  nop
  nop
  li a3, 1118580
  sd a3, 0(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size p4, .-p4
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits