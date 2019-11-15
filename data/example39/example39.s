  .file "example39.c"
  .option nopic
  .text
  .comm vars,24,8
  .align  1
  .globl example39
  .type example39, @function
example39:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  li a1, 9223372036854774808
  sd a1, 0(a0)
  li a1, 0
  li a2, 100000
  sub a1, a1, a2
  sd a1, 8(a0)
  ld a1, 0(a0)
  ld a2, 8(a0)
  sub a1, a1, a2
  sltz a1, a1
  beqz a1, .L2
  li a1, 1
  sd a1, 16(a0)
  j .L3
.L2:
  li a1, 2
  sd a1, 16(a0)
.L3:
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size example39, .-example39
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits