  .file "ex1.c"
  .option nopic
  .text
  .comm vars,48,8
  .align  1
  .globl ex1
  .type ex1, @function
ex1:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  li a1, 1
  sd a1, 0(a0)
  li a1, 0
  sd a1, 8(a0)
  li a1, 1
  sd a1, 16(a0)
  li a1, 0
  sd a1, 24(a0)
  li a1, 0
  sd a1, 32(a0)
  ld a1, 0(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L2
  ld a1, 8(a0)
  sd a1, 32(a0)
  j .L3
.L2:
  j .L5
.L4:
  ld t1, 8(a0)
  ld t2, 16(a0)
  add t1, t1, t2
  sd t1, 40(a0)
  ld t1, 16(a0)
  sd t1, 8(a0)
  ld t1, 40(a0)
  sd t1, 16(a0)
  ld t1, 24(a0)
  li t2, 1
  add t1, t1, t2
  sd t1, 24(a0)
  ld t1, 8(a0)
  sd t1, 32(a0)
.L5:
  ld t1, 24(a0)
  ld t2, 0(a0)
  sub t1, t1, t2
  sltz t1, t1
  bnez t1, .L4
.L3:
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size ex1, .-ex1
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits