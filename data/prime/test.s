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
  ld s2, 8(a0)
  ld s4, 16(a0)
  ld s5, 24(a0)
  ld s6, 32(a0)
  li a3, 0
  mv s1, a3
.L37:
  li a3, 2
  li a2, 0
  addi s2, s2 ,1
  slt a2, a3, s2
  mv a3, a2
  addi s2, s2 ,-1
  bnez a3, .L38
  j .L234
.L38:
  li a3, 0
  mv s4, a3
  li a3, 2
  mv s5, a3
.L40:
  mul a3, s5, s5
  li a2, 0
  addi s2, s2 ,1
  slt a2, a3, s2
  mv a3, a2
  addi s2, s2 ,-1
  bnez a3, .L41
  j .L50
.L41:
  mv s6, s2
  li a3, 0
  li a2, 0
  slt a2, a3, s4
  mv a3, a2
  bnez a3, .L43
  j .L44
.L43:
  nop
  j .L49
.L44:
.L44:
  li a3, 1
  li a2, 0
  addi s6, s6 ,1
  slt a2, a3, s6
  mv a3, a2
  addi s6, s6 ,-1
  bnez a3, .L45
  j .L235
.L45:
  mul a3, s6, s5
  li a2, 0
  sub a3, a3, s2
  seqz a2, a3
  mv a3, a2
  bnez a3, .L46
  j .L47
.L46:
  li a3, 1
  add a3, s4, a3
  mv s4, a3
  j .L48
.L47:
  nop
.L48:
  li a3, 1
  sub a3, s6, a3
  mv s6, a3
 j .L44
.L235:
  nop
.L49:
  li a3, 1
  add a3, s5, a3
  mv s5, a3
 j .L40
.L50:
  li a3, 0
  li a2, 0
  slt a2, a3, s4
  mv a3, a2
  bnez a3, .L51
  j .L52
.L51:
  nop
  j .L53
.L52:
  li a3, 1
  add a3, a3, s1
  mv s1, a3
.L53:
  li a3, 1
  sub a3, s2, a3
  mv s2, a3
 j .L37
.L234:
  nop
  sd s1, 0(a0)
  sd s2, 8(a0)
  sd s4, 16(a0)
  sd s5, 24(a0)
  sd s6, 32(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size test, .-test
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits