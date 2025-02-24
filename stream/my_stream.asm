
my_stream.exe:     file format elf64-littleaarch64


Disassembly of section .init:

0000000000400518 <_init>:
  400518:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  40051c:	910003fd 	mov	x29, sp
  400520:	940001ae 	bl	400bd8 <call_weak_fn>
  400524:	a8c17bfd 	ldp	x29, x30, [sp], #16
  400528:	d65f03c0 	ret

Disassembly of section .plt:

0000000000400530 <.plt>:
  400530:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
  400534:	b0000090 	adrp	x16, 411000 <__FRAME_END__+0xf2d0>
  400538:	f947fe11 	ldr	x17, [x16, #4088]
  40053c:	913fe210 	add	x16, x16, #0xff8
  400540:	d61f0220 	br	x17
  400544:	d503201f 	nop
  400548:	d503201f 	nop
  40054c:	d503201f 	nop

0000000000400550 <memcpy@plt>:
  400550:	d0000090 	adrp	x16, 412000 <memcpy@GLIBC_2.17>
  400554:	f9400211 	ldr	x17, [x16]
  400558:	91000210 	add	x16, x16, #0x0
  40055c:	d61f0220 	br	x17

0000000000400560 <__libc_start_main@plt>:
  400560:	d0000090 	adrp	x16, 412000 <memcpy@GLIBC_2.17>
  400564:	f9400611 	ldr	x17, [x16, #8]
  400568:	91002210 	add	x16, x16, #0x8
  40056c:	d61f0220 	br	x17

0000000000400570 <memset@plt>:
  400570:	d0000090 	adrp	x16, 412000 <memcpy@GLIBC_2.17>
  400574:	f9400a11 	ldr	x17, [x16, #16]
  400578:	91004210 	add	x16, x16, #0x10
  40057c:	d61f0220 	br	x17

0000000000400580 <gettimeofday@plt>:
  400580:	d0000090 	adrp	x16, 412000 <memcpy@GLIBC_2.17>
  400584:	f9400e11 	ldr	x17, [x16, #24]
  400588:	91006210 	add	x16, x16, #0x18
  40058c:	d61f0220 	br	x17

0000000000400590 <__gmon_start__@plt>:
  400590:	d0000090 	adrp	x16, 412000 <memcpy@GLIBC_2.17>
  400594:	f9401211 	ldr	x17, [x16, #32]
  400598:	91008210 	add	x16, x16, #0x20
  40059c:	d61f0220 	br	x17

00000000004005a0 <abort@plt>:
  4005a0:	d0000090 	adrp	x16, 412000 <memcpy@GLIBC_2.17>
  4005a4:	f9401611 	ldr	x17, [x16, #40]
  4005a8:	9100a210 	add	x16, x16, #0x28
  4005ac:	d61f0220 	br	x17

00000000004005b0 <puts@plt>:
  4005b0:	d0000090 	adrp	x16, 412000 <memcpy@GLIBC_2.17>
  4005b4:	f9401a11 	ldr	x17, [x16, #48]
  4005b8:	9100c210 	add	x16, x16, #0x30
  4005bc:	d61f0220 	br	x17

00000000004005c0 <printf@plt>:
  4005c0:	d0000090 	adrp	x16, 412000 <memcpy@GLIBC_2.17>
  4005c4:	f9401e11 	ldr	x17, [x16, #56]
  4005c8:	9100e210 	add	x16, x16, #0x38
  4005cc:	d61f0220 	br	x17

Disassembly of section .text:

00000000004005d0 <main>:
  4005d0:	a9a37bfd 	stp	x29, x30, [sp, #-464]!
  4005d4:	910003fd 	mov	x29, sp
  4005d8:	a90363f7 	stp	x23, x24, [sp, #48]
  4005dc:	b0000017 	adrp	x23, 401000 <checkSTREAMresults+0x13c>
  4005e0:	911702f7 	add	x23, x23, #0x5c0
  4005e4:	aa1703e0 	mov	x0, x23
  4005e8:	a90153f3 	stp	x19, x20, [sp, #16]
  4005ec:	d2968018 	mov	x24, #0xb400                	// #46080
  4005f0:	a9025bf5 	stp	x21, x22, [sp, #32]
  4005f4:	9004c556 	adrp	x22, 9ca8000 <b+0x4c4ab40>
  4005f8:	912302d6 	add	x22, x22, #0x8c0
  4005fc:	a9046bf9 	stp	x25, x26, [sp, #64]
  400600:	f2a09898 	movk	x24, #0x4c4, lsl #16
  400604:	aa1603f4 	mov	x20, x22
  400608:	6d0527e8 	stp	d8, d9, [sp, #80]
  40060c:	8b1802d8 	add	x24, x22, x24
  400610:	6d062fea 	stp	d10, d11, [sp, #96]
  400614:	97ffffe7 	bl	4005b0 <puts@plt>
  400618:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  40061c:	91180000 	add	x0, x0, #0x600
  400620:	97ffffe4 	bl	4005b0 <puts@plt>
  400624:	aa1703e0 	mov	x0, x23
  400628:	97ffffe2 	bl	4005b0 <puts@plt>
  40062c:	52800101 	mov	w1, #0x8                   	// #8
  400630:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400634:	9118a000 	add	x0, x0, #0x628
  400638:	97ffffe2 	bl	4005c0 <printf@plt>
  40063c:	aa1703e0 	mov	x0, x23
  400640:	97ffffdc 	bl	4005b0 <puts@plt>
  400644:	d292d001 	mov	x1, #0x9680                	// #38528
  400648:	52800002 	mov	w2, #0x0                   	// #0
  40064c:	f2a01301 	movk	x1, #0x98, lsl #16
  400650:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400654:	91196000 	add	x0, x0, #0x658
  400658:	97ffffda 	bl	4005c0 <printf@plt>
  40065c:	d2c25a01 	mov	x1, #0x12d000000000        	// #20684562497536
  400660:	d2c25a00 	mov	x0, #0x12d000000000        	// #20684562497536
  400664:	f2e7f661 	movk	x1, #0x3fb3, lsl #48
  400668:	f2e80a60 	movk	x0, #0x4053, lsl #48
  40066c:	9e670021 	fmov	d1, x1
  400670:	9e670000 	fmov	d0, x0
  400674:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400678:	911a4000 	add	x0, x0, #0x690
  40067c:	97ffffd1 	bl	4005c0 <printf@plt>
  400680:	d2d38701 	mov	x1, #0x9c3800000000        	// #171764332101632
  400684:	d2d38700 	mov	x0, #0x9c3800000000        	// #171764332101632
  400688:	f2e7f981 	movk	x1, #0x3fcc, lsl #48
  40068c:	f2e80d80 	movk	x0, #0x406c, lsl #48
  400690:	9e670021 	fmov	d1, x1
  400694:	9e670000 	fmov	d0, x0
  400698:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  40069c:	911b0000 	add	x0, x0, #0x6c0
  4006a0:	97ffffc8 	bl	4005c0 <printf@plt>
  4006a4:	52800141 	mov	w1, #0xa                   	// #10
  4006a8:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  4006ac:	911bc000 	add	x0, x0, #0x6f0
  4006b0:	97ffffc4 	bl	4005c0 <printf@plt>
  4006b4:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  4006b8:	911c6000 	add	x0, x0, #0x718
  4006bc:	97ffffbd 	bl	4005b0 <puts@plt>
  4006c0:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  4006c4:	911d8000 	add	x0, x0, #0x760
  4006c8:	97ffffba 	bl	4005b0 <puts@plt>
  4006cc:	6f03f600 	fmov	v0.2d, #1.000000000000000000e+00
  4006d0:	aa1603e0 	mov	x0, x22
  4006d4:	d503201f 	nop
  4006d8:	3c810400 	str	q0, [x0], #16
  4006dc:	eb00031f 	cmp	x24, x0
  4006e0:	54ffffc1 	b.ne	4006d8 <main+0x108>  // b.any
  4006e4:	b00262f5 	adrp	x21, 505d000 <c+0x4c4af40>
  4006e8:	d2968001 	mov	x1, #0xb400                	// #46080
  4006ec:	911302b5 	add	x21, x21, #0x4c0
  4006f0:	f2a09881 	movk	x1, #0x4c4, lsl #16
  4006f4:	6f00f400 	fmov	v0.2d, #2.000000000000000000e+00
  4006f8:	aa1503e0 	mov	x0, x21
  4006fc:	8b0102a1 	add	x1, x21, x1
  400700:	3c810400 	str	q0, [x0], #16
  400704:	eb00003f 	cmp	x1, x0
  400708:	54ffffc1 	b.ne	400700 <main+0x130>  // b.any
  40070c:	d2968002 	mov	x2, #0xb400                	// #46080
  400710:	52800001 	mov	w1, #0x0                   	// #0
  400714:	f2a09882 	movk	x2, #0x4c4, lsl #16
  400718:	d0000093 	adrp	x19, 412000 <memcpy@GLIBC_2.17>
  40071c:	91030273 	add	x19, x19, #0xc0
  400720:	aa1303e0 	mov	x0, x19
  400724:	97ffff93 	bl	400570 <memset@plt>
  400728:	aa1703e0 	mov	x0, x23
  40072c:	97ffffa1 	bl	4005b0 <puts@plt>
  400730:	9400015c 	bl	400ca0 <checktick>
  400734:	2a0003fa 	mov	w26, w0
  400738:	7100001f 	cmp	w0, #0x0
  40073c:	5400226d 	b.le	400b88 <main+0x5b8>
  400740:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400744:	2a1a03e1 	mov	w1, w26
  400748:	911e6000 	add	x0, x0, #0x798
  40074c:	97ffff9d 	bl	4005c0 <printf@plt>
  400750:	910203e1 	add	x1, sp, #0x80
  400754:	910243e0 	add	x0, sp, #0x90
  400758:	97ffff8a 	bl	400580 <gettimeofday@plt>
  40075c:	6d4903ea 	ldp	d10, d0, [sp, #144]
  400760:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400764:	fd451801 	ldr	d1, [x0, #2608]
  400768:	5e61d94a 	scvtf	d10, d10
  40076c:	5e61d800 	scvtf	d0, d0
  400770:	1f41280a 	fmadd	d10, d0, d1, d10
  400774:	d503201f 	nop
  400778:	3dc00280 	ldr	q0, [x20]
  40077c:	4e60d400 	fadd	v0.2d, v0.2d, v0.2d
  400780:	3c810680 	str	q0, [x20], #16
  400784:	eb18029f 	cmp	x20, x24
  400788:	54ffff81 	b.ne	400778 <main+0x1a8>  // b.any
  40078c:	910203e1 	add	x1, sp, #0x80
  400790:	910243e0 	add	x0, sp, #0x90
  400794:	97ffff7b 	bl	400580 <gettimeofday@plt>
  400798:	910243f8 	add	x24, sp, #0x90
  40079c:	6d490be9 	ldp	d9, d2, [sp, #144]
  4007a0:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  4007a4:	d2968014 	mov	x20, #0xb400                	// #46080
  4007a8:	910383f9 	add	x25, sp, #0xe0
  4007ac:	fd451808 	ldr	d8, [x0, #2608]
  4007b0:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
  4007b4:	5e61d842 	scvtf	d2, d2
  4007b8:	5e61d929 	scvtf	d9, d9
  4007bc:	f2e825c0 	movk	x0, #0x412e, lsl #48
  4007c0:	9e670000 	fmov	d0, x0
  4007c4:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  4007c8:	91208000 	add	x0, x0, #0x820
  4007cc:	f2a09894 	movk	x20, #0x4c4, lsl #16
  4007d0:	1f482449 	fmadd	d9, d2, d8, d9
  4007d4:	1e6a3929 	fsub	d9, d9, d10
  4007d8:	1e600929 	fmul	d9, d9, d0
  4007dc:	1e780121 	fcvtzs	w1, d9
  4007e0:	97ffff78 	bl	4005c0 <printf@plt>
  4007e4:	1e620340 	scvtf	d0, w26
  4007e8:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  4007ec:	91218000 	add	x0, x0, #0x860
  4007f0:	1e601929 	fdiv	d9, d9, d0
  4007f4:	1e780121 	fcvtzs	w1, d9
  4007f8:	97ffff72 	bl	4005c0 <printf@plt>
  4007fc:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400800:	9121e000 	add	x0, x0, #0x878
  400804:	97ffff6b 	bl	4005b0 <puts@plt>
  400808:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  40080c:	9122c000 	add	x0, x0, #0x8b0
  400810:	97ffff68 	bl	4005b0 <puts@plt>
  400814:	aa1703e0 	mov	x0, x23
  400818:	97ffff66 	bl	4005b0 <puts@plt>
  40081c:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400820:	9123a000 	add	x0, x0, #0x8e8
  400824:	97ffff63 	bl	4005b0 <puts@plt>
  400828:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  40082c:	91246000 	add	x0, x0, #0x918
  400830:	97ffff60 	bl	4005b0 <puts@plt>
  400834:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400838:	91252000 	add	x0, x0, #0x948
  40083c:	97ffff5d 	bl	4005b0 <puts@plt>
  400840:	aa1703e0 	mov	x0, x23
  400844:	97ffff5b 	bl	4005b0 <puts@plt>
  400848:	910203e1 	add	x1, sp, #0x80
  40084c:	aa1803e0 	mov	x0, x24
  400850:	97ffff4c 	bl	400580 <gettimeofday@plt>
  400854:	6d4903e9 	ldp	d9, d0, [sp, #144]
  400858:	5e61d929 	scvtf	d9, d9
  40085c:	5e61d800 	scvtf	d0, d0
  400860:	1f482409 	fmadd	d9, d0, d8, d9
  400864:	9101e3e1 	add	x1, sp, #0x78
  400868:	910203e0 	add	x0, sp, #0x80
  40086c:	97ffff45 	bl	400580 <gettimeofday@plt>
  400870:	6d4803ea 	ldp	d10, d0, [sp, #128]
  400874:	aa1403e2 	mov	x2, x20
  400878:	aa1603e1 	mov	x1, x22
  40087c:	aa1303e0 	mov	x0, x19
  400880:	5e61d800 	scvtf	d0, d0
  400884:	5e61d94a 	scvtf	d10, d10
  400888:	1f48280a 	fmadd	d10, d0, d8, d10
  40088c:	97ffff31 	bl	400550 <memcpy@plt>
  400890:	9101e3e1 	add	x1, sp, #0x78
  400894:	910203e0 	add	x0, sp, #0x80
  400898:	97ffff3a 	bl	400580 <gettimeofday@plt>
  40089c:	6d480be0 	ldp	d0, d2, [sp, #128]
  4008a0:	9101e3e1 	add	x1, sp, #0x78
  4008a4:	910203e0 	add	x0, sp, #0x80
  4008a8:	5e61d842 	scvtf	d2, d2
  4008ac:	5e61d800 	scvtf	d0, d0
  4008b0:	1f480040 	fmadd	d0, d2, d8, d0
  4008b4:	1e6a3800 	fsub	d0, d0, d10
  4008b8:	fd000300 	str	d0, [x24]
  4008bc:	97ffff31 	bl	400580 <gettimeofday@plt>
  4008c0:	6d4803ea 	ldp	d10, d0, [sp, #128]
  4008c4:	d2800000 	mov	x0, #0x0                   	// #0
  4008c8:	6f00f501 	fmov	v1.2d, #3.000000000000000000e+00
  4008cc:	5e61d94a 	scvtf	d10, d10
  4008d0:	5e61d800 	scvtf	d0, d0
  4008d4:	1f48280a 	fmadd	d10, d0, d8, d10
  4008d8:	3ce06a60 	ldr	q0, [x19, x0]
  4008dc:	6e61dc00 	fmul	v0.2d, v0.2d, v1.2d
  4008e0:	3ca06aa0 	str	q0, [x21, x0]
  4008e4:	91004000 	add	x0, x0, #0x10
  4008e8:	eb14001f 	cmp	x0, x20
  4008ec:	54ffff61 	b.ne	4008d8 <main+0x308>  // b.any
  4008f0:	9101e3e1 	add	x1, sp, #0x78
  4008f4:	910203e0 	add	x0, sp, #0x80
  4008f8:	97ffff22 	bl	400580 <gettimeofday@plt>
  4008fc:	6d480be0 	ldp	d0, d2, [sp, #128]
  400900:	9101e3e1 	add	x1, sp, #0x78
  400904:	910203e0 	add	x0, sp, #0x80
  400908:	5e61d842 	scvtf	d2, d2
  40090c:	5e61d800 	scvtf	d0, d0
  400910:	1f480040 	fmadd	d0, d2, d8, d0
  400914:	1e6a3800 	fsub	d0, d0, d10
  400918:	fd002b00 	str	d0, [x24, #80]
  40091c:	97ffff19 	bl	400580 <gettimeofday@plt>
  400920:	6d4803ea 	ldp	d10, d0, [sp, #128]
  400924:	d2800000 	mov	x0, #0x0                   	// #0
  400928:	5e61d94a 	scvtf	d10, d10
  40092c:	5e61d800 	scvtf	d0, d0
  400930:	1f48280a 	fmadd	d10, d0, d8, d10
  400934:	d503201f 	nop
  400938:	3ce06ac0 	ldr	q0, [x22, x0]
  40093c:	3ce06aa2 	ldr	q2, [x21, x0]
  400940:	4e62d400 	fadd	v0.2d, v0.2d, v2.2d
  400944:	3ca06a60 	str	q0, [x19, x0]
  400948:	91004000 	add	x0, x0, #0x10
  40094c:	eb14001f 	cmp	x0, x20
  400950:	54ffff41 	b.ne	400938 <main+0x368>  // b.any
  400954:	9101e3e1 	add	x1, sp, #0x78
  400958:	910203e0 	add	x0, sp, #0x80
  40095c:	97ffff09 	bl	400580 <gettimeofday@plt>
  400960:	6d480be0 	ldp	d0, d2, [sp, #128]
  400964:	9101e3e1 	add	x1, sp, #0x78
  400968:	910203e0 	add	x0, sp, #0x80
  40096c:	5e61d842 	scvtf	d2, d2
  400970:	5e61d800 	scvtf	d0, d0
  400974:	1f480040 	fmadd	d0, d2, d8, d0
  400978:	1e6a3800 	fsub	d0, d0, d10
  40097c:	fd005300 	str	d0, [x24, #160]
  400980:	97ffff00 	bl	400580 <gettimeofday@plt>
  400984:	6d4803ea 	ldp	d10, d0, [sp, #128]
  400988:	d2800000 	mov	x0, #0x0                   	// #0
  40098c:	6f00f501 	fmov	v1.2d, #3.000000000000000000e+00
  400990:	5e61d94a 	scvtf	d10, d10
  400994:	5e61d800 	scvtf	d0, d0
  400998:	1f48280a 	fmadd	d10, d0, d8, d10
  40099c:	d503201f 	nop
  4009a0:	3ce06a62 	ldr	q2, [x19, x0]
  4009a4:	3ce06aa0 	ldr	q0, [x21, x0]
  4009a8:	4e61cc40 	fmla	v0.2d, v2.2d, v1.2d
  4009ac:	3ca06ac0 	str	q0, [x22, x0]
  4009b0:	91004000 	add	x0, x0, #0x10
  4009b4:	eb14001f 	cmp	x0, x20
  4009b8:	54ffff41 	b.ne	4009a0 <main+0x3d0>  // b.any
  4009bc:	9101e3e1 	add	x1, sp, #0x78
  4009c0:	910203e0 	add	x0, sp, #0x80
  4009c4:	97fffeef 	bl	400580 <gettimeofday@plt>
  4009c8:	91002318 	add	x24, x24, #0x8
  4009cc:	6d480be0 	ldp	d0, d2, [sp, #128]
  4009d0:	5e61d800 	scvtf	d0, d0
  4009d4:	5e61d842 	scvtf	d2, d2
  4009d8:	1f480040 	fmadd	d0, d2, d8, d0
  4009dc:	1e6a3800 	fsub	d0, d0, d10
  4009e0:	fd007700 	str	d0, [x24, #232]
  4009e4:	eb19031f 	cmp	x24, x25
  4009e8:	54fff3e1 	b.ne	400864 <main+0x294>  // b.any
  4009ec:	9101e3e1 	add	x1, sp, #0x78
  4009f0:	910203e0 	add	x0, sp, #0x80
  4009f4:	97fffee3 	bl	400580 <gettimeofday@plt>
  4009f8:	6d4807e0 	ldp	d0, d1, [sp, #128]
  4009fc:	d0000082 	adrp	x2, 412000 <memcpy@GLIBC_2.17>
  400a00:	d0000081 	adrp	x1, 412000 <memcpy@GLIBC_2.17>
  400a04:	91020054 	add	x20, x2, #0x80
  400a08:	91014035 	add	x21, x1, #0x50
  400a0c:	fd404055 	ldr	d21, [x2, #128]
  400a10:	5e61d800 	scvtf	d0, d0
  400a14:	5e61d821 	scvtf	d1, d1
  400a18:	6d40d28b 	ldp	d11, d20, [x20, #8]
  400a1c:	910263e0 	add	x0, sp, #0x98
  400a20:	6d40aab1 	ldp	d17, d10, [x21, #8]
  400a24:	1f480028 	fmadd	d8, d1, d8, d0
  400a28:	6d419293 	ldp	d19, d4, [x20, #24]
  400a2c:	6d429e90 	ldp	d16, d7, [x20, #40]
  400a30:	fd402832 	ldr	d18, [x1, #80]
  400a34:	fd400ea6 	ldr	d6, [x21, #24]
  400a38:	fd401e85 	ldr	d5, [x20, #56]
  400a3c:	1e693908 	fsub	d8, d8, d9
  400a40:	fd400003 	ldr	d3, [x0]
  400a44:	91002000 	add	x0, x0, #0x8
  400a48:	fd402402 	ldr	d2, [x0, #72]
  400a4c:	fd404c01 	ldr	d1, [x0, #152]
  400a50:	1e632250 	fcmpe	d18, d3
  400a54:	fd407400 	ldr	d0, [x0, #232]
  400a58:	1e632ab5 	fadd	d21, d21, d3
  400a5c:	1e62296b 	fadd	d11, d11, d2
  400a60:	1e612a94 	fadd	d20, d20, d1
  400a64:	1e602a73 	fadd	d19, d19, d0
  400a68:	1e634e52 	fcsel	d18, d18, d3, mi  // mi = first
  400a6c:	1e632090 	fcmpe	d4, d3
  400a70:	1e63cc84 	fcsel	d4, d4, d3, gt
  400a74:	1e622230 	fcmpe	d17, d2
  400a78:	1e624e31 	fcsel	d17, d17, d2, mi  // mi = first
  400a7c:	1e702050 	fcmpe	d2, d16
  400a80:	1e624e10 	fcsel	d16, d16, d2, mi  // mi = first
  400a84:	1e612150 	fcmpe	d10, d1
  400a88:	1e614d4a 	fcsel	d10, d10, d1, mi  // mi = first
  400a8c:	1e6120f0 	fcmpe	d7, d1
  400a90:	1e61cce7 	fcsel	d7, d7, d1, gt
  400a94:	1e6020d0 	fcmpe	d6, d0
  400a98:	1e604cc6 	fcsel	d6, d6, d0, mi  // mi = first
  400a9c:	1e6020b0 	fcmpe	d5, d0
  400aa0:	1e60cca5 	fcsel	d5, d5, d0, gt
  400aa4:	eb00033f 	cmp	x25, x0
  400aa8:	54fffcc1 	b.ne	400a40 <main+0x470>  // b.any
  400aac:	fd002832 	str	d18, [x1, #80]
  400ab0:	b0000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  400ab4:	91008298 	add	x24, x20, #0x20
  400ab8:	6d00d28b 	stp	d11, d20, [x20, #8]
  400abc:	fd451829 	ldr	d9, [x1, #2608]
  400ac0:	1e64500b 	fmov	d11, #9.000000000000000000e+00
  400ac4:	b0000016 	adrp	x22, 401000 <checkSTREAMresults+0x13c>
  400ac8:	912ac2d6 	add	x22, x22, #0xab0
  400acc:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400ad0:	b0000019 	adrp	x25, 401000 <checkSTREAMresults+0x13c>
  400ad4:	9125a000 	add	x0, x0, #0x968
  400ad8:	910082da 	add	x26, x22, #0x20
  400adc:	9126a339 	add	x25, x25, #0x9a8
  400ae0:	d2800013 	mov	x19, #0x0                   	// #0
  400ae4:	fd004055 	str	d21, [x2, #128]
  400ae8:	6d00aab1 	stp	d17, d10, [x21, #8]
  400aec:	6d009f10 	stp	d16, d7, [x24, #8]
  400af0:	6d019293 	stp	d19, d4, [x20, #24]
  400af4:	fd000ea6 	str	d6, [x21, #24]
  400af8:	fd000f05 	str	d5, [x24, #24]
  400afc:	97fffead 	bl	4005b0 <puts@plt>
  400b00:	fc737ac0 	ldr	d0, [x22, x19, lsl #3]
  400b04:	aa1903e0 	mov	x0, x25
  400b08:	fc737a81 	ldr	d1, [x20, x19, lsl #3]
  400b0c:	fc737aa2 	ldr	d2, [x21, x19, lsl #3]
  400b10:	1e690800 	fmul	d0, d0, d9
  400b14:	fc737b03 	ldr	d3, [x24, x19, lsl #3]
  400b18:	1e6b1821 	fdiv	d1, d1, d11
  400b1c:	f8737b41 	ldr	x1, [x26, x19, lsl #3]
  400b20:	1e621800 	fdiv	d0, d0, d2
  400b24:	fc337a81 	str	d1, [x20, x19, lsl #3]
  400b28:	91000673 	add	x19, x19, #0x1
  400b2c:	97fffea5 	bl	4005c0 <printf@plt>
  400b30:	f100127f 	cmp	x19, #0x4
  400b34:	54fffe61 	b.ne	400b00 <main+0x530>  // b.any
  400b38:	aa1703e0 	mov	x0, x23
  400b3c:	97fffe9d 	bl	4005b0 <puts@plt>
  400b40:	1e604100 	fmov	d0, d8
  400b44:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400b48:	91274000 	add	x0, x0, #0x9d0
  400b4c:	97fffe9d 	bl	4005c0 <printf@plt>
  400b50:	aa1703e0 	mov	x0, x23
  400b54:	97fffe97 	bl	4005b0 <puts@plt>
  400b58:	940000db 	bl	400ec4 <checkSTREAMresults>
  400b5c:	aa1703e0 	mov	x0, x23
  400b60:	97fffe94 	bl	4005b0 <puts@plt>
  400b64:	52800000 	mov	w0, #0x0                   	// #0
  400b68:	a94153f3 	ldp	x19, x20, [sp, #16]
  400b6c:	a9425bf5 	ldp	x21, x22, [sp, #32]
  400b70:	a94363f7 	ldp	x23, x24, [sp, #48]
  400b74:	a9446bf9 	ldp	x25, x26, [sp, #64]
  400b78:	6d4527e8 	ldp	d8, d9, [sp, #80]
  400b7c:	6d462fea 	ldp	d10, d11, [sp, #96]
  400b80:	a8dd7bfd 	ldp	x29, x30, [sp], #464
  400b84:	d65f03c0 	ret
  400b88:	5280003a 	mov	w26, #0x1                   	// #1
  400b8c:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400b90:	911f8000 	add	x0, x0, #0x7e0
  400b94:	97fffe87 	bl	4005b0 <puts@plt>
  400b98:	17fffeee 	b	400750 <main+0x180>

0000000000400b9c <_start>:
  400b9c:	d280001d 	mov	x29, #0x0                   	// #0
  400ba0:	d280001e 	mov	x30, #0x0                   	// #0
  400ba4:	aa0003e5 	mov	x5, x0
  400ba8:	f94003e1 	ldr	x1, [sp]
  400bac:	910023e2 	add	x2, sp, #0x8
  400bb0:	910003e6 	mov	x6, sp
  400bb4:	90000000 	adrp	x0, 400000 <_init-0x518>
  400bb8:	912f5000 	add	x0, x0, #0xbd4
  400bbc:	b0000003 	adrp	x3, 401000 <checkSTREAMresults+0x13c>
  400bc0:	910c6063 	add	x3, x3, #0x318
  400bc4:	b0000004 	adrp	x4, 401000 <checkSTREAMresults+0x13c>
  400bc8:	910e6084 	add	x4, x4, #0x398
  400bcc:	97fffe65 	bl	400560 <__libc_start_main@plt>
  400bd0:	97fffe74 	bl	4005a0 <abort@plt>

0000000000400bd4 <__wrap_main>:
  400bd4:	17fffe7f 	b	4005d0 <main>

0000000000400bd8 <call_weak_fn>:
  400bd8:	b0000080 	adrp	x0, 411000 <__FRAME_END__+0xf2d0>
  400bdc:	f947f000 	ldr	x0, [x0, #4064]
  400be0:	b4000040 	cbz	x0, 400be8 <call_weak_fn+0x10>
  400be4:	17fffe6b 	b	400590 <__gmon_start__@plt>
  400be8:	d65f03c0 	ret
  400bec:	d503201f 	nop

0000000000400bf0 <deregister_tm_clones>:
  400bf0:	d0000080 	adrp	x0, 412000 <memcpy@GLIBC_2.17>
  400bf4:	9101c000 	add	x0, x0, #0x70
  400bf8:	d0000081 	adrp	x1, 412000 <memcpy@GLIBC_2.17>
  400bfc:	9101c021 	add	x1, x1, #0x70
  400c00:	eb00003f 	cmp	x1, x0
  400c04:	540000c0 	b.eq	400c1c <deregister_tm_clones+0x2c>  // b.none
  400c08:	b0000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  400c0c:	f941dc21 	ldr	x1, [x1, #952]
  400c10:	b4000061 	cbz	x1, 400c1c <deregister_tm_clones+0x2c>
  400c14:	aa0103f0 	mov	x16, x1
  400c18:	d61f0200 	br	x16
  400c1c:	d65f03c0 	ret

0000000000400c20 <register_tm_clones>:
  400c20:	d0000080 	adrp	x0, 412000 <memcpy@GLIBC_2.17>
  400c24:	9101c000 	add	x0, x0, #0x70
  400c28:	d0000081 	adrp	x1, 412000 <memcpy@GLIBC_2.17>
  400c2c:	9101c021 	add	x1, x1, #0x70
  400c30:	cb000021 	sub	x1, x1, x0
  400c34:	d37ffc22 	lsr	x2, x1, #63
  400c38:	8b810c41 	add	x1, x2, x1, asr #3
  400c3c:	9341fc21 	asr	x1, x1, #1
  400c40:	b40000c1 	cbz	x1, 400c58 <register_tm_clones+0x38>
  400c44:	b0000002 	adrp	x2, 401000 <checkSTREAMresults+0x13c>
  400c48:	f941e042 	ldr	x2, [x2, #960]
  400c4c:	b4000062 	cbz	x2, 400c58 <register_tm_clones+0x38>
  400c50:	aa0203f0 	mov	x16, x2
  400c54:	d61f0200 	br	x16
  400c58:	d65f03c0 	ret
  400c5c:	d503201f 	nop

0000000000400c60 <__do_global_dtors_aux>:
  400c60:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  400c64:	910003fd 	mov	x29, sp
  400c68:	f9000bf3 	str	x19, [sp, #16]
  400c6c:	d0000093 	adrp	x19, 412000 <memcpy@GLIBC_2.17>
  400c70:	3941c260 	ldrb	w0, [x19, #112]
  400c74:	35000080 	cbnz	w0, 400c84 <__do_global_dtors_aux+0x24>
  400c78:	97ffffde 	bl	400bf0 <deregister_tm_clones>
  400c7c:	52800020 	mov	w0, #0x1                   	// #1
  400c80:	3901c260 	strb	w0, [x19, #112]
  400c84:	f9400bf3 	ldr	x19, [sp, #16]
  400c88:	a8c27bfd 	ldp	x29, x30, [sp], #32
  400c8c:	d65f03c0 	ret

0000000000400c90 <frame_dummy>:
  400c90:	17ffffe4 	b	400c20 <register_tm_clones>
  400c94:	d503201f 	nop
  400c98:	d503201f 	nop
  400c9c:	d503201f 	nop

0000000000400ca0 <checktick>:
  400ca0:	a9b17bfd 	stp	x29, x30, [sp, #-240]!
  400ca4:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400ca8:	910003fd 	mov	x29, sp
  400cac:	a90153f3 	stp	x19, x20, [sp, #16]
  400cb0:	910143f3 	add	x19, sp, #0x50
  400cb4:	9103c3f4 	add	x20, sp, #0xf0
  400cb8:	6d0227e8 	stp	d8, d9, [sp, #32]
  400cbc:	fd451808 	ldr	d8, [x0, #2608]
  400cc0:	9100e3e1 	add	x1, sp, #0x38
  400cc4:	910103e0 	add	x0, sp, #0x40
  400cc8:	97fffe2e 	bl	400580 <gettimeofday@plt>
  400ccc:	6d4403e9 	ldp	d9, d0, [sp, #64]
  400cd0:	5e61d929 	scvtf	d9, d9
  400cd4:	5e61d800 	scvtf	d0, d0
  400cd8:	1f482409 	fmadd	d9, d0, d8, d9
  400cdc:	d503201f 	nop
  400ce0:	9100e3e1 	add	x1, sp, #0x38
  400ce4:	910103e0 	add	x0, sp, #0x40
  400ce8:	97fffe26 	bl	400580 <gettimeofday@plt>
  400cec:	6d4407e0 	ldp	d0, d1, [sp, #64]
  400cf0:	5e61d821 	scvtf	d1, d1
  400cf4:	5e61d800 	scvtf	d0, d0
  400cf8:	1f480020 	fmadd	d0, d1, d8, d0
  400cfc:	1e693801 	fsub	d1, d0, d9
  400d00:	1e682030 	fcmpe	d1, d8
  400d04:	54fffee4 	b.mi	400ce0 <checktick+0x40>  // b.first
  400d08:	fc008660 	str	d0, [x19], #8
  400d0c:	eb14027f 	cmp	x19, x20
  400d10:	54fffd81 	b.ne	400cc0 <checktick+0x20>  // b.any
  400d14:	3dc01be1 	ldr	q1, [sp, #96]
  400d18:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
  400d1c:	3cc683e6 	ldur	q6, [sp, #104]
  400d20:	f2e825c0 	movk	x0, #0x412e, lsl #48
  400d24:	3dc01fe5 	ldr	q5, [sp, #112]
  400d28:	9e670010 	fmov	d16, x0
  400d2c:	3cc783e3 	ldur	q3, [sp, #120]
  400d30:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400d34:	4ee1d4c6 	fsub	v6.2d, v6.2d, v1.2d
  400d38:	fd406be4 	ldr	d4, [sp, #208]
  400d3c:	3dc017e0 	ldr	q0, [sp, #80]
  400d40:	4ee5d463 	fsub	v3.2d, v3.2d, v5.2d
  400d44:	fd4077e9 	ldr	d9, [sp, #232]
  400d48:	3cc583e7 	ldur	q7, [sp, #88]
  400d4c:	3dc023e8 	ldr	q8, [sp, #128]
  400d50:	3cc883e2 	ldur	q2, [sp, #136]
  400d54:	6d4d97e1 	ldp	d1, d5, [sp, #216]
  400d58:	4ee0d4e7 	fsub	v7.2d, v7.2d, v0.2d
  400d5c:	4ee8d442 	fsub	v2.2d, v2.2d, v8.2d
  400d60:	3dc29000 	ldr	q0, [x0, #2624]
  400d64:	1e643824 	fsub	d4, d1, d4
  400d68:	1e6138a1 	fsub	d1, d5, d1
  400d6c:	1e653929 	fsub	d9, d9, d5
  400d70:	3dc027f1 	ldr	q17, [sp, #144]
  400d74:	1e700884 	fmul	d4, d4, d16
  400d78:	6e60dce7 	fmul	v7.2d, v7.2d, v0.2d
  400d7c:	6e60dcc6 	fmul	v6.2d, v6.2d, v0.2d
  400d80:	6e60dc63 	fmul	v3.2d, v3.2d, v0.2d
  400d84:	6e60dc42 	fmul	v2.2d, v2.2d, v0.2d
  400d88:	1e780080 	fcvtzs	w0, d4
  400d8c:	1e700828 	fmul	d8, d1, d16
  400d90:	1e700929 	fmul	d9, d9, d16
  400d94:	4ee1b8e7 	fcvtzs	v7.2d, v7.2d
  400d98:	4ee1b8c6 	fcvtzs	v6.2d, v6.2d
  400d9c:	4ee1b863 	fcvtzs	v3.2d, v3.2d
  400da0:	4ee1b842 	fcvtzs	v2.2d, v2.2d
  400da4:	7100001f 	cmp	w0, #0x0
  400da8:	3cc983e5 	ldur	q5, [sp, #152]
  400dac:	1e780101 	fcvtzs	w1, d8
  400db0:	3dc02be1 	ldr	q1, [sp, #160]
  400db4:	1a9fa000 	csel	w0, w0, wzr, ge  // ge = tcont
  400db8:	3cca83e4 	ldur	q4, [sp, #168]
  400dbc:	1e780122 	fcvtzs	w2, d9
  400dc0:	4ef1d4a5 	fsub	v5.2d, v5.2d, v17.2d
  400dc4:	7100003f 	cmp	w1, #0x0
  400dc8:	ad45a3f0 	ldp	q16, q8, [sp, #176]
  400dcc:	1a9fa021 	csel	w1, w1, wzr, ge  // ge = tcont
  400dd0:	4ee1d484 	fsub	v4.2d, v4.2d, v1.2d
  400dd4:	0ea128e1 	xtn	v1.2s, v7.2d
  400dd8:	4ea128c1 	xtn2	v1.4s, v6.2d
  400ddc:	0ea12866 	xtn	v6.2s, v3.2d
  400de0:	4ea12846 	xtn2	v6.4s, v2.2d
  400de4:	6b01001f 	cmp	w0, w1
  400de8:	3ccb83e3 	ldur	q3, [sp, #184]
  400dec:	1a81d000 	csel	w0, w0, w1, le
  400df0:	3ccc83e2 	ldur	q2, [sp, #200]
  400df4:	b0000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  400df8:	4f000407 	movi	v7.4s, #0x0
  400dfc:	7100005f 	cmp	w2, #0x0
  400e00:	6e60dca5 	fmul	v5.2d, v5.2d, v0.2d
  400e04:	1a9fa042 	csel	w2, w2, wzr, ge  // ge = tcont
  400e08:	6e60dc84 	fmul	v4.2d, v4.2d, v0.2d
  400e0c:	4ef0d463 	fsub	v3.2d, v3.2d, v16.2d
  400e10:	4ee8d442 	fsub	v2.2d, v2.2d, v8.2d
  400e14:	4ea764c6 	smax	v6.4s, v6.4s, v7.4s
  400e18:	4ea76421 	smax	v1.4s, v1.4s, v7.4s
  400e1c:	4ee1b8a5 	fcvtzs	v5.2d, v5.2d
  400e20:	4ee1b884 	fcvtzs	v4.2d, v4.2d
  400e24:	6e60dc63 	fmul	v3.2d, v3.2d, v0.2d
  400e28:	6e60dc42 	fmul	v2.2d, v2.2d, v0.2d
  400e2c:	4ea66c21 	smin	v1.4s, v1.4s, v6.4s
  400e30:	3dc29420 	ldr	q0, [x1, #2640]
  400e34:	0ea128a6 	xtn	v6.2s, v5.2d
  400e38:	4ea12886 	xtn2	v6.4s, v4.2d
  400e3c:	4ee1b863 	fcvtzs	v3.2d, v3.2d
  400e40:	4ee1b842 	fcvtzs	v2.2d, v2.2d
  400e44:	4ea06c21 	smin	v1.4s, v1.4s, v0.4s
  400e48:	4ea764c6 	smax	v6.4s, v6.4s, v7.4s
  400e4c:	a94153f3 	ldp	x19, x20, [sp, #16]
  400e50:	0ea12860 	xtn	v0.2s, v3.2d
  400e54:	4ea12840 	xtn2	v0.4s, v2.2d
  400e58:	6d4227e8 	ldp	d8, d9, [sp, #32]
  400e5c:	4ea16cc6 	smin	v6.4s, v6.4s, v1.4s
  400e60:	4ea76400 	smax	v0.4s, v0.4s, v7.4s
  400e64:	a8cf7bfd 	ldp	x29, x30, [sp], #240
  400e68:	4ea66c00 	smin	v0.4s, v0.4s, v6.4s
  400e6c:	4eb1a800 	sminv	s0, v0.4s
  400e70:	1e260001 	fmov	w1, s0
  400e74:	6b01005f 	cmp	w2, w1
  400e78:	1a81d042 	csel	w2, w2, w1, le
  400e7c:	6b02001f 	cmp	w0, w2
  400e80:	1a82d000 	csel	w0, w0, w2, le
  400e84:	d65f03c0 	ret
  400e88:	d503201f 	nop
  400e8c:	d503201f 	nop

0000000000400e90 <mysecond>:
  400e90:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  400e94:	910003fd 	mov	x29, sp
  400e98:	910063e1 	add	x1, sp, #0x18
  400e9c:	910083e0 	add	x0, sp, #0x20
  400ea0:	97fffdb8 	bl	400580 <gettimeofday@plt>
  400ea4:	6d4203e1 	ldp	d1, d0, [sp, #32]
  400ea8:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400eac:	fd451802 	ldr	d2, [x0, #2608]
  400eb0:	5e61d821 	scvtf	d1, d1
  400eb4:	5e61d800 	scvtf	d0, d0
  400eb8:	a8c37bfd 	ldp	x29, x30, [sp], #48
  400ebc:	1f420400 	fmadd	d0, d0, d2, d1
  400ec0:	d65f03c0 	ret

0000000000400ec4 <checkSTREAMresults>:
  400ec4:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
  400ec8:	b0000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  400ecc:	2f00e404 	movi	d4, #0x0
  400ed0:	910003fd 	mov	x29, sp
  400ed4:	fd453030 	ldr	d16, [x1, #2656]
  400ed8:	b0000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  400edc:	6d042fea 	stp	d10, d11, [sp, #64]
  400ee0:	d2800000 	mov	x0, #0x0                   	// #0
  400ee4:	fd45482a 	ldr	d10, [x1, #2704]
  400ee8:	b0000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  400eec:	1e604085 	fmov	d5, d4
  400ef0:	1e604083 	fmov	d3, d4
  400ef4:	a90153f3 	stp	x19, x20, [sp, #16]
  400ef8:	b00262f4 	adrp	x20, 505d000 <c+0x4c4af40>
  400efc:	d0000093 	adrp	x19, 412000 <memcpy@GLIBC_2.17>
  400f00:	91130294 	add	x20, x20, #0x4c0
  400f04:	91030273 	add	x19, x19, #0xc0
  400f08:	f90013f5 	str	x21, [sp, #32]
  400f0c:	9004c555 	adrp	x21, 9ca8000 <b+0x4c4ab40>
  400f10:	912302b5 	add	x21, x21, #0x8c0
  400f14:	6d0327e8 	stp	d8, d9, [sp, #48]
  400f18:	fd455029 	ldr	d9, [x1, #2720]
  400f1c:	d292d001 	mov	x1, #0x9680                	// #38528
  400f20:	fd0017ec 	str	d12, [sp, #40]
  400f24:	f2a01301 	movk	x1, #0x98, lsl #16
  400f28:	fc607aa2 	ldr	d2, [x21, x0, lsl #3]
  400f2c:	fc607a81 	ldr	d1, [x20, x0, lsl #3]
  400f30:	fc607a60 	ldr	d0, [x19, x0, lsl #3]
  400f34:	91000400 	add	x0, x0, #0x1
  400f38:	1e703842 	fsub	d2, d2, d16
  400f3c:	1e6a3821 	fsub	d1, d1, d10
  400f40:	1e693800 	fsub	d0, d0, d9
  400f44:	1e602058 	fcmpe	d2, #0.0
  400f48:	1e614048 	fneg	d8, d2
  400f4c:	1e614027 	fneg	d7, d1
  400f50:	1e614006 	fneg	d6, d0
  400f54:	1e68ac42 	fcsel	d2, d2, d8, ge  // ge = tcont
  400f58:	1e602038 	fcmpe	d1, #0.0
  400f5c:	1e67ac21 	fcsel	d1, d1, d7, ge  // ge = tcont
  400f60:	1e602018 	fcmpe	d0, #0.0
  400f64:	1e622863 	fadd	d3, d3, d2
  400f68:	1e66ac00 	fcsel	d0, d0, d6, ge  // ge = tcont
  400f6c:	1e6128a5 	fadd	d5, d5, d1
  400f70:	1e602884 	fadd	d4, d4, d0
  400f74:	eb01001f 	cmp	x0, x1
  400f78:	54fffd81 	b.ne	400f28 <checkSTREAMresults+0x64>  // b.any
  400f7c:	d2c25a00 	mov	x0, #0x12d000000000        	// #20684562497536
  400f80:	f2e82c60 	movk	x0, #0x4163, lsl #48
  400f84:	9e670001 	fmov	d1, x0
  400f88:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400f8c:	1e611868 	fdiv	d8, d3, d1
  400f90:	1e6118aa 	fdiv	d10, d5, d1
  400f94:	fd45300c 	ldr	d12, [x0, #2656]
  400f98:	b0000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  400f9c:	1e611889 	fdiv	d9, d4, d1
  400fa0:	fd453800 	ldr	d0, [x0, #2672]
  400fa4:	1e6c190b 	fdiv	d11, d8, d12
  400fa8:	1e602178 	fcmpe	d11, #0.0
  400fac:	1e614161 	fneg	d1, d11
  400fb0:	1e61ad61 	fcsel	d1, d11, d1, ge  // ge = tcont
  400fb4:	1e602030 	fcmpe	d1, d0
  400fb8:	5400140c 	b.gt	401238 <checkSTREAMresults+0x374>
  400fbc:	52800035 	mov	w21, #0x1                   	// #1
  400fc0:	52800000 	mov	w0, #0x0                   	// #0
  400fc4:	b0000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  400fc8:	fd45482b 	ldr	d11, [x1, #2704]
  400fcc:	b0000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  400fd0:	fd453820 	ldr	d0, [x1, #2672]
  400fd4:	1e6b1948 	fdiv	d8, d10, d11
  400fd8:	1e602118 	fcmpe	d8, #0.0
  400fdc:	1e614101 	fneg	d1, d8
  400fe0:	1e61ad01 	fcsel	d1, d8, d1, ge  // ge = tcont
  400fe4:	1e602030 	fcmpe	d1, d0
  400fe8:	54000b4c 	b.gt	401150 <checkSTREAMresults+0x28c>
  400fec:	b0000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  400ff0:	fd45502a 	ldr	d10, [x1, #2720]
  400ff4:	b0000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  400ff8:	fd453820 	ldr	d0, [x1, #2672]
  400ffc:	1e6a1928 	fdiv	d8, d9, d10
  401000:	1e602118 	fcmpe	d8, #0.0
  401004:	1e614101 	fneg	d1, d8
  401008:	1e61ad01 	fcsel	d1, d8, d1, ge  // ge = tcont
  40100c:	1e602030 	fcmpe	d1, d0
  401010:	5400024c 	b.gt	401058 <checkSTREAMresults+0x194>
  401014:	34000100 	cbz	w0, 401034 <checkSTREAMresults+0x170>
  401018:	a94153f3 	ldp	x19, x20, [sp, #16]
  40101c:	f94013f5 	ldr	x21, [sp, #32]
  401020:	fd4017ec 	ldr	d12, [sp, #40]
  401024:	6d4327e8 	ldp	d8, d9, [sp, #48]
  401028:	6d442fea 	ldp	d10, d11, [sp, #64]
  40102c:	a8c57bfd 	ldp	x29, x30, [sp], #80
  401030:	d65f03c0 	ret
  401034:	a94153f3 	ldp	x19, x20, [sp, #16]
  401038:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  40103c:	f94013f5 	ldr	x21, [sp, #32]
  401040:	91160000 	add	x0, x0, #0x580
  401044:	fd4017ec 	ldr	d12, [sp, #40]
  401048:	6d4327e8 	ldp	d8, d9, [sp, #48]
  40104c:	6d442fea 	ldp	d10, d11, [sp, #64]
  401050:	a8c57bfd 	ldp	x29, x30, [sp], #80
  401054:	17fffd5b 	b	4005c0 <printf@plt>
  401058:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  40105c:	91144000 	add	x0, x0, #0x510
  401060:	97fffd58 	bl	4005c0 <printf@plt>
  401064:	1e602138 	fcmpe	d9, #0.0
  401068:	5400006a 	b.ge	401074 <checkSTREAMresults+0x1b0>  // b.tcont
  40106c:	1e614128 	fneg	d8, d9
  401070:	1e6a1908 	fdiv	d8, d8, d10
  401074:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  401078:	1e604102 	fmov	d2, d8
  40107c:	1e604121 	fmov	d1, d9
  401080:	fd455000 	ldr	d0, [x0, #2720]
  401084:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  401088:	91102000 	add	x0, x0, #0x408
  40108c:	97fffd4d 	bl	4005c0 <printf@plt>
  401090:	90000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  401094:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  401098:	9112e000 	add	x0, x0, #0x4b8
  40109c:	fd453820 	ldr	d0, [x1, #2672]
  4010a0:	97fffd48 	bl	4005c0 <printf@plt>
  4010a4:	90000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  4010a8:	d2968000 	mov	x0, #0xb400                	// #46080
  4010ac:	4f000406 	movi	v6.4s, #0x0
  4010b0:	f2a09880 	movk	x0, #0x4c4, lsl #16
  4010b4:	3dc2a82a 	ldr	q10, [x1, #2720]
  4010b8:	90000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  4010bc:	6f07f609 	fmov	v9.2d, #-1.000000000000000000e+00
  4010c0:	8b000260 	add	x0, x19, x0
  4010c4:	3dc29c28 	ldr	q8, [x1, #2672]
  4010c8:	90000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  4010cc:	3dc2a027 	ldr	q7, [x1, #2688]
  4010d0:	ad400a63 	ldp	q3, q2, [x19]
  4010d4:	91008273 	add	x19, x19, #0x20
  4010d8:	6e6afc63 	fdiv	v3.2d, v3.2d, v10.2d
  4010dc:	6e6afc42 	fdiv	v2.2d, v2.2d, v10.2d
  4010e0:	4e69d463 	fadd	v3.2d, v3.2d, v9.2d
  4010e4:	4e69d442 	fadd	v2.2d, v2.2d, v9.2d
  4010e8:	6ee0f865 	fneg	v5.2d, v3.2d
  4010ec:	6ee0c861 	fcmge	v1.2d, v3.2d, #0.0
  4010f0:	6ee0f844 	fneg	v4.2d, v2.2d
  4010f4:	6ee0c840 	fcmge	v0.2d, v2.2d, #0.0
  4010f8:	6e651c61 	bsl	v1.16b, v3.16b, v5.16b
  4010fc:	6e641c40 	bsl	v0.16b, v2.16b, v4.16b
  401100:	6ee8e421 	fcmgt	v1.2d, v1.2d, v8.2d
  401104:	6ee8e400 	fcmgt	v0.2d, v0.2d, v8.2d
  401108:	4e211ce1 	and	v1.16b, v7.16b, v1.16b
  40110c:	4e201ce0 	and	v0.16b, v7.16b, v0.16b
  401110:	0ea12822 	xtn	v2.2s, v1.2d
  401114:	4ea12802 	xtn2	v2.4s, v0.2d
  401118:	4ea284c6 	add	v6.4s, v6.4s, v2.4s
  40111c:	eb13001f 	cmp	x0, x19
  401120:	54fffd81 	b.ne	4010d0 <checkSTREAMresults+0x20c>  // b.any
  401124:	4eb1b8c6 	addv	s6, v6.4s
  401128:	fd4017ec 	ldr	d12, [sp, #40]
  40112c:	a94153f3 	ldp	x19, x20, [sp, #16]
  401130:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  401134:	f94013f5 	ldr	x21, [sp, #32]
  401138:	1e2600c1 	fmov	w1, s6
  40113c:	6d4327e8 	ldp	d8, d9, [sp, #48]
  401140:	91154000 	add	x0, x0, #0x550
  401144:	6d442fea 	ldp	d10, d11, [sp, #64]
  401148:	a8c57bfd 	ldp	x29, x30, [sp], #80
  40114c:	17fffd1d 	b	4005c0 <printf@plt>
  401150:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  401154:	9111e000 	add	x0, x0, #0x478
  401158:	97fffd1a 	bl	4005c0 <printf@plt>
  40115c:	1e602158 	fcmpe	d10, #0.0
  401160:	5400006a 	b.ge	40116c <checkSTREAMresults+0x2a8>  // b.tcont
  401164:	1e614148 	fneg	d8, d10
  401168:	1e6b1908 	fdiv	d8, d8, d11
  40116c:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  401170:	1e604102 	fmov	d2, d8
  401174:	1e604141 	fmov	d1, d10
  401178:	fd454800 	ldr	d0, [x0, #2704]
  40117c:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  401180:	91102000 	add	x0, x0, #0x408
  401184:	97fffd0f 	bl	4005c0 <printf@plt>
  401188:	90000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  40118c:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  401190:	9112e000 	add	x0, x0, #0x4b8
  401194:	fd453820 	ldr	d0, [x1, #2672]
  401198:	97fffd0a 	bl	4005c0 <printf@plt>
  40119c:	90000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  4011a0:	d2968000 	mov	x0, #0xb400                	// #46080
  4011a4:	4f000406 	movi	v6.4s, #0x0
  4011a8:	f2a09880 	movk	x0, #0x4c4, lsl #16
  4011ac:	3dc2a430 	ldr	q16, [x1, #2704]
  4011b0:	90000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  4011b4:	6f07f60a 	fmov	v10.2d, #-1.000000000000000000e+00
  4011b8:	8b000280 	add	x0, x20, x0
  4011bc:	3dc29c28 	ldr	q8, [x1, #2672]
  4011c0:	90000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  4011c4:	3dc2a027 	ldr	q7, [x1, #2688]
  4011c8:	ad400a83 	ldp	q3, q2, [x20]
  4011cc:	91008294 	add	x20, x20, #0x20
  4011d0:	6e70fc63 	fdiv	v3.2d, v3.2d, v16.2d
  4011d4:	6e70fc42 	fdiv	v2.2d, v2.2d, v16.2d
  4011d8:	4e6ad463 	fadd	v3.2d, v3.2d, v10.2d
  4011dc:	4e6ad442 	fadd	v2.2d, v2.2d, v10.2d
  4011e0:	6ee0f865 	fneg	v5.2d, v3.2d
  4011e4:	6ee0c861 	fcmge	v1.2d, v3.2d, #0.0
  4011e8:	6ee0f844 	fneg	v4.2d, v2.2d
  4011ec:	6ee0c840 	fcmge	v0.2d, v2.2d, #0.0
  4011f0:	6e651c61 	bsl	v1.16b, v3.16b, v5.16b
  4011f4:	6e641c40 	bsl	v0.16b, v2.16b, v4.16b
  4011f8:	6ee8e421 	fcmgt	v1.2d, v1.2d, v8.2d
  4011fc:	6ee8e400 	fcmgt	v0.2d, v0.2d, v8.2d
  401200:	4e211ce1 	and	v1.16b, v7.16b, v1.16b
  401204:	4e201ce0 	and	v0.16b, v7.16b, v0.16b
  401208:	0ea12822 	xtn	v2.2s, v1.2d
  40120c:	4ea12802 	xtn2	v2.4s, v0.2d
  401210:	4ea284c6 	add	v6.4s, v6.4s, v2.4s
  401214:	eb14001f 	cmp	x0, x20
  401218:	54fffd81 	b.ne	4011c8 <checkSTREAMresults+0x304>  // b.any
  40121c:	4eb1b8c6 	addv	s6, v6.4s
  401220:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  401224:	91138000 	add	x0, x0, #0x4e0
  401228:	1e2600c1 	fmov	w1, s6
  40122c:	97fffce5 	bl	4005c0 <printf@plt>
  401230:	2a1503e0 	mov	w0, w21
  401234:	17ffff6e 	b	400fec <checkSTREAMresults+0x128>
  401238:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  40123c:	910f2000 	add	x0, x0, #0x3c8
  401240:	97fffce0 	bl	4005c0 <printf@plt>
  401244:	1e602118 	fcmpe	d8, #0.0
  401248:	5400006a 	b.ge	401254 <checkSTREAMresults+0x390>  // b.tcont
  40124c:	1e61410b 	fneg	d11, d8
  401250:	1e6c196b 	fdiv	d11, d11, d12
  401254:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  401258:	1e604101 	fmov	d1, d8
  40125c:	1e604162 	fmov	d2, d11
  401260:	fd453000 	ldr	d0, [x0, #2656]
  401264:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  401268:	91102000 	add	x0, x0, #0x408
  40126c:	97fffcd5 	bl	4005c0 <printf@plt>
  401270:	90000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  401274:	d2968000 	mov	x0, #0xb400                	// #46080
  401278:	4f000406 	movi	v6.4s, #0x0
  40127c:	f2a09880 	movk	x0, #0x4c4, lsl #16
  401280:	3dc29831 	ldr	q17, [x1, #2656]
  401284:	90000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  401288:	6f07f610 	fmov	v16.2d, #-1.000000000000000000e+00
  40128c:	8b0002a0 	add	x0, x21, x0
  401290:	3dc29c28 	ldr	q8, [x1, #2672]
  401294:	90000001 	adrp	x1, 401000 <checkSTREAMresults+0x13c>
  401298:	3dc2a027 	ldr	q7, [x1, #2688]
  40129c:	d503201f 	nop
  4012a0:	ad400aa3 	ldp	q3, q2, [x21]
  4012a4:	910082b5 	add	x21, x21, #0x20
  4012a8:	6e71fc63 	fdiv	v3.2d, v3.2d, v17.2d
  4012ac:	6e71fc42 	fdiv	v2.2d, v2.2d, v17.2d
  4012b0:	4e70d463 	fadd	v3.2d, v3.2d, v16.2d
  4012b4:	4e70d442 	fadd	v2.2d, v2.2d, v16.2d
  4012b8:	6ee0f865 	fneg	v5.2d, v3.2d
  4012bc:	6ee0c861 	fcmge	v1.2d, v3.2d, #0.0
  4012c0:	6ee0f844 	fneg	v4.2d, v2.2d
  4012c4:	6ee0c840 	fcmge	v0.2d, v2.2d, #0.0
  4012c8:	6e651c61 	bsl	v1.16b, v3.16b, v5.16b
  4012cc:	6e641c40 	bsl	v0.16b, v2.16b, v4.16b
  4012d0:	6ee8e421 	fcmgt	v1.2d, v1.2d, v8.2d
  4012d4:	6ee8e400 	fcmgt	v0.2d, v0.2d, v8.2d
  4012d8:	4e211ce1 	and	v1.16b, v7.16b, v1.16b
  4012dc:	4e201ce0 	and	v0.16b, v7.16b, v0.16b
  4012e0:	0ea12822 	xtn	v2.2s, v1.2d
  4012e4:	4ea12802 	xtn2	v2.4s, v0.2d
  4012e8:	4ea284c6 	add	v6.4s, v6.4s, v2.4s
  4012ec:	eb0002bf 	cmp	x21, x0
  4012f0:	54fffd81 	b.ne	4012a0 <checkSTREAMresults+0x3dc>  // b.any
  4012f4:	4eb1b8c6 	addv	s6, v6.4s
  4012f8:	90000000 	adrp	x0, 401000 <checkSTREAMresults+0x13c>
  4012fc:	91112000 	add	x0, x0, #0x448
  401300:	52800055 	mov	w21, #0x2                   	// #2
  401304:	1e2600c1 	fmov	w1, s6
  401308:	97fffcae 	bl	4005c0 <printf@plt>
  40130c:	52800020 	mov	w0, #0x1                   	// #1
  401310:	17ffff2d 	b	400fc4 <checkSTREAMresults+0x100>
  401314:	d503201f 	nop

0000000000401318 <__libc_csu_init>:
  401318:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  40131c:	910003fd 	mov	x29, sp
  401320:	a90153f3 	stp	x19, x20, [sp, #16]
  401324:	90000094 	adrp	x20, 411000 <__FRAME_END__+0xf2d0>
  401328:	9137c294 	add	x20, x20, #0xdf0
  40132c:	a9025bf5 	stp	x21, x22, [sp, #32]
  401330:	90000095 	adrp	x21, 411000 <__FRAME_END__+0xf2d0>
  401334:	9137a2b5 	add	x21, x21, #0xde8
  401338:	cb150294 	sub	x20, x20, x21
  40133c:	2a0003f6 	mov	w22, w0
  401340:	a90363f7 	stp	x23, x24, [sp, #48]
  401344:	aa0103f7 	mov	x23, x1
  401348:	aa0203f8 	mov	x24, x2
  40134c:	97fffc73 	bl	400518 <_init>
  401350:	eb940fff 	cmp	xzr, x20, asr #3
  401354:	54000160 	b.eq	401380 <__libc_csu_init+0x68>  // b.none
  401358:	9343fe94 	asr	x20, x20, #3
  40135c:	d2800013 	mov	x19, #0x0                   	// #0
  401360:	f8737aa3 	ldr	x3, [x21, x19, lsl #3]
  401364:	aa1803e2 	mov	x2, x24
  401368:	91000673 	add	x19, x19, #0x1
  40136c:	aa1703e1 	mov	x1, x23
  401370:	2a1603e0 	mov	w0, w22
  401374:	d63f0060 	blr	x3
  401378:	eb13029f 	cmp	x20, x19
  40137c:	54ffff21 	b.ne	401360 <__libc_csu_init+0x48>  // b.any
  401380:	a94153f3 	ldp	x19, x20, [sp, #16]
  401384:	a9425bf5 	ldp	x21, x22, [sp, #32]
  401388:	a94363f7 	ldp	x23, x24, [sp, #48]
  40138c:	a8c47bfd 	ldp	x29, x30, [sp], #64
  401390:	d65f03c0 	ret
  401394:	d503201f 	nop

0000000000401398 <__libc_csu_fini>:
  401398:	d65f03c0 	ret

Disassembly of section .fini:

000000000040139c <_fini>:
  40139c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  4013a0:	910003fd 	mov	x29, sp
  4013a4:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4013a8:	d65f03c0 	ret
