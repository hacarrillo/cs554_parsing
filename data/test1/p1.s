  .file "p1.c"
  .option nopic
  .text
  .comm vars,24,8
  .align  1
  .globl p1
  .type p1, @function
p1:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  ld s2, 16(a0)
  ld s3, 8(a0)
  ld s1, 0(a0)
  nop
  li a3, 1111
  mv s1, a3
  nop
  nop
  li a3, 330
  mv s3, a3
  li a3, 2220
  li a4, 340000000
  li a2, 0
  slt a2, a4, a3
  mv a3, a2
  bnez a3, .L40
  j .L41
.L40:
  nop
  j .L215
.L41:
.L41:
  li a3, 340000000
  li a2, 0
  slt a2, s3, a3
  mv a3, a2
  bnez a3, .L42
  j .L216
.L42:
  li a3, 123456789
  li a4, 123456789
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L43
  j .L50
.L43:
  li a3, 1
  add a3, s3, a3
  mv s3, a3
  mul a3, s1, s1
  li a4, 44
  mul a3, a3, a4
  li a4, 158
  mul a3, a3, a4
  li a4, 196
  mul a3, a3, a4
  mv s1, a3
  nop
  nop
  nop
  nop
  mv s2, s3
  j .L217
.L50:
  nop
.L217:
  nop
 j .L41
.L216:
  nop
.L215:
  nop
  sd s3, 8(a0)
  sd s2, 16(a0)
  sd s1, 0(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size p1, .-p1
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits