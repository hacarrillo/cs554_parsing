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
  ld s1, 32(a0)
  ld s2, 0(a0)
  ld s3, 40(a0)
  ld s4, 48(a0)
  ld s5, 56(a0)
  ld s6, 64(a0)
  ld s7, 72(a0)
  ld s8, 80(a0)
  ld s9, 104(a0)
  ld s10, 184(a0)
  ld s11, 272(a0)
  li a3, 0
  mv s2, a3
  li a3, 0
  sd a3, 8(a0)
  li a3, 0
  sd a3, 16(a0)
  li a3, 0
  sd a3, 24(a0)
  li a3, 0
  mv s1, a3
  li a3, 0
  mv s3, a3
  li a3, 0
  mv s4, a3
  li a3, 0
  mv s5, a3
  li a3, 0
  mv s6, a3
  li a3, 0
  mv s7, a3
.L268:
  li a3, 3
  li a2, 0
  slt a2, s7, a3
  mv a3, a2
  bnez a3, .L269
  j .L353
.L269:
  li a3, 0
  mv s8, a3
.L270:
  li a3, 3
  li a2, 0
  slt a2, s8, a3
  mv a3, a2
  bnez a3, .L271
  j .L352
.L271:
  li a3, 0
  sd a3, 88(a0)
  li a3, 0
  sd a3, 96(a0)
.L273:
  ld a3, 96(a0)
  li a4, 3
  li a2, 0
  slt a2, a3, a4
  mv a3, a2
  bnez a3, .L274
  j .L326
.L274:
  li a3, 0
  li a2, 0
  sub a3, s7, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L275
  j .L282
.L275:
  ld a3, 96(a0)
  li a4, 0
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L276
  j .L277
.L276:
  ld a3, 112(a0)
  mv s9, a3
  j .L1650
.L277:
  ld a3, 96(a0)
  li a4, 1
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L278
  j .L279
.L278:
  ld a3, 120(a0)
  mv s9, a3
  j .L1651
.L279:
  ld a3, 96(a0)
  li a4, 2
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L280
  j .L281
.L280:
  ld a3, 128(a0)
  mv s9, a3
  j .L1652
.L281:
  li a3, 0
  mv s9, a3
.L1652:
  nop
.L1651:
  nop
.L1650:
  nop
  j .L299
.L282:
  li a3, 1
  li a2, 0
  sub a3, s7, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L283
  j .L290
.L283:
  ld a3, 96(a0)
  li a4, 0
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L284
  j .L285
.L284:
  ld a3, 136(a0)
  mv s9, a3
  j .L1654
.L285:
  ld a3, 96(a0)
  li a4, 1
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L286
  j .L287
.L286:
  ld a3, 144(a0)
  mv s9, a3
  j .L1655
.L287:
  ld a3, 96(a0)
  li a4, 2
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L288
  j .L289
.L288:
  ld a3, 152(a0)
  mv s9, a3
  j .L1656
.L289:
  li a3, 0
  mv s9, a3
.L1656:
  nop
.L1655:
  nop
.L1654:
  nop
  j .L1653
.L290:
  li a3, 2
  li a2, 0
  sub a3, s7, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L291
  j .L298
.L291:
  ld a3, 96(a0)
  li a4, 0
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L292
  j .L293
.L292:
  ld a3, 160(a0)
  mv s9, a3
  j .L1658
.L293:
  ld a3, 96(a0)
  li a4, 1
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L294
  j .L295
.L294:
  ld a3, 168(a0)
  mv s9, a3
  j .L1659
.L295:
  ld a3, 96(a0)
  li a4, 2
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L296
  j .L297
.L296:
  ld a3, 176(a0)
  mv s9, a3
  j .L1660
.L297:
  li a3, 0
  mv s9, a3
.L1660:
  nop
.L1659:
  nop
.L1658:
  nop
  j .L1657
.L298:
  li a3, 0
  mv s9, a3
.L1657:
  nop
.L1653:
  nop
.L299:
  ld a3, 96(a0)
  li a4, 0
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L300
  j .L307
.L300:
  li a3, 0
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L301
  j .L302
.L301:
  ld a3, 192(a0)
  mv s10, a3
  j .L1661
.L302:
  li a3, 1
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L303
  j .L304
.L303:
  ld a3, 200(a0)
  mv s10, a3
  j .L1662
.L304:
  li a3, 2
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L305
  j .L306
.L305:
  ld a3, 208(a0)
  mv s10, a3
  j .L1663
.L306:
  li a3, 0
  mv s10, a3
.L1663:
  nop
.L1662:
  nop
.L1661:
  nop
  j .L324
.L307:
  ld a3, 96(a0)
  li a4, 1
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L308
  j .L315
.L308:
  li a3, 0
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L309
  j .L310
.L309:
  ld a3, 216(a0)
  mv s10, a3
  j .L1665
.L310:
  li a3, 1
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L311
  j .L312
.L311:
  ld a3, 224(a0)
  mv s10, a3
  j .L1666
.L312:
  li a3, 2
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L313
  j .L314
.L313:
  ld a3, 232(a0)
  mv s10, a3
  j .L1667
.L314:
  li a3, 0
  mv s10, a3
.L1667:
  nop
.L1666:
  nop
.L1665:
  nop
  j .L1664
.L315:
  ld a3, 96(a0)
  li a4, 2
  li a2, 0
  sub a3, a3, a4
  seqz a2, a3
  mv a3, a2
  bnez a3, .L316
  j .L323
.L316:
  li a3, 0
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L317
  j .L318
.L317:
  ld a3, 240(a0)
  mv s10, a3
  j .L1669
.L318:
  li a3, 1
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L319
  j .L320
.L319:
  ld a3, 248(a0)
  mv s10, a3
  j .L1670
.L320:
  li a3, 2
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L321
  j .L322
.L321:
  ld a3, 256(a0)
  mv s10, a3
  j .L1671
.L322:
  li a3, 0
  mv s10, a3
.L1671:
  nop
.L1670:
  nop
.L1669:
  nop
  j .L1668
.L323:
  li a3, 0
  mv s10, a3
.L1668:
  nop
.L1664:
  nop
.L324:
  ld a3, 88(a0)
  mul a4, s9, s10
  add a3, a3, a4
  sd a3, 88(a0)
  ld a3, 96(a0)
  li a4, 1
  add a3, a3, a4
  sd a3, 96(a0)
 j .L273
.L326:
  li a3, 0
  li a2, 0
  sub a3, s7, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L327
  j .L334
.L327:
  li a3, 0
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L328
  j .L329
.L328:
  ld a3, 88(a0)
  mv s2, a3
  j .L1672
.L329:
  li a3, 1
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L330
  j .L331
.L330:
  ld a3, 88(a0)
  sd a3, 8(a0)
  j .L1673
.L331:
  li a3, 2
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L332
  j .L333
.L332:
  ld a3, 88(a0)
  sd a3, 16(a0)
  j .L1674
.L333:
  nop
.L1674:
  nop
.L1673:
  nop
.L1672:
  nop
  j .L351
.L334:
  li a3, 1
  li a2, 0
  sub a3, s7, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L335
  j .L342
.L335:
  li a3, 0
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L336
  j .L337
.L336:
  ld a3, 88(a0)
  sd a3, 24(a0)
  j .L1676
.L337:
  li a3, 1
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L338
  j .L339
.L338:
  ld a3, 88(a0)
  mv s1, a3
  j .L1677
.L339:
  li a3, 2
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L340
  j .L341
.L340:
  ld a3, 88(a0)
  mv s3, a3
  j .L1678
.L341:
  nop
.L1678:
  nop
.L1677:
  nop
.L1676:
  nop
  j .L1675
.L342:
  li a3, 2
  li a2, 0
  sub a3, s7, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L343
  j .L350
.L343:
  li a3, 0
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L344
  j .L345
.L344:
  ld a3, 88(a0)
  mv s4, a3
  j .L1680
.L345:
  li a3, 1
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L346
  j .L347
.L346:
  ld a3, 88(a0)
  mv s5, a3
  j .L1681
.L347:
  li a3, 2
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L348
  j .L349
.L348:
  ld a3, 88(a0)
  mv s6, a3
  j .L1682
.L349:
  nop
.L1682:
  nop
.L1681:
  nop
.L1680:
  nop
  j .L1679
.L350:
  nop
.L1679:
  nop
.L1675:
  nop
.L351:
  li a3, 1
  add a3, s8, a3
  mv s8, a3
 j .L270
.L352:
  li a3, 1
  add a3, s7, a3
  mv s7, a3
 j .L268
.L353:
  li a3, 0
  sd a3, 264(a0)
  li a3, 0
  mv s7, a3
.L355:
  li a3, 3
  li a2, 0
  slt a2, s7, a3
  mv a3, a2
  bnez a3, .L356
  j .L386
.L356:
  li a3, 0
  mv s8, a3
.L357:
  li a3, 3
  li a2, 0
  slt a2, s8, a3
  mv a3, a2
  bnez a3, .L358
  j .L385
.L358:
  li a3, 0
  li a2, 0
  sub a3, s7, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L359
  j .L366
.L359:
  li a3, 0
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L360
  j .L361
.L360:
  mv s11, s2
  j .L1683
.L361:
  li a3, 1
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L362
  j .L363
.L362:
  ld a3, 8(a0)
  mv s11, a3
  j .L1684
.L363:
  li a3, 2
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L364
  j .L365
.L364:
  ld a3, 16(a0)
  mv s11, a3
  j .L1685
.L365:
  li a3, 0
  mv s11, a3
.L1685:
  nop
.L1684:
  nop
.L1683:
  nop
  j .L383
.L366:
  li a3, 1
  li a2, 0
  sub a3, s7, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L367
  j .L374
.L367:
  li a3, 0
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L368
  j .L369
.L368:
  ld a3, 24(a0)
  mv s11, a3
  j .L1687
.L369:
  li a3, 1
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L370
  j .L371
.L370:
  mv s11, s1
  j .L1688
.L371:
  li a3, 2
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L372
  j .L373
.L372:
  mv s11, s3
  j .L1689
.L373:
  li a3, 0
  mv s11, a3
.L1689:
  nop
.L1688:
  nop
.L1687:
  nop
  j .L1686
.L374:
  li a3, 2
  li a2, 0
  sub a3, s7, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L375
  j .L382
.L375:
  li a3, 0
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L376
  j .L377
.L376:
  mv s11, s4
  j .L1691
.L377:
  li a3, 1
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L378
  j .L379
.L378:
  mv s11, s5
  j .L1692
.L379:
  li a3, 2
  li a2, 0
  sub a3, s8, a3
  seqz a2, a3
  mv a3, a2
  bnez a3, .L380
  j .L381
.L380:
  mv s11, s6
  j .L1693
.L381:
  li a3, 0
  mv s11, a3
.L1693:
  nop
.L1692:
  nop
.L1691:
  nop
  j .L1690
.L382:
  li a3, 0
  mv s11, a3
.L1690:
  nop
.L1686:
  nop
.L383:
  ld a3, 264(a0)
  add a3, a3, s11
  sd a3, 264(a0)
  li a3, 1
  add a3, s8, a3
  mv s8, a3
 j .L357
.L385:
  li a3, 1
  add a3, s7, a3
  mv s7, a3
 j .L355
.L386:
  ld a3, 264(a0)
  sd a3, 280(a0)
  sd s1, 32(a0)
  sd s2, 0(a0)
  sd s3, 40(a0)
  sd s4, 48(a0)
  sd s5, 56(a0)
  sd s6, 64(a0)
  sd s7, 72(a0)
  sd s8, 80(a0)
  sd s9, 104(a0)
  sd s10, 184(a0)
  sd s11, 272(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size test, .-test
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits