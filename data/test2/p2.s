  .file "p2.c"
  .option nopic
  .text
  .comm vars,32,8
  .align  1
  .globl p2
  .type p2, @function
p2:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  ld s2, 24(a0)
  ld s3, 8(a0)
  ld s4, 16(a0)
  ld s1, 0(a0)
  nop
  li a3, 1111
  mv s1, a3
  nop
  nop
  li a3, 3300
  mv s3, a3
  li a3, 2222
  li a4, 340000000
  li a2, 0
  slt a2, a4, a3
  mv a3, a2
  bnez a3, .L54
  j .L55
.L54:
  nop
  j .L297
.L55:
.L55:
  li a3, 340000000
  li a2, 0
  slt a2, s3, a3
  mv a3, a2
  bnez a3, .L56
  j .L298
.L56:
  li a3, 123456789
  li a4, 123456789
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L57
  j .L71
.L57:
  li a3, 1
  add a3, s3, a3
  mv s3, a3
  mul a3, s1, s1
  mv s1, a3
  nop
  li a3, -11111010
  li a4, -11111010
  mul a3, a3, a4
  li a4, 2222
  mul a3, a3, a4
  li a4, 1111
  mul a3, a3, a4
  mv s4, a3
  nop
  nop
  nop
  nop
  li a3, 1
  li a4, 1
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L66
  j .L70
.L66:
  nop
  nop
  nop
  li a3, 888
  mv s2, a3
  j .L300
.L70:
  li a3, 999
  mv s2, a3
.L300:
  nop
  j .L299
.L71:
  nop
.L299:
  nop
 j .L55
.L298:
  nop
.L297:
  nop
  sd s3, 8(a0)
  sd s2, 24(a0)
  sd s1, 0(a0)
  sd s4, 16(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size p2, .-p2
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits