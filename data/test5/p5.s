  .file "p5.c"
  .option nopic
  .text
  .comm vars,8,8
  .align  1
  .globl p5
  .type p5, @function
p5:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  li a3, 0
  sd a3, 0(a0)
  li a3, 4
  li a4, 1
  li a2, 0
  slt a2, a4, a3
  mv a3, a2
  bnez a3, .L37
  j .L38
.L37:
  li a3, 333
  sd a3, 0(a0)
  j .L142
.L38:
  nop
.L142:
  nop
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size p5, .-p5
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits