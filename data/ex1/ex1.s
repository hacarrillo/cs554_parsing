  .file "ex1.c"
  .option nopic
  .text
  .comm vars,16,8
  .align  1
  .globl ex1
  .type ex1, @function
ex1:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  li a1, 0
  sd a1, 0(a0)
  li a1, 1
  sd a1, 8(a0)
  j .L3
.L2:
  ld t2, 8(a0)
  li a1, 2
  sub t2, t2, a1
  seqz t2, t2
  beqz t2, .L4
  ld t2, 0(a0)
  ld a1, 8(a0)
  sub t2, t2, a1
  sd t2, 0(a0)
  j .L5
.L4:
  ld t1, 0(a0)
  ld t2, 8(a0)
  add t1, t1, t2
  sd t1, 0(a0)
.L5:
.L3:
  ld t0, 8(a0)
  li t1, 10
  sub t0, t0, t1
  sltz t0, t0
  bnez t0, .L2
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size ex1, .-ex1
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits