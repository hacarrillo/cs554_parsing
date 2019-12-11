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
  ld s2, 24(a0)
  ld s4, 8(a0)
  ld s5, 16(a0)
  ld s6, 32(a0)
  li a3, 0
  mv s1, a3
  li a3, 1
  mv s4, a3
  li a3, 0
  mv s5, a3
  nop
  li a3, 1
  li a2, 0
  sub a3, s2, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L29
  j .L30
.L29:
  nop
  j .L135
.L30:
.L30:
  li a2, 0
  slt a2, s5, s2
  mv a3, a2
  bnez a3, .L31
  j .L136
.L31:
  add a3, s1, s4
  mv s6, a3
  mv s1, s4
  mv s4, s6
  li a3, 1
  add a3, s5, a3
  mv s5, a3
  nop
 j .L30
.L136:
  nop
.L135:
  nop
  sd s1, 0(a0)
  sd s2, 24(a0)
  sd s4, 8(a0)
  sd s5, 16(a0)
  sd s6, 32(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size test, .-test
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits