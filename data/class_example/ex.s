  .file "ex.c"
  .option nopic
  .text
  .comm vars,16,8
  .align  1
  .globl ex
  .type ex, @function
ex:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  ld s1, 0(a0)
  ld a3, 8(a0)
  mv s1, a3
  nop
  nop
  nop
.L24:
  li a3, 0
  li a2, 0
  slt a2, a3, s1
  mv a3, a2
  bnez a3, .L25
  j .L29
.L25:
  nop
  nop
  nop
  li a3, 1
  sub a3, s1, a3
  mv s1, a3
 j .L24
.L29:
  nop
  sd s1, 0(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size ex, .-ex
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits