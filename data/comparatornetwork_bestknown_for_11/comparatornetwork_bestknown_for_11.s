  .file "comparatornetwork_bestknown_for_11.c"
  .option nopic
  .text
  .comm vars,104,8
  .align  1
  .globl comparatornetwork_bestknown_for_11
  .type comparatornetwork_bestknown_for_11, @function
comparatornetwork_bestknown_for_11:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  ld a1, 0(a0)
  ld a2, 8(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L2
  nop
  j .L3
.L2:
  ld a1, 0(a0)
  sd a1, 16(a0)
  ld a1, 8(a0)
  sd a1, 0(a0)
  ld a1, 16(a0)
  sd a1, 8(a0)
.L3:
  ld a1, 24(a0)
  ld a2, 32(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L4
  nop
  j .L5
.L4:
  ld a1, 24(a0)
  sd a1, 16(a0)
  ld a1, 32(a0)
  sd a1, 24(a0)
  ld a1, 16(a0)
  sd a1, 32(a0)
.L5:
  ld a1, 40(a0)
  ld a2, 48(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L6
  nop
  j .L7
.L6:
  ld a1, 40(a0)
  sd a1, 16(a0)
  ld a1, 48(a0)
  sd a1, 40(a0)
  ld a1, 16(a0)
  sd a1, 48(a0)
.L7:
  ld a1, 56(a0)
  ld a2, 64(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L8
  nop
  j .L9
.L8:
  ld a1, 56(a0)
  sd a1, 16(a0)
  ld a1, 64(a0)
  sd a1, 56(a0)
  ld a1, 16(a0)
  sd a1, 64(a0)
.L9:
  ld a1, 72(a0)
  ld a2, 80(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L10
  nop
  j .L11
.L10:
  ld a1, 72(a0)
  sd a1, 16(a0)
  ld a1, 80(a0)
  sd a1, 72(a0)
  ld a1, 16(a0)
  sd a1, 80(a0)
.L11:
  ld a1, 8(a0)
  ld a2, 32(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L12
  nop
  j .L13
.L12:
  ld a1, 8(a0)
  sd a1, 16(a0)
  ld a1, 32(a0)
  sd a1, 8(a0)
  ld a1, 16(a0)
  sd a1, 32(a0)
.L13:
  ld a1, 48(a0)
  ld a2, 64(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L14
  nop
  j .L15
.L14:
  ld a1, 48(a0)
  sd a1, 16(a0)
  ld a1, 64(a0)
  sd a1, 48(a0)
  ld a1, 16(a0)
  sd a1, 64(a0)
.L15:
  ld a1, 0(a0)
  ld a2, 24(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L16
  nop
  j .L17
.L16:
  ld a1, 0(a0)
  sd a1, 16(a0)
  ld a1, 24(a0)
  sd a1, 0(a0)
  ld a1, 16(a0)
  sd a1, 24(a0)
.L17:
  ld a1, 40(a0)
  ld a2, 56(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L18
  nop
  j .L19
.L18:
  ld a1, 40(a0)
  sd a1, 16(a0)
  ld a1, 56(a0)
  sd a1, 40(a0)
  ld a1, 16(a0)
  sd a1, 56(a0)
.L19:
  ld a1, 72(a0)
  ld a2, 88(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L20
  nop
  j .L21
.L20:
  ld a1, 72(a0)
  sd a1, 16(a0)
  ld a1, 88(a0)
  sd a1, 72(a0)
  ld a1, 16(a0)
  sd a1, 88(a0)
.L21:
  ld a1, 8(a0)
  ld a2, 24(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L22
  nop
  j .L23
.L22:
  ld a1, 8(a0)
  sd a1, 16(a0)
  ld a1, 24(a0)
  sd a1, 8(a0)
  ld a1, 16(a0)
  sd a1, 24(a0)
.L23:
  ld a1, 48(a0)
  ld a2, 56(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L24
  nop
  j .L25
.L24:
  ld a1, 48(a0)
  sd a1, 16(a0)
  ld a1, 56(a0)
  sd a1, 48(a0)
  ld a1, 16(a0)
  sd a1, 56(a0)
.L25:
  ld a1, 80(a0)
  ld a2, 88(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L26
  nop
  j .L27
.L26:
  ld a1, 80(a0)
  sd a1, 16(a0)
  ld a1, 88(a0)
  sd a1, 80(a0)
  ld a1, 16(a0)
  sd a1, 88(a0)
.L27:
  ld a1, 8(a0)
  ld a2, 48(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L28
  nop
  j .L29
.L28:
  ld a1, 8(a0)
  sd a1, 16(a0)
  ld a1, 48(a0)
  sd a1, 8(a0)
  ld a1, 16(a0)
  sd a1, 48(a0)
.L29:
  ld a1, 56(a0)
  ld a2, 88(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L30
  nop
  j .L31
.L30:
  ld a1, 56(a0)
  sd a1, 16(a0)
  ld a1, 88(a0)
  sd a1, 56(a0)
  ld a1, 16(a0)
  sd a1, 88(a0)
.L31:
  ld a1, 48(a0)
  ld a2, 80(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L32
  nop
  j .L33
.L32:
  ld a1, 48(a0)
  sd a1, 16(a0)
  ld a1, 80(a0)
  sd a1, 48(a0)
  ld a1, 16(a0)
  sd a1, 80(a0)
.L33:
  ld a1, 24(a0)
  ld a2, 56(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L34
  nop
  j .L35
.L34:
  ld a1, 24(a0)
  sd a1, 16(a0)
  ld a1, 56(a0)
  sd a1, 24(a0)
  ld a1, 16(a0)
  sd a1, 56(a0)
.L35:
  ld a1, 8(a0)
  ld a2, 48(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L36
  nop
  j .L37
.L36:
  ld a1, 8(a0)
  sd a1, 16(a0)
  ld a1, 48(a0)
  sd a1, 8(a0)
  ld a1, 16(a0)
  sd a1, 48(a0)
.L37:
  ld a1, 56(a0)
  ld a2, 88(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L38
  nop
  j .L39
.L38:
  ld a1, 56(a0)
  sd a1, 16(a0)
  ld a1, 88(a0)
  sd a1, 56(a0)
  ld a1, 16(a0)
  sd a1, 88(a0)
.L39:
  ld a1, 0(a0)
  ld a2, 40(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L40
  nop
  j .L41
.L40:
  ld a1, 0(a0)
  sd a1, 16(a0)
  ld a1, 40(a0)
  sd a1, 0(a0)
  ld a1, 16(a0)
  sd a1, 40(a0)
.L41:
  ld a1, 32(a0)
  ld a2, 64(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L42
  nop
  j .L43
.L42:
  ld a1, 32(a0)
  sd a1, 16(a0)
  ld a1, 64(a0)
  sd a1, 32(a0)
  ld a1, 16(a0)
  sd a1, 64(a0)
.L43:
  ld a1, 40(a0)
  ld a2, 72(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L44
  nop
  j .L45
.L44:
  ld a1, 40(a0)
  sd a1, 16(a0)
  ld a1, 72(a0)
  sd a1, 40(a0)
  ld a1, 16(a0)
  sd a1, 72(a0)
.L45:
  ld a1, 0(a0)
  ld a2, 40(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L46
  nop
  j .L47
.L46:
  ld a1, 0(a0)
  sd a1, 16(a0)
  ld a1, 40(a0)
  sd a1, 0(a0)
  ld a1, 16(a0)
  sd a1, 40(a0)
.L47:
  ld a1, 8(a0)
  ld a2, 40(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L48
  nop
  j .L49
.L48:
  ld a1, 8(a0)
  sd a1, 16(a0)
  ld a1, 40(a0)
  sd a1, 8(a0)
  ld a1, 16(a0)
  sd a1, 40(a0)
.L49:
  ld a1, 64(a0)
  ld a2, 88(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L50
  nop
  j .L51
.L50:
  ld a1, 64(a0)
  sd a1, 16(a0)
  ld a1, 88(a0)
  sd a1, 64(a0)
  ld a1, 16(a0)
  sd a1, 88(a0)
.L51:
  ld a1, 32(a0)
  ld a2, 72(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L52
  nop
  j .L53
.L52:
  ld a1, 32(a0)
  sd a1, 16(a0)
  ld a1, 72(a0)
  sd a1, 32(a0)
  ld a1, 16(a0)
  sd a1, 72(a0)
.L53:
  ld a1, 24(a0)
  ld a2, 32(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L54
  nop
  j .L55
.L54:
  ld a1, 24(a0)
  sd a1, 16(a0)
  ld a1, 32(a0)
  sd a1, 24(a0)
  ld a1, 16(a0)
  sd a1, 32(a0)
.L55:
  ld a1, 72(a0)
  ld a2, 80(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L56
  nop
  j .L57
.L56:
  ld a1, 72(a0)
  sd a1, 16(a0)
  ld a1, 80(a0)
  sd a1, 72(a0)
  ld a1, 16(a0)
  sd a1, 80(a0)
.L57:
  ld a1, 24(a0)
  ld a2, 40(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L58
  nop
  j .L59
.L58:
  ld a1, 24(a0)
  sd a1, 16(a0)
  ld a1, 40(a0)
  sd a1, 24(a0)
  ld a1, 16(a0)
  sd a1, 40(a0)
.L59:
  ld a1, 64(a0)
  ld a2, 80(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L60
  nop
  j .L61
.L60:
  ld a1, 64(a0)
  sd a1, 16(a0)
  ld a1, 80(a0)
  sd a1, 64(a0)
  ld a1, 16(a0)
  sd a1, 80(a0)
.L61:
  ld a1, 32(a0)
  ld a2, 48(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L62
  nop
  j .L63
.L62:
  ld a1, 32(a0)
  sd a1, 16(a0)
  ld a1, 48(a0)
  sd a1, 32(a0)
  ld a1, 16(a0)
  sd a1, 48(a0)
.L63:
  ld a1, 56(a0)
  ld a2, 72(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L64
  nop
  j .L65
.L64:
  ld a1, 56(a0)
  sd a1, 16(a0)
  ld a1, 72(a0)
  sd a1, 56(a0)
  ld a1, 16(a0)
  sd a1, 72(a0)
.L65:
  ld a1, 32(a0)
  ld a2, 40(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L66
  nop
  j .L67
.L66:
  ld a1, 32(a0)
  sd a1, 16(a0)
  ld a1, 40(a0)
  sd a1, 32(a0)
  ld a1, 16(a0)
  sd a1, 40(a0)
.L67:
  ld a1, 48(a0)
  ld a2, 56(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L68
  nop
  j .L69
.L68:
  ld a1, 48(a0)
  sd a1, 16(a0)
  ld a1, 56(a0)
  sd a1, 48(a0)
  ld a1, 16(a0)
  sd a1, 56(a0)
.L69:
  ld a1, 64(a0)
  ld a2, 72(a0)
  sub a1, a1, a2
  sgtz a1, a1
  beqz a1, .L70
  nop
  j .L71
.L70:
  ld a1, 64(a0)
  sd a1, 16(a0)
  ld a1, 72(a0)
  sd a1, 64(a0)
  ld a1, 16(a0)
  sd a1, 72(a0)
.L71:
  ld a1, 0(a0)
  ld a2, 8(a0)
  add a1, a1, a2
  ld a2, 24(a0)
  add a1, a1, a2
  ld a2, 32(a0)
  add a1, a1, a2
  ld a2, 40(a0)
  add a1, a1, a2
  ld a2, 48(a0)
  add a1, a1, a2
  ld a2, 56(a0)
  add a1, a1, a2
  ld a2, 64(a0)
  add a1, a1, a2
  ld a2, 72(a0)
  add a1, a1, a2
  ld a2, 80(a0)
  add a1, a1, a2
  ld a2, 88(a0)
  add a1, a1, a2
  sd a1, 96(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size comparatornetwork_bestknown_for_11, .-comparatornetwork_bestknown_for_11
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits