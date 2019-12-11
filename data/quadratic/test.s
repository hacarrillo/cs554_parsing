  .file "test.c"
  .option nopic
  .text
  .comm vars,120,8
  .align  1
  .globl test
  .type test, @function
test:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  ld s1, 0(a0)
  ld s3, 16(a0)
  ld s4, 8(a0)
  ld s5, 32(a0)
  ld s6, 88(a0)
  ld s7, 96(a0)
  ld s8, 48(a0)
  ld s9, 56(a0)
  ld s10, 64(a0)
  ld s11, 72(a0)
  mul a3, s4, s4
  li a4, 4
  mul a4, a4, s3
  ld a5, 24(a0)
  mul a4, a4, a5
  sub a3, a3, a4
  mv s1, a3
  li a3, 0
  li a2, 0
  slt a2, s1, a3
  mv a3, a2
  bnez a3, .L88
  j .L89
.L88:
  nop
  j .L610
.L89:
  li a3, 0
  li a2, 0
  sub a3, s1, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L90
  j .L92
.L90:
  li a3, 1
  mv s5, a3
  li a3, 0
  sd a3, 40(a0)
  j .L110
.L92:
  li a3, 2
  mv s5, a3
  nop
  li a3, 0
  mv s8, a3
  li a3, 1
  mv s9, a3
.L96:
  li a3, 50
  li a4, 0
  li a2, 0
  slt a2, a4, a3
  mv a3, a2
  li a2, 0
  sub a4, s8, s9
  seqz a2, a4
  mv a4, a2
  not a4, a4
  add a3, a3, a4
  li a4, 1
  slt a3, a4, a3
  bnez a3, .L97
  j .L109
.L97:
  mv s8, s9
  li a3, 0
  mv s10, a3
  mv s11, s1
.L100:
  li a2, 0
  addi s11, s11 ,1
  slt a2, s9, s11
  mv a3, a2
  addi s11, s11 ,-1
  bnez a3, .L101
  j .L103
.L101:
  li a3, 1
  add a3, s10, a3
  mv s10, a3
  sub a3, s11, s9
  mv s11, a3
 j .L100
.L103:
  add a3, s9, s10
  mv s11, a3
  li a3, 0
  mv s10, a3
.L105:
  li a3, 2
  li a2, 0
  addi s11, s11 ,1
  slt a2, a3, s11
  mv a3, a2
  addi s11, s11 ,-1
  bnez a3, .L106
  j .L108
.L106:
  li a3, 1
  add a3, s10, a3
  mv s10, a3
  li a3, 2
  sub a3, s11, a3
  mv s11, a3
 j .L105
.L108:
  mv s9, s10
 j .L96
.L109:
  sd s9, 40(a0)
.L110:
  li a3, 2
  mul a3, a3, s3
  sd a3, 80(a0)
  li a3, 0
  sub a3, a3, s4
  ld a4, 40(a0)
  sub a3, a3, a4
  mv s6, a3
  li a3, 0
  mv s7, a3
.L113:
  ld a3, 80(a0)
  li a2, 0
  addi s6, s6 ,1
  slt a2, a3, s6
  mv a3, a2
  addi s6, s6 ,-1
  bnez a3, .L114
  j .L116
.L114:
  li a3, 1
  add a3, s7, a3
  mv s7, a3
  ld a3, 80(a0)
  sub a3, s6, a3
  mv s6, a3
 j .L113
.L116:
.L116:
  li a3, 0
  ld a4, 80(a0)
  sub a3, a3, a4
  li a2, 0
  addi a3, a3 ,1
  slt a2, s6, a3
  mv a3, a2
  bnez a3, .L117
  j .L119
.L117:
  li a3, 1
  sub a3, s7, a3
  mv s7, a3
  ld a3, 80(a0)
  add a3, s6, a3
  mv s6, a3
 j .L116
.L119:
  li a3, 1
  li a2, 0
  slt a2, a3, s5
  mv a3, a2
  bnez a3, .L120
  j .L128
.L120:
  li a3, 0
  sub a3, a3, s4
  ld a4, 40(a0)
  add a3, a3, a4
  sd a3, 104(a0)
  li a3, 0
  sd a3, 112(a0)
.L122:
  ld a3, 104(a0)
  ld a4, 80(a0)
  li a2, 0
  addi a3, a3 ,1
  slt a2, a4, a3
  mv a3, a2
  bnez a3, .L123
  j .L125
.L123:
  ld a3, 112(a0)
  li a4, 1
  add a3, a3, a4
  sd a3, 112(a0)
  ld a3, 104(a0)
  ld a4, 80(a0)
  sub a3, a3, a4
  sd a3, 104(a0)
 j .L122
.L125:
.L125:
  ld a3, 104(a0)
  li a4, 0
  ld a5, 80(a0)
  sub a4, a4, a5
  li a2, 0
  addi a4, a4 ,1
  slt a2, a3, a4
  mv a3, a2
  bnez a3, .L126
  j .L612
.L126:
  ld a3, 112(a0)
  li a4, 1
  sub a3, a3, a4
  sd a3, 112(a0)
  ld a3, 104(a0)
  ld a4, 80(a0)
  add a3, a3, a4
  sd a3, 104(a0)
 j .L125
.L612:
  nop
  j .L611
.L128:
  nop
.L611:
  nop
.L610:
  nop
  sd s1, 0(a0)
  sd s3, 16(a0)
  sd s4, 8(a0)
  sd s5, 32(a0)
  sd s6, 88(a0)
  sd s7, 96(a0)
  sd s8, 48(a0)
  sd s9, 56(a0)
  sd s10, 64(a0)
  sd s11, 72(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size test, .-test
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits