  .file "test.c"
  .option nopic
  .text
  .comm vars,40,8
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
  ld s6, 32(a0)
  li a3, 0
  mv s1, a3
  mul a3, s2, s3
  mv s5, a3
  li a3, 0
  li a2, 0
  slt a2, s5, a3
  mv a3, a2
  bnez a3, .L23
  j .L25
.L23:
  nop
  li a3, -1
  mv s6, a3
  j .L26
.L25:
  li a3, 1
  mv s6, a3
.L26:
.L26:
  li a2, 0
  addi s2, s2 ,1
  slt a2, s3, s2
  mv a3, a2
  addi s2, s2 ,-1
  bnez a3, .L27
  j .L29
.L27:
  li a3, 1
  add a3, s1, a3
  mv s1, a3
  sub a3, s2, s3
  mv s2, a3
 j .L26
.L29:
  nop
  sd s1, 0(a0)
  sd s2, 16(a0)
  sd s3, 24(a0)
  sd s5, 8(a0)
  sd s6, 32(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size test, .-test
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits