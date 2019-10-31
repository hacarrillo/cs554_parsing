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
  li a1, 22
  sd a1, 0(a0)
  li a1, 2
  sd a1, 8(a0)
  li a1, 0
  sd a1, 16(a0)
  ld a1, 0(a0)
  ld a2, 8(a0)
  mul a1, a1, a2
  sd a1, 24(a0)
  ld a1, 24(a0)
  li a2, 0
  sub a1, a1, a2
  sltz a1, a1
  beqz a1, .L2
  li a1, -1
  sd a1, 32(a0)
  j .L3
.L2:
  li t2, 1
  sd t2, 32(a0)
.L3:
  j .L5
.L4:
  ld t0, 16(a0)
  li t1, 1
  add t0, t0, t1
  sd t0, 16(a0)
  ld t0, 0(a0)
  ld t1, 8(a0)
  sub t0, t0, t1
  sd t0, 0(a0)
.L5:
  ld t0, 0(a0)
  ld t1, 8(a0)
 addi t0, 1
  sltt0, t1, t0
  bnez t0, .L4
  ld t0, 32(a0)
  ld t1, 16(a0)
  mul t0, t0, t1
  sd t0, 40(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size ex1, .-ex1
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits