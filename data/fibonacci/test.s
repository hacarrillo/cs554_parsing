  .file "test.c"
  .option nopic
  .text
  .comm vars,48,8
  .align  1
  .globl test
  .type test, @function
test:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  li a1, 0
  sd a1, 0(a0)
  li a1, 1
  sd a1, 8(a0)
  li a1, 0
  sd a1, 16(a0)
  li a1, 0
  sd a1, 24(a0)
  ld a1, 32(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L2
  ld a1, 0(a0)
  sd a1, 24(a0)
  j .L3
.L2:
  j .L5
.L4:
  ld a1, 0(a0)
  ld a2, 8(a0)
  add a1, a1, a2
  sd a1, 40(a0)
  ld a1, 8(a0)
  sd a1, 0(a0)
  ld a1, 40(a0)
  sd a1, 8(a0)
  ld a1, 16(a0)
  li a2, 1
  add a1, a1, a2
  sd a1, 16(a0)
  ld a1, 0(a0)
  sd a1, 24(a0)
.L5:
  ld a1, 16(a0)
  ld a2, 32(a0)
  sub a1, a1, a2
  sltz a1, a1
  bnez a1, .L4
.L3:
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size test, .-test
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits