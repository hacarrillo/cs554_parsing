  .file "p3.c"
  .option nopic
  .text
  .comm vars,8,8
  .align  1
  .globl p3
  .type p3, @function
p3:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  ld s1, 0(a0)
  nop
  nop
  nop
  nop
  li a3, 1
  mv s1, a3
.L21:
  li a3, 2
  li a2, 0
  slt a2, s1, a3
  mv a3, a2
  bnez a3, .L22
  j .L110
.L22:
  nop
  li a3, 1
  add a3, s1, a3
  mv s1, a3
 j .L21
.L110:
  nop
  sd s1, 0(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size p3, .-p3
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits