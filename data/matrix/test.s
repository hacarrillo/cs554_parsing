  .file "test.c"
  .option nopic
  .text
  .comm vars,288,8
  .align  1
  .globl test
  .type test, @function
test:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  li a1, 0
  sd a1, 0(a0)
  li a1, 0
  sd a1, 8(a0)
  li a1, 0
  sd a1, 16(a0)
  li a1, 0
  sd a1, 24(a0)
  li a1, 0
  sd a1, 32(a0)
  li a1, 0
  sd a1, 40(a0)
  li a1, 0
  sd a1, 48(a0)
  li a1, 0
  sd a1, 56(a0)
  li a1, 0
  sd a1, 64(a0)
  li a1, 0
  sd a1, 72(a0)
  j .L3
.L2:
  li a1, 0
  sd a1, 80(a0)
  j .L5
.L4:
  li a1, 0
  sd a1, 88(a0)
  li a1, 0
  sd a1, 96(a0)
  j .L7
.L6:
  ld a1, 72(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L8
  ld a1, 96(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L10
  ld a1, 112(a0)
  sd a1, 104(a0)
  j .L11
.L10:
  ld a1, 96(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L12
  ld a1, 120(a0)
  sd a1, 104(a0)
  j .L13
.L12:
  ld a1, 96(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L14
  ld a1, 128(a0)
  sd a1, 104(a0)
  j .L15
.L14:
  li a1, 0
  sd a1, 104(a0)
.L15:
.L13:
.L11:
  j .L9
.L8:
  ld a1, 72(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L16
  ld a1, 96(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L18
  ld a1, 136(a0)
  sd a1, 104(a0)
  j .L19
.L18:
  ld a1, 96(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L20
  ld a1, 144(a0)
  sd a1, 104(a0)
  j .L21
.L20:
  ld a1, 96(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L22
  ld a1, 152(a0)
  sd a1, 104(a0)
  j .L23
.L22:
  li a1, 0
  sd a1, 104(a0)
.L23:
.L21:
.L19:
  j .L17
.L16:
  ld a1, 72(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L24
  ld a1, 96(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L26
  ld a1, 160(a0)
  sd a1, 104(a0)
  j .L27
.L26:
  ld a1, 96(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L28
  ld a1, 168(a0)
  sd a1, 104(a0)
  j .L29
.L28:
  ld a1, 96(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L30
  ld a1, 176(a0)
  sd a1, 104(a0)
  j .L31
.L30:
  li a1, 0
  sd a1, 104(a0)
.L31:
.L29:
.L27:
  j .L25
.L24:
  li a1, 0
  sd a1, 104(a0)
.L25:
.L17:
.L9:
  ld a1, 96(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L32
  ld a1, 80(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L34
  ld a1, 192(a0)
  sd a1, 184(a0)
  j .L35
.L34:
  ld a1, 80(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L36
  ld a1, 200(a0)
  sd a1, 184(a0)
  j .L37
.L36:
  ld a1, 80(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L38
  ld a1, 208(a0)
  sd a1, 184(a0)
  j .L39
.L38:
  li a1, 0
  sd a1, 184(a0)
.L39:
.L37:
.L35:
  j .L33
.L32:
  ld a1, 96(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L40
  ld a1, 80(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L42
  ld a1, 216(a0)
  sd a1, 184(a0)
  j .L43
.L42:
  ld a1, 80(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L44
  ld a1, 224(a0)
  sd a1, 184(a0)
  j .L45
.L44:
  ld a1, 80(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L46
  ld a1, 232(a0)
  sd a1, 184(a0)
  j .L47
.L46:
  li a1, 0
  sd a1, 184(a0)
.L47:
.L45:
.L43:
  j .L41
.L40:
  ld a1, 96(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L48
  ld a1, 80(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L50
  ld a1, 240(a0)
  sd a1, 184(a0)
  j .L51
.L50:
  ld a1, 80(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L52
  ld a1, 248(a0)
  sd a1, 184(a0)
  j .L53
.L52:
  ld a1, 80(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L54
  ld a1, 256(a0)
  sd a1, 184(a0)
  j .L55
.L54:
  li a1, 0
  sd a1, 184(a0)
.L55:
.L53:
.L51:
  j .L49
.L48:
  li a1, 0
  sd a1, 184(a0)
.L49:
.L41:
.L33:
  ld a1, 88(a0)
  ld a2, 104(a0)
  ld a3, 184(a0)
  mul a2, a2, a3
  add a1, a1, a2
  sd a1, 88(a0)
  ld a1, 96(a0)
  li a2, 1
  add a1, a1, a2
  sd a1, 96(a0)
.L7:
  ld a1, 96(a0)
  li a2, 3
  sub a1, a1, a2
  sltz a1, a1
  bnez a1, .L6
  ld a1, 72(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L56
  ld a1, 80(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L58
  ld a1, 88(a0)
  sd a1, 0(a0)
  j .L59
.L58:
  ld a1, 80(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L60
  ld a1, 88(a0)
  sd a1, 8(a0)
  j .L61
.L60:
  ld a1, 80(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L62
  ld a1, 88(a0)
  sd a1, 16(a0)
  j .L63
.L62:
  nop
.L63:
.L61:
.L59:
  j .L57
.L56:
  ld a1, 72(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L64
  ld a1, 80(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L66
  ld a1, 88(a0)
  sd a1, 24(a0)
  j .L67
.L66:
  ld a1, 80(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L68
  ld a1, 88(a0)
  sd a1, 32(a0)
  j .L69
.L68:
  ld a1, 80(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L70
  ld a1, 88(a0)
  sd a1, 40(a0)
  j .L71
.L70:
  nop
.L71:
.L69:
.L67:
  j .L65
.L64:
  ld a1, 72(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L72
  ld a1, 80(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L74
  ld a1, 88(a0)
  sd a1, 48(a0)
  j .L75
.L74:
  ld a1, 80(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L76
  ld a1, 88(a0)
  sd a1, 56(a0)
  j .L77
.L76:
  ld a1, 80(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L78
  ld a1, 88(a0)
  sd a1, 64(a0)
  j .L79
.L78:
  nop
.L79:
.L77:
.L75:
  j .L73
.L72:
  nop
.L73:
.L65:
.L57:
  ld a1, 80(a0)
  li a2, 1
  add a1, a1, a2
  sd a1, 80(a0)
.L5:
  ld a1, 80(a0)
  li a2, 3
  sub a1, a1, a2
  sltz a1, a1
  bnez a1, .L4
  ld a1, 72(a0)
  li a2, 1
  add a1, a1, a2
  sd a1, 72(a0)
.L3:
  ld a1, 72(a0)
  li a2, 3
  sub a1, a1, a2
  sltz a1, a1
  bnez a1, .L2
  li a1, 0
  sd a1, 264(a0)
  li a1, 0
  sd a1, 72(a0)
  j .L81
.L80:
  li a1, 0
  sd a1, 80(a0)
  j .L83
.L82:
  ld a1, 72(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L84
  ld a1, 80(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L86
  ld a1, 0(a0)
  sd a1, 272(a0)
  j .L87
.L86:
  ld a1, 80(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L88
  ld a1, 8(a0)
  sd a1, 272(a0)
  j .L89
.L88:
  ld a1, 80(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L90
  ld a1, 16(a0)
  sd a1, 272(a0)
  j .L91
.L90:
  li a1, 0
  sd a1, 272(a0)
.L91:
.L89:
.L87:
  j .L85
.L84:
  ld a1, 72(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L92
  ld a1, 80(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L94
  ld a1, 24(a0)
  sd a1, 272(a0)
  j .L95
.L94:
  ld a1, 80(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L96
  ld a1, 32(a0)
  sd a1, 272(a0)
  j .L97
.L96:
  ld a1, 80(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L98
  ld a1, 40(a0)
  sd a1, 272(a0)
  j .L99
.L98:
  li a1, 0
  sd a1, 272(a0)
.L99:
.L97:
.L95:
  j .L93
.L92:
  ld a1, 72(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L100
  ld a1, 80(a0)
  li a2, 0
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L102
  ld a1, 48(a0)
  sd a1, 272(a0)
  j .L103
.L102:
  ld a1, 80(a0)
  li a2, 1
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L104
  ld a1, 56(a0)
  sd a1, 272(a0)
  j .L105
.L104:
  ld a1, 80(a0)
  li a2, 2
  sub a1, a1, a2
  seqz a1, a1
  beqz a1, .L106
  ld a1, 64(a0)
  sd a1, 272(a0)
  j .L107
.L106:
  li a1, 0
  sd a1, 272(a0)
.L107:
.L105:
.L103:
  j .L101
.L100:
  li a1, 0
  sd a1, 272(a0)
.L101:
.L93:
.L85:
  ld a1, 264(a0)
  ld a2, 272(a0)
  add a1, a1, a2
  sd a1, 264(a0)
  ld a1, 80(a0)
  li a2, 1
  add a1, a1, a2
  sd a1, 80(a0)
.L83:
  ld a1, 80(a0)
  li a2, 3
  sub a1, a1, a2
  sltz a1, a1
  bnez a1, .L82
  ld a1, 72(a0)
  li a2, 1
  add a1, a1, a2
  sd a1, 72(a0)
.L81:
  ld a1, 72(a0)
  li a2, 3
  sub a1, a1, a2
  sltz a1, a1
  bnez a1, .L80
  ld a1, 264(a0)
  sd a1, 280(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size test, .-test
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits