  .file "test.c"
  .option nopic
  .text
  .comm vars,128,8
  .align  1
  .globl test
  .type test, @function
test:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  ld a1, 8(a0)
  ld a2, 8(a0)
  mul a1, a1, a2
  li a2, 4
  ld a3, 16(a0)
  mul a2, a2, a3
  ld a3, 24(a0)
  mul a2, a2, a3
  sub a1, a1, a2
  sd a1, 0(a0)
  ld a1, 0(a0)
  li a2, 0
  sub a1, a1, a2
  sltz a1, a1
  beqz a1, .L2
  li a1, 0
  sd a1, 32(a0)
  j .L3
.L2:
  ld a1, 0(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L4
  li a1, 1
  sd a1, 32(a0)
  li a1, 0
  sd a1, 40(a0)
  j .L5
.L4:
  li a1, 2
  sd a1, 32(a0)
  li a1, 50
  sd a1, 48(a0)
  li a1, 0
  sd a1, 56(a0)
  li a1, 1
  sd a1, 64(a0)
  j .L7
.L6:
  ld a1, 64(a0)
  sd a1, 56(a0)
  li a1, 0
  sd a1, 72(a0)
  ld a1, 0(a0)
  sd a1, 80(a0)
  j .L9
.L8:
  ld a1, 72(a0)
  li a2, 1
  add a1, a1, a2
  sd a1, 72(a0)
  ld a1, 80(a0)
  ld a2, 64(a0)
  sub a1, a1, a2
  sd a1, 80(a0)
.L9:
  ld a1, 80(a0)
  ld a2, 64(a0)
  addi a1,a1,1
  slt a1, a2, a1
  bnez a1, .L8
  ld a1, 64(a0)
  ld a2, 72(a0)
  add a1, a1, a2
  sd a1, 80(a0)
  li a1, 0
  sd a1, 72(a0)
  j .L11
.L10:
  ld a1, 72(a0)
  li a2, 1
  add a1, a1, a2
  sd a1, 72(a0)
  ld a1, 80(a0)
  li a2, 2
  sub a1, a1, a2
  sd a1, 80(a0)
.L11:
  ld a1, 80(a0)
  li a2, 2
  addi a1,a1,1
  slt a1, a2, a1
  bnez a1, .L10
  ld a1, 72(a0)
  sd a1, 64(a0)
.L7:
  ld a1, 48(a0)
  li a2, 0
  sub a1, a1, a2
  sgtz a1, a1
  ld a2, 56(a0)
  ld a3, 64(a0)
  sub a2, a2, a3
  seqz a2, a2
  seqz a2, a2
  add a1, a1, a2
  li a2, 1
  slt a1, a2, a1
  bnez a1, .L6
  ld a1, 64(a0)
  sd a1, 40(a0)
.L5:
  li a1, 2
  ld a2, 16(a0)
  mul a1, a1, a2
  sd a1, 88(a0)
  li a1, 0
  ld a2, 8(a0)
  sub a1, a1, a2
  ld a2, 40(a0)
  sub a1, a1, a2
  sd a1, 96(a0)
  li a1, 0
  sd a1, 104(a0)
  j .L13
.L12:
  ld a1, 104(a0)
  li a2, 1
  add a1, a1, a2
  sd a1, 104(a0)
  ld a1, 96(a0)
  ld a2, 88(a0)
  sub a1, a1, a2
  sd a1, 96(a0)
.L13:
  ld a1, 96(a0)
  ld a2, 88(a0)
  addi a1,a1,1
  slt a1, a2, a1
  bnez a1, .L12
  j .L15
.L14:
  ld a1, 104(a0)
  li a2, 1
  sub a1, a1, a2
  sd a1, 104(a0)
  ld a1, 96(a0)
  ld a2, 88(a0)
  add a1, a1, a2
  sd a1, 96(a0)
.L15:
  ld a1, 96(a0)
  li a2, 0
  ld a3, 88(a0)
  sub a2, a2, a3
  addi a2,a2,1
  slt a1, a1, a2
  bnez a1, .L14
  ld a1, 32(a0)
  li a2, 1
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L16
  li a1, 0
  ld a2, 8(a0)
  sub a1, a1, a2
  ld a2, 40(a0)
  add a1, a1, a2
  sd a1, 112(a0)
  li a1, 0
  sd a1, 120(a0)
  j .L19
.L18:
  ld a1, 120(a0)
  li a2, 1
  add a1, a1, a2
  sd a1, 120(a0)
  ld a1, 112(a0)
  ld a2, 88(a0)
  sub a1, a1, a2
  sd a1, 112(a0)
.L19:
  ld a1, 112(a0)
  ld a2, 88(a0)
  addi a1,a1,1
  slt a1, a2, a1
  bnez a1, .L18
  j .L21
.L20:
  ld a1, 120(a0)
  li a2, 1
  sub a1, a1, a2
  sd a1, 120(a0)
  ld a1, 112(a0)
  ld a2, 88(a0)
  add a1, a1, a2
  sd a1, 112(a0)
.L21:
  ld a1, 112(a0)
  li a2, 0
  ld a3, 88(a0)
  sub a2, a2, a3
  addi a2,a2,1
  slt a1, a1, a2
  bnez a1, .L20
  j .L17
.L16:
  nop
.L17:
.L3:
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size test, .-test
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits