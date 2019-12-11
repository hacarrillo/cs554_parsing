  .file "p1.c"
  .option nopic
  .text
  .comm vars,56,8
  .align  1
  .globl p1
  .type p1, @function
p1:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  li a1, 123456789
  sd a1, 0(a0)
  li a1, 111
  sd a1, 8(a0)
  li a1, 222
  sd a1, 16(a0)
  li a1, 331
  sd a1, 24(a0)
  li a1, 330
  sd a1, 32(a0)
  ld a1, 16(a0)
  ld a2, 24(a0)
  li s1, 0
  slt s1, a2, a1
  mv a1, s1
  beqz a1, .L2
  nop
  j .L3
.L2:
  j .L5
.L4:
  ld a1, 0(a0)
  li a2, 123456789
  li s1, 0
  sub a1, a1, a2
  seqz s1, a1
  mv a1, s1
  beqz a1, .L6
  ld a1, 32(a0)
  li a2, 1
  add a1, a1, a2
  sd a1, 32(a0)
  ld a1, 8(a0)
  ld a2, 8(a0)
  mul a1, a1, a2
  sd a1, 8(a0)
  li a1, 10
  li a2, 10
  mul a1, a1, a2
  li a2, 10
  mul a1, a1, a2
  sd a1, 40(a0)
  li a1, 5
  li a2, 5
  mul a1, a1, a2
  li a2, 5
  mul a1, a1, a2
  sd a1, 40(a0)
  li a1, 100
  li a2, 10
  li a3, 28
  mul a2, a2, a3
  sub a1, a1, a2
  sd a1, 40(a0)
  li a1, 33
  li a2, 22
  mul a1, a1, a2
  sd a1, 40(a0)
  ld a1, 32(a0)
  sd a1, 48(a0)
  j .L7
.L6:
  nop
.L7:
.L5:
  ld a1, 32(a0)
  ld a2, 24(a0)
  li s1, 0
  addi a2,a2,1
  slt s1, a1, a2
  bnez a1, .L4
.L3:
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size p1, .-p1
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits