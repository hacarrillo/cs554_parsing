  .file "test.c"
  .option nopic
  .text
  .comm vars,32,8
  .align  1
  .globl test
  .type test, @function
test:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  ld s1, 0(a0)
  ld s2, 16(a0)
  ld s3, 24(a0)
  ld s5, 8(a0)
  li a3, 1
  mv s1, a3
  li a3, 0
  mv s5, a3
.L12:
  li a2, 0
  slt a2, s5, s2
  mv a3, a2
  bnez a3, .L13
  j .L66
.L13:
  mul a3, s1, s3
  mv s1, a3
  li a3, 1
  add a3, s5, a3
  mv s5, a3
 j .L12
.L66:
  nop
  sd s1, 0(a0)
  sd s2, 16(a0)
  sd s3, 24(a0)
  sd s5, 8(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size test, .-test
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits