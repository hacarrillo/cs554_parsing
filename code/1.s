  .file "1.c"
  .option nopic
  .text
  .comm vars,56,8
  .align  1
  .globl 1
  .type 1, @function
1:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  ld s1, 0(a0)
  ld s2, 48(a0)
  ld s3, 8(a0)
  ld s4, 16(a0)
  ld s5, 24(a0)
  ld s6, 32(a0)
  ld s7, 40(a0)
  li a1, 123456789
  nop
  li a2, 111
  mv s3, a2
  li a2, 222
  nop
  li a3, 340
  nop
  li a4, 330
  mv s6, a4
  li a4, 222
  li a5, 340
  li a2, 0
  slt a2, a5, a4
  mv a4, a2
  bnez a4, .L23
  j .L24
.L23:
  nop
  j .L141
.L24:
.L24:
  li a4, 340
  li a2, 0
  addi a4, a4 ,1
  slt a2, s6, a4
  mv a4, a2
  bnez a4, .L25
  j .L142
.L25:
  li a4, 123456789
  li a5, 123456789
  li a2, 0
  sub a4, a4, a5
  seqz a2, a4
  mv a4, a2
  bnez a4, .L26
  j .L33
.L26:
  li a4, 1
  add a4, s6, a4
  mv s6, a4
  mul a4, s3, s3
  mv s3, a4
  li a4, 1000
  nop
  li a5, 125
  nop
  li a6, -180
  nop
  li a7, 726
  nop
  mv s2, s6
  j .L143
.L33:
  nop
.L143:
  nop
 j .L24
.L142:
  nop
.L141:
  nop
  sd s1, 0(a0)
  sd s2, 48(a0)
  sd s3, 8(a0)
  sd s4, 16(a0)
  sd s5, 24(a0)
  sd s6, 32(a0)
  sd s7, 40(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size 1, .-1
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits