  .file "example39.c"
  .option nopic
  .text
  .comm vars,8,8
  .align  1
  .globl example39
  .type example39, @function
example39:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  nop
  nop
  li a3, 9223372036854774808
  li a4, -100000
  li a2, 0
  slt a2, a3, a4
  mv a3, a2
  bnez a3, .L13
  j .L14
.L13:
  li a3, 1
  sd a3, 0(a0)
  j .L57
.L14:
  li a3, 2
  sd a3, 0(a0)
.L57:
  nop
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size example39, .-example39
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits