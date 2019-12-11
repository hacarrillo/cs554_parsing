  .file "comp_network.c"
  .option nopic
  .text
  .comm vars,104,8
  .align  1
  .globl comp_network
  .type comp_network, @function
comp_network:
  addi  sp,sp,-32
  sd  s0,24(sp)
  addi  s0,sp,32
  ld s1, 16(a0)
  ld s2, 72(a0)
  ld s3, 8(a0)
  ld s4, 24(a0)
  ld s5, 32(a0)
  ld s6, 40(a0)
  ld s7, 48(a0)
  ld s8, 56(a0)
  ld s9, 80(a0)
  ld s10, 88(a0)
  ld s11, 64(a0)
  ld a3, 0(a0)
  li a2, 0
  slt a2, a3, s3
  mv a3, a2
  bnez a3, .L353
  j .L354
.L353:
  nop
  j .L357
.L354:
  ld a3, 0(a0)
  mv s1, a3
  sd s3, 0(a0)
  mv s3, s1
.L357:
  li a2, 0
  slt a2, s4, s5
  mv a3, a2
  bnez a3, .L358
  j .L359
.L358:
  nop
  j .L362
.L359:
  mv s1, s4
  mv s4, s5
  mv s5, s1
.L362:
  li a2, 0
  slt a2, s6, s7
  mv a3, a2
  bnez a3, .L363
  j .L364
.L363:
  nop
  j .L367
.L364:
  mv s1, s6
  mv s6, s7
  mv s7, s1
.L367:
  li a2, 0
  slt a2, s8, s11
  mv a3, a2
  bnez a3, .L368
  j .L369
.L368:
  nop
  j .L372
.L369:
  mv s1, s8
  mv s8, s11
  mv s11, s1
.L372:
  li a2, 0
  slt a2, s2, s9
  mv a3, a2
  bnez a3, .L373
  j .L374
.L373:
  nop
  j .L377
.L374:
  mv s1, s2
  mv s2, s9
  mv s9, s1
.L377:
  li a2, 0
  slt a2, s3, s5
  mv a3, a2
  bnez a3, .L378
  j .L379
.L378:
  nop
  j .L382
.L379:
  mv s1, s3
  mv s3, s5
  mv s5, s1
.L382:
  li a2, 0
  slt a2, s7, s11
  mv a3, a2
  bnez a3, .L383
  j .L384
.L383:
  nop
  j .L387
.L384:
  mv s1, s7
  mv s7, s11
  mv s11, s1
.L387:
  ld a3, 0(a0)
  li a2, 0
  slt a2, a3, s4
  mv a3, a2
  bnez a3, .L388
  j .L389
.L388:
  nop
  j .L392
.L389:
  ld a3, 0(a0)
  mv s1, a3
  sd s4, 0(a0)
  mv s4, s1
.L392:
  li a2, 0
  slt a2, s6, s8
  mv a3, a2
  bnez a3, .L393
  j .L394
.L393:
  nop
  j .L397
.L394:
  mv s1, s6
  mv s6, s8
  mv s8, s1
.L397:
  li a2, 0
  slt a2, s2, s10
  mv a3, a2
  bnez a3, .L398
  j .L399
.L398:
  nop
  j .L402
.L399:
  mv s1, s2
  mv s2, s10
  mv s10, s1
.L402:
  li a2, 0
  slt a2, s3, s4
  mv a3, a2
  bnez a3, .L403
  j .L404
.L403:
  nop
  j .L407
.L404:
  mv s1, s3
  mv s3, s4
  mv s4, s1
.L407:
  li a2, 0
  slt a2, s7, s8
  mv a3, a2
  bnez a3, .L408
  j .L409
.L408:
  nop
  j .L412
.L409:
  mv s1, s7
  mv s7, s8
  mv s8, s1
.L412:
  li a2, 0
  slt a2, s9, s10
  mv a3, a2
  bnez a3, .L413
  j .L414
.L413:
  nop
  j .L417
.L414:
  mv s1, s9
  mv s9, s10
  mv s10, s1
.L417:
  li a2, 0
  slt a2, s3, s7
  mv a3, a2
  bnez a3, .L418
  j .L419
.L418:
  nop
  j .L422
.L419:
  mv s1, s3
  mv s3, s7
  mv s7, s1
.L422:
  li a2, 0
  slt a2, s8, s10
  mv a3, a2
  bnez a3, .L423
  j .L424
.L423:
  nop
  j .L427
.L424:
  mv s1, s8
  mv s8, s10
  mv s10, s1
.L427:
  li a2, 0
  slt a2, s7, s9
  mv a3, a2
  bnez a3, .L428
  j .L429
.L428:
  nop
  j .L432
.L429:
  mv s1, s7
  mv s7, s9
  mv s9, s1
.L432:
  li a2, 0
  slt a2, s4, s8
  mv a3, a2
  bnez a3, .L433
  j .L434
.L433:
  nop
  j .L437
.L434:
  mv s1, s4
  mv s4, s8
  mv s8, s1
.L437:
  li a2, 0
  slt a2, s3, s7
  mv a3, a2
  bnez a3, .L438
  j .L439
.L438:
  nop
  j .L442
.L439:
  mv s1, s3
  mv s3, s7
  mv s7, s1
.L442:
  li a2, 0
  slt a2, s8, s10
  mv a3, a2
  bnez a3, .L443
  j .L444
.L443:
  nop
  j .L447
.L444:
  mv s1, s8
  mv s8, s10
  mv s10, s1
.L447:
  ld a3, 0(a0)
  li a2, 0
  slt a2, a3, s6
  mv a3, a2
  bnez a3, .L448
  j .L449
.L448:
  nop
  j .L452
.L449:
  ld a3, 0(a0)
  mv s1, a3
  sd s6, 0(a0)
  mv s6, s1
.L452:
  li a2, 0
  slt a2, s5, s11
  mv a3, a2
  bnez a3, .L453
  j .L454
.L453:
  nop
  j .L457
.L454:
  mv s1, s5
  mv s5, s11
  mv s11, s1
.L457:
  li a2, 0
  slt a2, s6, s2
  mv a3, a2
  bnez a3, .L458
  j .L459
.L458:
  nop
  j .L462
.L459:
  mv s1, s6
  mv s6, s2
  mv s2, s1
.L462:
  ld a3, 0(a0)
  li a2, 0
  slt a2, a3, s6
  mv a3, a2
  bnez a3, .L463
  j .L464
.L463:
  nop
  j .L467
.L464:
  ld a3, 0(a0)
  mv s1, a3
  sd s6, 0(a0)
  mv s6, s1
.L467:
  li a2, 0
  slt a2, s3, s6
  mv a3, a2
  bnez a3, .L468
  j .L469
.L468:
  nop
  j .L472
.L469:
  mv s1, s3
  mv s3, s6
  mv s6, s1
.L472:
  li a2, 0
  slt a2, s11, s10
  mv a3, a2
  bnez a3, .L473
  j .L474
.L473:
  nop
  j .L477
.L474:
  mv s1, s11
  mv s11, s10
  mv s10, s1
.L477:
  li a2, 0
  slt a2, s5, s2
  mv a3, a2
  bnez a3, .L478
  j .L479
.L478:
  nop
  j .L482
.L479:
  mv s1, s5
  mv s5, s2
  mv s2, s1
.L482:
  li a2, 0
  slt a2, s4, s5
  mv a3, a2
  bnez a3, .L483
  j .L484
.L483:
  nop
  j .L487
.L484:
  mv s1, s4
  mv s4, s5
  mv s5, s1
.L487:
  li a2, 0
  slt a2, s2, s9
  mv a3, a2
  bnez a3, .L488
  j .L489
.L488:
  nop
  j .L492
.L489:
  mv s1, s2
  mv s2, s9
  mv s9, s1
.L492:
  li a2, 0
  slt a2, s4, s6
  mv a3, a2
  bnez a3, .L493
  j .L494
.L493:
  nop
  j .L497
.L494:
  mv s1, s4
  mv s4, s6
  mv s6, s1
.L497:
  li a2, 0
  slt a2, s11, s9
  mv a3, a2
  bnez a3, .L498
  j .L499
.L498:
  nop
  j .L502
.L499:
  mv s1, s11
  mv s11, s9
  mv s9, s1
.L502:
  li a2, 0
  slt a2, s5, s7
  mv a3, a2
  bnez a3, .L503
  j .L504
.L503:
  nop
  j .L507
.L504:
  mv s1, s5
  mv s5, s7
  mv s7, s1
.L507:
  li a2, 0
  slt a2, s8, s2
  mv a3, a2
  bnez a3, .L508
  j .L509
.L508:
  nop
  j .L512
.L509:
  mv s1, s8
  mv s8, s2
  mv s2, s1
.L512:
  li a2, 0
  slt a2, s5, s6
  mv a3, a2
  bnez a3, .L513
  j .L514
.L513:
  nop
  j .L517
.L514:
  mv s1, s5
  mv s5, s6
  mv s6, s1
.L517:
  li a2, 0
  slt a2, s7, s8
  mv a3, a2
  bnez a3, .L518
  j .L519
.L518:
  nop
  j .L522
.L519:
  mv s1, s7
  mv s7, s8
  mv s8, s1
.L522:
  li a2, 0
  slt a2, s11, s2
  mv a3, a2
  bnez a3, .L523
  j .L524
.L523:
  nop
  j .L527
.L524:
  mv s1, s11
  mv s11, s2
  mv s2, s1
.L527:
  ld a3, 0(a0)
  add a3, a3, s3
  add a3, a3, s4
  add a3, a3, s5
  add a3, a3, s6
  add a3, a3, s7
  add a3, a3, s8
  add a3, a3, s11
  add a3, a3, s2
  add a3, a3, s9
  add a3, a3, s10
  sd a3, 96(a0)
  sd s1, 16(a0)
  sd s2, 72(a0)
  sd s3, 8(a0)
  sd s4, 24(a0)
  sd s5, 32(a0)
  sd s6, 40(a0)
  sd s7, 48(a0)
  sd s8, 56(a0)
  sd s9, 80(a0)
  sd s10, 88(a0)
  sd s11, 64(a0)
  ld  s0,24(sp)
  addi  sp,sp,32
  jr  ra
  .size comp_network, .-comp_network
  .ident  "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
  .section  .note.GNU-stack,"",@progbits