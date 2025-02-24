
stream.exe:     file format elf64-littleaarch64


Disassembly of section .init:

00000000000007d8 <_init>:
 7d8:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 7dc:	910003fd 	mov	x29, sp
 7e0:	940001c8 	bl	f00 <call_weak_fn>
 7e4:	a8c17bfd 	ldp	x29, x30, [sp], #16
 7e8:	d65f03c0 	ret

Disassembly of section .plt:

00000000000007f0 <.plt>:
 7f0:	a9bf7bf0 	stp	x16, x30, [sp, #-16]!
 7f4:	d0000090 	adrp	x16, 12000 <__FRAME_END__+0xfe90>
 7f8:	f947b211 	ldr	x17, [x16, #3936]
 7fc:	913d8210 	add	x16, x16, #0xf60
 800:	d61f0220 	br	x17
 804:	d503201f 	nop
 808:	d503201f 	nop
 80c:	d503201f 	nop

0000000000000810 <memcpy@plt>:
 810:	d0000090 	adrp	x16, 12000 <__FRAME_END__+0xfe90>
 814:	f947b611 	ldr	x17, [x16, #3944]
 818:	913da210 	add	x16, x16, #0xf68
 81c:	d61f0220 	br	x17

0000000000000820 <__cxa_finalize@plt>:
 820:	d0000090 	adrp	x16, 12000 <__FRAME_END__+0xfe90>
 824:	f947ba11 	ldr	x17, [x16, #3952]
 828:	913dc210 	add	x16, x16, #0xf70
 82c:	d61f0220 	br	x17

0000000000000830 <__libc_start_main@plt>:
 830:	d0000090 	adrp	x16, 12000 <__FRAME_END__+0xfe90>
 834:	f947be11 	ldr	x17, [x16, #3960]
 838:	913de210 	add	x16, x16, #0xf78
 83c:	d61f0220 	br	x17

0000000000000840 <__printf_chk@plt>:
 840:	d0000090 	adrp	x16, 12000 <__FRAME_END__+0xfe90>
 844:	f947c211 	ldr	x17, [x16, #3968]
 848:	913e0210 	add	x16, x16, #0xf80
 84c:	d61f0220 	br	x17

0000000000000850 <memset@plt>:
 850:	d0000090 	adrp	x16, 12000 <__FRAME_END__+0xfe90>
 854:	f947c611 	ldr	x17, [x16, #3976]
 858:	913e2210 	add	x16, x16, #0xf88
 85c:	d61f0220 	br	x17

0000000000000860 <gettimeofday@plt>:
 860:	d0000090 	adrp	x16, 12000 <__FRAME_END__+0xfe90>
 864:	f947ca11 	ldr	x17, [x16, #3984]
 868:	913e4210 	add	x16, x16, #0xf90
 86c:	d61f0220 	br	x17

0000000000000870 <__stack_chk_fail@plt>:
 870:	d0000090 	adrp	x16, 12000 <__FRAME_END__+0xfe90>
 874:	f947ce11 	ldr	x17, [x16, #3992]
 878:	913e6210 	add	x16, x16, #0xf98
 87c:	d61f0220 	br	x17

0000000000000880 <__gmon_start__@plt>:
 880:	d0000090 	adrp	x16, 12000 <__FRAME_END__+0xfe90>
 884:	f947d211 	ldr	x17, [x16, #4000]
 888:	913e8210 	add	x16, x16, #0xfa0
 88c:	d61f0220 	br	x17

0000000000000890 <abort@plt>:
 890:	d0000090 	adrp	x16, 12000 <__FRAME_END__+0xfe90>
 894:	f947d611 	ldr	x17, [x16, #4008]
 898:	913ea210 	add	x16, x16, #0xfa8
 89c:	d61f0220 	br	x17

00000000000008a0 <puts@plt>:
 8a0:	d0000090 	adrp	x16, 12000 <__FRAME_END__+0xfe90>
 8a4:	f947da11 	ldr	x17, [x16, #4016]
 8a8:	913ec210 	add	x16, x16, #0xfb0
 8ac:	d61f0220 	br	x17

Disassembly of section .text:

00000000000008b0 <main>:
#ifdef _OPENMP
extern int omp_get_num_threads();
#endif
int
main()
    {
     8b0:	a9a17bfd 	stp	x29, x30, [sp, #-496]!
}

__fortify_function int
printf (const char *__restrict __fmt, ...)
{
  return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
     8b4:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     8b8:	910003fd 	mov	x29, sp
     8bc:	a90153f3 	stp	x19, x20, [sp, #16]
     8c0:	91278013 	add	x19, x0, #0x9e0
     8c4:	d0000080 	adrp	x0, 12000 <__FRAME_END__+0xfe90>
     8c8:	a9025bf5 	stp	x21, x22, [sp, #32]
     8cc:	f947f001 	ldr	x1, [x0, #4064]
     8d0:	aa1303e0 	mov	x0, x19
     8d4:	a90363f7 	stp	x23, x24, [sp, #48]
     8d8:	b004c558 	adrp	x24, 98a9000 <b+0x4c4ab80>
     8dc:	f9400022 	ldr	x2, [x1]
     8e0:	f900f7e2 	str	x2, [sp, #488]
     8e4:	d2800002 	mov	x2, #0x0                   	// #0
     8e8:	a9046bf9 	stp	x25, x26, [sp, #64]
     8ec:	91220316 	add	x22, x24, #0x880
     8f0:	d296801a 	mov	x26, #0xb400                	// #46080
     8f4:	a90573fb 	stp	x27, x28, [sp, #80]
     8f8:	f2a0989a 	movk	x26, #0x4c4, lsl #16
     8fc:	8b1a02da 	add	x26, x22, x26
     900:	6d0627e8 	stp	d8, d9, [sp, #96]
     904:	fd003bea 	str	d10, [sp, #112]
     908:	97ffffe6 	bl	8a0 <puts@plt>
     90c:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     910:	91288000 	add	x0, x0, #0xa20
     914:	97ffffe3 	bl	8a0 <puts@plt>
     918:	aa1303e0 	mov	x0, x19
     91c:	97ffffe1 	bl	8a0 <puts@plt>
     920:	b0000001 	adrp	x1, 1000 <checktick+0x28>
     924:	91292021 	add	x1, x1, #0xa48
     928:	52800102 	mov	w2, #0x8                   	// #8
     92c:	52800020 	mov	w0, #0x1                   	// #1
     930:	97ffffc4 	bl	840 <__printf_chk@plt>
     934:	aa1303e0 	mov	x0, x19
     938:	97ffffda 	bl	8a0 <puts@plt>
     93c:	d292d002 	mov	x2, #0x9680                	// #38528
     940:	52800003 	mov	w3, #0x0                   	// #0
     944:	f2a01302 	movk	x2, #0x98, lsl #16
     948:	b0000001 	adrp	x1, 1000 <checktick+0x28>
     94c:	52800020 	mov	w0, #0x1                   	// #1
     950:	9129e021 	add	x1, x1, #0xa78
     954:	97ffffbb 	bl	840 <__printf_chk@plt>
     958:	d2c25a01 	mov	x1, #0x12d000000000        	// #20684562497536
     95c:	d2c25a00 	mov	x0, #0x12d000000000        	// #20684562497536
     960:	f2e7f661 	movk	x1, #0x3fb3, lsl #48
     964:	f2e80a60 	movk	x0, #0x4053, lsl #48
     968:	9e670021 	fmov	d1, x1
     96c:	9e670000 	fmov	d0, x0
     970:	b0000001 	adrp	x1, 1000 <checktick+0x28>
     974:	52800020 	mov	w0, #0x1                   	// #1
     978:	912ac021 	add	x1, x1, #0xab0
     97c:	97ffffb1 	bl	840 <__printf_chk@plt>
     980:	d2d38701 	mov	x1, #0x9c3800000000        	// #171764332101632
     984:	d2d38700 	mov	x0, #0x9c3800000000        	// #171764332101632
     988:	f2e7f981 	movk	x1, #0x3fcc, lsl #48
     98c:	f2e80d80 	movk	x0, #0x406c, lsl #48
     990:	9e670021 	fmov	d1, x1
     994:	9e670000 	fmov	d0, x0
     998:	b0000001 	adrp	x1, 1000 <checktick+0x28>
     99c:	52800020 	mov	w0, #0x1                   	// #1
     9a0:	912b8021 	add	x1, x1, #0xae0
     9a4:	97ffffa7 	bl	840 <__printf_chk@plt>
     9a8:	b0000001 	adrp	x1, 1000 <checktick+0x28>
     9ac:	912c4021 	add	x1, x1, #0xb10
     9b0:	52800142 	mov	w2, #0xa                   	// #10
     9b4:	52800020 	mov	w0, #0x1                   	// #1
     9b8:	97ffffa2 	bl	840 <__printf_chk@plt>
     9bc:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     9c0:	912ce000 	add	x0, x0, #0xb38
     9c4:	97ffffb7 	bl	8a0 <puts@plt>
     9c8:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     9cc:	912e0000 	add	x0, x0, #0xb80
     9d0:	97ffffb4 	bl	8a0 <puts@plt>
#endif

    /* Get initial value for system clock. */
#pragma omp parallel for
    for (j=0; j<STREAM_ARRAY_SIZE; j++) {
	    a[j] = 1.0;
     9d4:	6f03f600 	fmov	v0.2d, #1.000000000000000000e+00
     9d8:	aa1603e0 	mov	x0, x22
     9dc:	d503201f 	nop
     9e0:	3c810400 	str	q0, [x0], #16
    for (j=0; j<STREAM_ARRAY_SIZE; j++) {
     9e4:	eb1a001f 	cmp	x0, x26
     9e8:	54ffffc1 	b.ne	9e0 <main+0x130>  // b.any
     9ec:	d00262f9 	adrp	x25, 4c5e000 <c+0x4c4af80>
     9f0:	d2968001 	mov	x1, #0xb400                	// #46080
     9f4:	91120320 	add	x0, x25, #0x480
     9f8:	f2a09881 	movk	x1, #0x4c4, lsl #16
	    b[j] = 2.0;
     9fc:	6f00f400 	fmov	v0.2d, #2.000000000000000000e+00
     a00:	8b010001 	add	x1, x0, x1
     a04:	d503201f 	nop
     a08:	3c810400 	str	q0, [x0], #16
    for (j=0; j<STREAM_ARRAY_SIZE; j++) {
     a0c:	eb00003f 	cmp	x1, x0
     a10:	54ffffc1 	b.ne	a08 <main+0x158>  // b.any
     a14:	d2968002 	mov	x2, #0xb400                	// #46080
     a18:	52800001 	mov	w1, #0x0                   	// #0
     a1c:	f2a09882 	movk	x2, #0x4c4, lsl #16
     a20:	f000009b 	adrp	x27, 13000 <__data_start>
     a24:	91020360 	add	x0, x27, #0x80
     a28:	97ffff8a 	bl	850 <memset@plt>
     a2c:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     a30:	91278000 	add	x0, x0, #0x9e0
     a34:	97ffff9b 	bl	8a0 <puts@plt>
	    c[j] = 0.0;
	}

    printf(HLINE);

    if  ( (quantum = checktick()) >= 1) 
     a38:	94000168 	bl	fd8 <checktick>
     a3c:	2a0003fc 	mov	w28, w0
     a40:	7100001f 	cmp	w0, #0x0
     a44:	5400236d 	b.le	eb0 <main+0x600>
     a48:	2a0003e2 	mov	w2, w0
     a4c:	b0000001 	adrp	x1, 1000 <checktick+0x28>
     a50:	52800020 	mov	w0, #0x1                   	// #1
     a54:	912ee021 	add	x1, x1, #0xbb8
     a58:	97ffff7a 	bl	840 <__printf_chk@plt>
{
        struct timeval tp;
        struct timezone tzp;
        int i;

        i = gettimeofday(&tp,&tzp);
     a5c:	910243f4 	add	x20, sp, #0x90
     a60:	910263f3 	add	x19, sp, #0x98
     a64:	aa1403e1 	mov	x1, x20
     a68:	aa1303e0 	mov	x0, x19
     a6c:	97ffff7d 	bl	860 <gettimeofday@plt>
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     a70:	6d49abe9 	ldp	d9, d10, [sp, #152]
     a74:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     a78:	fd471800 	ldr	d0, [x0, #3632]
     a7c:	5e61d929 	scvtf	d9, d9
     a80:	5e61d94a 	scvtf	d10, d10
     a84:	1f40254a 	fmadd	d10, d10, d0, d9
		a[j] = 2.0E0 * a[j];
     a88:	3dc002c0 	ldr	q0, [x22]
     a8c:	4e60d400 	fadd	v0.2d, v0.2d, v0.2d
     a90:	3c8106c0 	str	q0, [x22], #16
    for (j = 0; j < STREAM_ARRAY_SIZE; j++)
     a94:	eb1a02df 	cmp	x22, x26
     a98:	54ffff81 	b.ne	a88 <main+0x1d8>  // b.any
        i = gettimeofday(&tp,&tzp);
     a9c:	aa1403e1 	mov	x1, x20
     aa0:	aa1303e0 	mov	x0, x19
     aa4:	97ffff6f 	bl	860 <gettimeofday@plt>
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     aa8:	9102a3f6 	add	x22, sp, #0xa8
     aac:	6d4987e9 	ldp	d9, d1, [sp, #152]
     ab0:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     ab4:	b0000002 	adrp	x2, 1000 <checktick+0x28>
     ab8:	91278045 	add	x5, x2, #0x9e0
     abc:	fd471808 	ldr	d8, [x0, #3632]
    t = 1.0E6 * (mysecond() - t);
     ac0:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     ac4:	5e61d821 	scvtf	d1, d1
     ac8:	5e61d929 	scvtf	d9, d9
    t = 1.0E6 * (mysecond() - t);
     acc:	f2e825c0 	movk	x0, #0x412e, lsl #48
     ad0:	9e670000 	fmov	d0, x0
     ad4:	b0000001 	adrp	x1, 1000 <checktick+0x28>
     ad8:	52800020 	mov	w0, #0x1                   	// #1
     adc:	91310021 	add	x1, x1, #0xc40
     ae0:	f90047e5 	str	x5, [sp, #136]
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     ae4:	1f482429 	fmadd	d9, d1, d8, d9
     ae8:	d296801a 	mov	x26, #0xb400                	// #46080
     aec:	9102037b 	add	x27, x27, #0x80
     af0:	91220318 	add	x24, x24, #0x880
	    b[j] = scalar*c[j];
     af4:	91120339 	add	x25, x25, #0x480
     af8:	910142d7 	add	x23, x22, #0x50
     afc:	aa1603f5 	mov	x21, x22
     b00:	f2a0989a 	movk	x26, #0x4c4, lsl #16
    t = 1.0E6 * (mysecond() - t);
     b04:	1e6a3929 	fsub	d9, d9, d10
     b08:	1e600929 	fmul	d9, d9, d0
     b0c:	1e780122 	fcvtzs	w2, d9
     b10:	97ffff4c 	bl	840 <__printf_chk@plt>
    printf("   (= %d clock ticks)\n", (int) (t/quantum) );
     b14:	1e620380 	scvtf	d0, w28
     b18:	b0000001 	adrp	x1, 1000 <checktick+0x28>
     b1c:	91320021 	add	x1, x1, #0xc80
     b20:	52800020 	mov	w0, #0x1                   	// #1
     b24:	1e601929 	fdiv	d9, d9, d0
     b28:	1e780122 	fcvtzs	w2, d9
     b2c:	97ffff45 	bl	840 <__printf_chk@plt>
     b30:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     b34:	91326000 	add	x0, x0, #0xc98
     b38:	97ffff5a 	bl	8a0 <puts@plt>
     b3c:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     b40:	91334000 	add	x0, x0, #0xcd0
     b44:	97ffff57 	bl	8a0 <puts@plt>
     b48:	f94047e5 	ldr	x5, [sp, #136]
     b4c:	aa0503fc 	mov	x28, x5
     b50:	aa0503e0 	mov	x0, x5
     b54:	97ffff53 	bl	8a0 <puts@plt>
     b58:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     b5c:	91342000 	add	x0, x0, #0xd08
     b60:	97ffff50 	bl	8a0 <puts@plt>
     b64:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     b68:	9134e000 	add	x0, x0, #0xd38
     b6c:	97ffff4d 	bl	8a0 <puts@plt>
     b70:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     b74:	9135a000 	add	x0, x0, #0xd68
     b78:	97ffff4a 	bl	8a0 <puts@plt>
     b7c:	aa1c03e0 	mov	x0, x28
     b80:	97ffff48 	bl	8a0 <puts@plt>
        i = gettimeofday(&tp,&tzp);
     b84:	aa1403e1 	mov	x1, x20
     b88:	aa1303e0 	mov	x0, x19
     b8c:	97ffff35 	bl	860 <gettimeofday@plt>
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     b90:	6d49a7e0 	ldp	d0, d9, [sp, #152]
     b94:	aa1a03e2 	mov	x2, x26
     b98:	aa1803e1 	mov	x1, x24
     b9c:	aa1b03e0 	mov	x0, x27
     ba0:	5e61d800 	scvtf	d0, d0
     ba4:	5e61d929 	scvtf	d9, d9
     ba8:	1f480129 	fmadd	d9, d9, d8, d0
	for (j=0; j<STREAM_ARRAY_SIZE; j++)
     bac:	97ffff19 	bl	810 <memcpy@plt>
        i = gettimeofday(&tp,&tzp);
     bb0:	aa1403e1 	mov	x1, x20
     bb4:	aa1303e0 	mov	x0, x19
     bb8:	97ffff2a 	bl	860 <gettimeofday@plt>
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     bbc:	6d4987e0 	ldp	d0, d1, [sp, #152]
        i = gettimeofday(&tp,&tzp);
     bc0:	aa1403e1 	mov	x1, x20
     bc4:	aa1303e0 	mov	x0, x19
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     bc8:	5e61d821 	scvtf	d1, d1
     bcc:	5e61d800 	scvtf	d0, d0
     bd0:	1f480020 	fmadd	d0, d1, d8, d0
	times[0][k] = mysecond() - times[0][k];
     bd4:	1e693800 	fsub	d0, d0, d9
     bd8:	fd0002a0 	str	d0, [x21]
        i = gettimeofday(&tp,&tzp);
     bdc:	97ffff21 	bl	860 <gettimeofday@plt>
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     be0:	6d49a7e0 	ldp	d0, d9, [sp, #152]
     be4:	d2800000 	mov	x0, #0x0                   	// #0
	    b[j] = scalar*c[j];
     be8:	6f00f501 	fmov	v1.2d, #3.000000000000000000e+00
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     bec:	5e61d800 	scvtf	d0, d0
     bf0:	5e61d929 	scvtf	d9, d9
     bf4:	1f480129 	fmadd	d9, d9, d8, d0
	    b[j] = scalar*c[j];
     bf8:	3cfb6800 	ldr	q0, [x0, x27]
     bfc:	6e61dc00 	fmul	v0.2d, v0.2d, v1.2d
     c00:	3cb96800 	str	q0, [x0, x25]
	for (j=0; j<STREAM_ARRAY_SIZE; j++)
     c04:	91004000 	add	x0, x0, #0x10
     c08:	eb1a001f 	cmp	x0, x26
     c0c:	54ffff61 	b.ne	bf8 <main+0x348>  // b.any
        i = gettimeofday(&tp,&tzp);
     c10:	aa1403e1 	mov	x1, x20
     c14:	aa1303e0 	mov	x0, x19
     c18:	97ffff12 	bl	860 <gettimeofday@plt>
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     c1c:	6d4987e0 	ldp	d0, d1, [sp, #152]
        i = gettimeofday(&tp,&tzp);
     c20:	aa1403e1 	mov	x1, x20
     c24:	aa1303e0 	mov	x0, x19
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     c28:	5e61d821 	scvtf	d1, d1
     c2c:	5e61d800 	scvtf	d0, d0
     c30:	1f480020 	fmadd	d0, d1, d8, d0
	times[1][k] = mysecond() - times[1][k];
     c34:	1e693800 	fsub	d0, d0, d9
     c38:	fd002aa0 	str	d0, [x21, #80]
        i = gettimeofday(&tp,&tzp);
     c3c:	97ffff09 	bl	860 <gettimeofday@plt>
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     c40:	6d49a7e0 	ldp	d0, d9, [sp, #152]
     c44:	d2800000 	mov	x0, #0x0                   	// #0
     c48:	5e61d800 	scvtf	d0, d0
     c4c:	5e61d929 	scvtf	d9, d9
     c50:	1f480129 	fmadd	d9, d9, d8, d0
	for (j=0; j<STREAM_ARRAY_SIZE; j++)
     c54:	d503201f 	nop
	    c[j] = a[j]+b[j];
     c58:	3cf86800 	ldr	q0, [x0, x24]
     c5c:	3cf96801 	ldr	q1, [x0, x25]
     c60:	4e61d400 	fadd	v0.2d, v0.2d, v1.2d
     c64:	3cbb6800 	str	q0, [x0, x27]
	for (j=0; j<STREAM_ARRAY_SIZE; j++)
     c68:	91004000 	add	x0, x0, #0x10
     c6c:	eb1a001f 	cmp	x0, x26
     c70:	54ffff41 	b.ne	c58 <main+0x3a8>  // b.any
        i = gettimeofday(&tp,&tzp);
     c74:	aa1403e1 	mov	x1, x20
     c78:	aa1303e0 	mov	x0, x19
     c7c:	97fffef9 	bl	860 <gettimeofday@plt>
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     c80:	6d4987e0 	ldp	d0, d1, [sp, #152]
        i = gettimeofday(&tp,&tzp);
     c84:	aa1403e1 	mov	x1, x20
     c88:	aa1303e0 	mov	x0, x19
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     c8c:	5e61d821 	scvtf	d1, d1
     c90:	5e61d800 	scvtf	d0, d0
     c94:	1f480020 	fmadd	d0, d1, d8, d0
	times[2][k] = mysecond() - times[2][k];
     c98:	1e693800 	fsub	d0, d0, d9
     c9c:	fd0052a0 	str	d0, [x21, #160]
        i = gettimeofday(&tp,&tzp);
     ca0:	97fffef0 	bl	860 <gettimeofday@plt>
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     ca4:	6d49a7e0 	ldp	d0, d9, [sp, #152]
     ca8:	d2800000 	mov	x0, #0x0                   	// #0
	    a[j] = b[j]+scalar*c[j];
     cac:	6f00f502 	fmov	v2.2d, #3.000000000000000000e+00
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     cb0:	5e61d800 	scvtf	d0, d0
     cb4:	5e61d929 	scvtf	d9, d9
     cb8:	1f480129 	fmadd	d9, d9, d8, d0
	for (j=0; j<STREAM_ARRAY_SIZE; j++)
     cbc:	d503201f 	nop
	    a[j] = b[j]+scalar*c[j];
     cc0:	3cfb6801 	ldr	q1, [x0, x27]
     cc4:	3cf96800 	ldr	q0, [x0, x25]
     cc8:	4e62cc20 	fmla	v0.2d, v1.2d, v2.2d
     ccc:	3cb86800 	str	q0, [x0, x24]
	for (j=0; j<STREAM_ARRAY_SIZE; j++)
     cd0:	91004000 	add	x0, x0, #0x10
     cd4:	eb1a001f 	cmp	x0, x26
     cd8:	54ffff41 	b.ne	cc0 <main+0x410>  // b.any
        i = gettimeofday(&tp,&tzp);
     cdc:	aa1403e1 	mov	x1, x20
     ce0:	aa1303e0 	mov	x0, x19
     ce4:	97fffedf 	bl	860 <gettimeofday@plt>
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     ce8:	910022b5 	add	x21, x21, #0x8
     cec:	6d4987e0 	ldp	d0, d1, [sp, #152]
     cf0:	5e61d800 	scvtf	d0, d0
     cf4:	5e61d821 	scvtf	d1, d1
     cf8:	1f480020 	fmadd	d0, d1, d8, d0
	times[3][k] = mysecond() - times[3][k];
     cfc:	1e693800 	fsub	d0, d0, d9
     d00:	fd0076a0 	str	d0, [x21, #232]
    for (k=0; k<NTIMES; k++)
     d04:	eb1502ff 	cmp	x23, x21
     d08:	54fff3e1 	b.ne	b84 <main+0x2d4>  // b.any
     d0c:	f0000085 	adrp	x5, 13000 <__data_start>
     d10:	f0000084 	adrp	x4, 13000 <__data_start>
     d14:	910100a1 	add	x1, x5, #0x40
     d18:	91004082 	add	x2, x4, #0x10
     d1c:	fd4020b5 	ldr	d21, [x5, #64]
     d20:	910122c0 	add	x0, x22, #0x48
     d24:	fd400891 	ldr	d17, [x4, #16]
     d28:	6d40cc34 	ldp	d20, d19, [x1, #8]
     d2c:	6d40a050 	ldp	d16, d8, [x2, #8]
     d30:	6d419032 	ldp	d18, d4, [x1, #24]
     d34:	6d429c29 	ldp	d9, d7, [x1, #40]
     d38:	fd400c46 	ldr	d6, [x2, #24]
     d3c:	fd401c25 	ldr	d5, [x1, #56]
	    avgtime[j] = avgtime[j] + times[j][k];
     d40:	fd4006c3 	ldr	d3, [x22, #8]
     d44:	910022d6 	add	x22, x22, #0x8
     d48:	fd402ac2 	ldr	d2, [x22, #80]
     d4c:	fd4052c1 	ldr	d1, [x22, #160]
     d50:	1e712070 	fcmpe	d3, d17
     d54:	fd407ac0 	ldr	d0, [x22, #240]
     d58:	1e632ab5 	fadd	d21, d21, d3
     d5c:	1e622a94 	fadd	d20, d20, d2
     d60:	1e612a73 	fadd	d19, d19, d1
     d64:	1e602a52 	fadd	d18, d18, d0
     d68:	1e63ce31 	fcsel	d17, d17, d3, gt
     d6c:	1e642070 	fcmpe	d3, d4
     d70:	1e634c84 	fcsel	d4, d4, d3, mi  // mi = first
     d74:	1e702050 	fcmpe	d2, d16
     d78:	1e62ce10 	fcsel	d16, d16, d2, gt
     d7c:	1e692050 	fcmpe	d2, d9
     d80:	1e624d29 	fcsel	d9, d9, d2, mi  // mi = first
     d84:	1e612110 	fcmpe	d8, d1
     d88:	1e614d08 	fcsel	d8, d8, d1, mi  // mi = first
     d8c:	1e6120f0 	fcmpe	d7, d1
     d90:	1e61cce7 	fcsel	d7, d7, d1, gt
     d94:	1e6020d0 	fcmpe	d6, d0
     d98:	1e604cc6 	fcsel	d6, d6, d0, mi  // mi = first
     d9c:	1e652010 	fcmpe	d0, d5
     da0:	1e604ca5 	fcsel	d5, d5, d0, mi  // mi = first
    for (k=1; k<NTIMES; k++) /* note -- skip first iteration */
     da4:	eb0002df 	cmp	x22, x0
     da8:	54fffcc1 	b.ne	d40 <main+0x490>  // b.any
     dac:	91004083 	add	x3, x4, #0x10
     db0:	910100a1 	add	x1, x5, #0x40
     db4:	fd000891 	str	d17, [x4, #16]
	       1.0E-06 * bytes[j]/mintime[j],
     db8:	b0000004 	adrp	x4, 1000 <checktick+0x28>
     dbc:	91008022 	add	x2, x1, #0x20
     dc0:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     dc4:	6d00a070 	stp	d16, d8, [x3, #8]
     dc8:	b000001b 	adrp	x27, 1000 <checktick+0x28>
     dcc:	fd471888 	ldr	d8, [x4, #3632]
     dd0:	6d029c29 	stp	d9, d7, [x1, #40]
		avgtime[j] = avgtime[j]/(double)(NTIMES-1);
     dd4:	1e645009 	fmov	d9, #9.000000000000000000e+00
	       1.0E-06 * bytes[j]/mintime[j],
     dd8:	aa0303fa 	mov	x26, x3
		printf("%s%12.1f  %11.6f  %11.6f  %11.6f\n", label[j],
     ddc:	aa0203f7 	mov	x23, x2
     de0:	aa0103f4 	mov	x20, x1
     de4:	91362000 	add	x0, x0, #0xd88
	       1.0E-06 * bytes[j]/mintime[j],
     de8:	913c037b 	add	x27, x27, #0xf00
    for (j=0; j<4; j++) {
     dec:	d2800013 	mov	x19, #0x0                   	// #0
     df0:	d0000096 	adrp	x22, 12000 <__FRAME_END__+0xfe90>
     df4:	b0000015 	adrp	x21, 1000 <checktick+0x28>
     df8:	fd0020b5 	str	d21, [x5, #64]
     dfc:	6d00cc34 	stp	d20, d19, [x1, #8]
     e00:	6d019032 	stp	d18, d4, [x1, #24]
     e04:	fd000c66 	str	d6, [x3, #24]
     e08:	fd001c25 	str	d5, [x1, #56]
     e0c:	97fffea5 	bl	8a0 <puts@plt>
	       1.0E-06 * bytes[j]/mintime[j],
     e10:	fc737b60 	ldr	d0, [x27, x19, lsl #3]
		printf("%s%12.1f  %11.6f  %11.6f  %11.6f\n", label[j],
     e14:	9134c2c2 	add	x2, x22, #0xd30
	       1.0E-06 * bytes[j]/mintime[j],
     e18:	fc737b42 	ldr	d2, [x26, x19, lsl #3]
     e1c:	913722a1 	add	x1, x21, #0xdc8
		avgtime[j] = avgtime[j]/(double)(NTIMES-1);
     e20:	fd400281 	ldr	d1, [x20]
     e24:	52800020 	mov	w0, #0x1                   	// #1
	       1.0E-06 * bytes[j]/mintime[j],
     e28:	1e680800 	fmul	d0, d0, d8
     e2c:	fc737ae3 	ldr	d3, [x23, x19, lsl #3]
     e30:	f8737842 	ldr	x2, [x2, x19, lsl #3]
    for (j=0; j<4; j++) {
     e34:	91000673 	add	x19, x19, #0x1
		avgtime[j] = avgtime[j]/(double)(NTIMES-1);
     e38:	1e691821 	fdiv	d1, d1, d9
     e3c:	1e621800 	fdiv	d0, d0, d2
     e40:	fc008681 	str	d1, [x20], #8
     e44:	97fffe7f 	bl	840 <__printf_chk@plt>
    for (j=0; j<4; j++) {
     e48:	f100127f 	cmp	x19, #0x4
     e4c:	54fffe21 	b.ne	e10 <main+0x560>  // b.any
     e50:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     e54:	91278018 	add	x24, x0, #0x9e0
     e58:	aa1803e0 	mov	x0, x24
     e5c:	97fffe91 	bl	8a0 <puts@plt>
    checkSTREAMresults();
     e60:	94000106 	bl	1278 <checkSTREAMresults>
     e64:	aa1803e0 	mov	x0, x24
     e68:	97fffe8e 	bl	8a0 <puts@plt>
}
     e6c:	d0000080 	adrp	x0, 12000 <__FRAME_END__+0xfe90>
     e70:	f947f019 	ldr	x25, [x0, #4064]
     e74:	f940f7e0 	ldr	x0, [sp, #488]
     e78:	f9400321 	ldr	x1, [x25]
     e7c:	eb010000 	subs	x0, x0, x1
     e80:	d2800001 	mov	x1, #0x0                   	// #0
     e84:	54000201 	b.ne	ec4 <main+0x614>  // b.any
     e88:	52800000 	mov	w0, #0x0                   	// #0
     e8c:	fd403bea 	ldr	d10, [sp, #112]
     e90:	a94153f3 	ldp	x19, x20, [sp, #16]
     e94:	a9425bf5 	ldp	x21, x22, [sp, #32]
     e98:	a94363f7 	ldp	x23, x24, [sp, #48]
     e9c:	a9446bf9 	ldp	x25, x26, [sp, #64]
     ea0:	a94573fb 	ldp	x27, x28, [sp, #80]
     ea4:	6d4627e8 	ldp	d8, d9, [sp, #96]
     ea8:	a8df7bfd 	ldp	x29, x30, [sp], #496
     eac:	d65f03c0 	ret
	quantum = 1;
     eb0:	5280003c 	mov	w28, #0x1                   	// #1
     eb4:	b0000000 	adrp	x0, 1000 <checktick+0x28>
     eb8:	91300000 	add	x0, x0, #0xc00
     ebc:	97fffe79 	bl	8a0 <puts@plt>
     ec0:	17fffee7 	b	a5c <main+0x1ac>
}
     ec4:	97fffe6b 	bl	870 <__stack_chk_fail@plt>

0000000000000ec8 <_start>:
     ec8:	d280001d 	mov	x29, #0x0                   	// #0
     ecc:	d280001e 	mov	x30, #0x0                   	// #0
     ed0:	aa0003e5 	mov	x5, x0
     ed4:	f94003e1 	ldr	x1, [sp]
     ed8:	910023e2 	add	x2, sp, #0x8
     edc:	910003e6 	mov	x6, sp
     ee0:	d0000080 	adrp	x0, 12000 <__FRAME_END__+0xfe90>
     ee4:	f947f800 	ldr	x0, [x0, #4080]
     ee8:	d0000083 	adrp	x3, 12000 <__FRAME_END__+0xfe90>
     eec:	f947f463 	ldr	x3, [x3, #4072]
     ef0:	d0000084 	adrp	x4, 12000 <__FRAME_END__+0xfe90>
     ef4:	f947e084 	ldr	x4, [x4, #4032]
     ef8:	97fffe4e 	bl	830 <__libc_start_main@plt>
     efc:	97fffe65 	bl	890 <abort@plt>

0000000000000f00 <call_weak_fn>:
     f00:	d0000080 	adrp	x0, 12000 <__FRAME_END__+0xfe90>
     f04:	f947ec00 	ldr	x0, [x0, #4056]
     f08:	b4000040 	cbz	x0, f10 <call_weak_fn+0x10>
     f0c:	17fffe5d 	b	880 <__gmon_start__@plt>
     f10:	d65f03c0 	ret
     f14:	d503201f 	nop

0000000000000f18 <deregister_tm_clones>:
     f18:	f0000080 	adrp	x0, 13000 <__data_start>
     f1c:	9100c000 	add	x0, x0, #0x30
     f20:	f0000081 	adrp	x1, 13000 <__data_start>
     f24:	9100c021 	add	x1, x1, #0x30
     f28:	eb00003f 	cmp	x1, x0
     f2c:	540000c0 	b.eq	f44 <deregister_tm_clones+0x2c>  // b.none
     f30:	d0000081 	adrp	x1, 12000 <__FRAME_END__+0xfe90>
     f34:	f947e421 	ldr	x1, [x1, #4040]
     f38:	b4000061 	cbz	x1, f44 <deregister_tm_clones+0x2c>
     f3c:	aa0103f0 	mov	x16, x1
     f40:	d61f0200 	br	x16
     f44:	d65f03c0 	ret

0000000000000f48 <register_tm_clones>:
     f48:	f0000080 	adrp	x0, 13000 <__data_start>
     f4c:	9100c000 	add	x0, x0, #0x30
     f50:	f0000081 	adrp	x1, 13000 <__data_start>
     f54:	9100c021 	add	x1, x1, #0x30
     f58:	cb000021 	sub	x1, x1, x0
     f5c:	d37ffc22 	lsr	x2, x1, #63
     f60:	8b810c41 	add	x1, x2, x1, asr #3
     f64:	eb8107ff 	cmp	xzr, x1, asr #1
     f68:	9341fc21 	asr	x1, x1, #1
     f6c:	540000c0 	b.eq	f84 <register_tm_clones+0x3c>  // b.none
     f70:	d0000082 	adrp	x2, 12000 <__FRAME_END__+0xfe90>
     f74:	f947fc42 	ldr	x2, [x2, #4088]
     f78:	b4000062 	cbz	x2, f84 <register_tm_clones+0x3c>
     f7c:	aa0203f0 	mov	x16, x2
     f80:	d61f0200 	br	x16
     f84:	d65f03c0 	ret

0000000000000f88 <__do_global_dtors_aux>:
     f88:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     f8c:	910003fd 	mov	x29, sp
     f90:	f9000bf3 	str	x19, [sp, #16]
     f94:	f0000093 	adrp	x19, 13000 <__data_start>
     f98:	3940c260 	ldrb	w0, [x19, #48]
     f9c:	35000140 	cbnz	w0, fc4 <__do_global_dtors_aux+0x3c>
     fa0:	d0000080 	adrp	x0, 12000 <__FRAME_END__+0xfe90>
     fa4:	f947e800 	ldr	x0, [x0, #4048]
     fa8:	b4000080 	cbz	x0, fb8 <__do_global_dtors_aux+0x30>
     fac:	f0000080 	adrp	x0, 13000 <__data_start>
     fb0:	f9400400 	ldr	x0, [x0, #8]
     fb4:	97fffe1b 	bl	820 <__cxa_finalize@plt>
     fb8:	97ffffd8 	bl	f18 <deregister_tm_clones>
     fbc:	52800020 	mov	w0, #0x1                   	// #1
     fc0:	3900c260 	strb	w0, [x19, #48]
     fc4:	f9400bf3 	ldr	x19, [sp, #16]
     fc8:	a8c27bfd 	ldp	x29, x30, [sp], #32
     fcc:	d65f03c0 	ret

0000000000000fd0 <frame_dummy>:
     fd0:	17ffffde 	b	f48 <register_tm_clones>
     fd4:	d503201f 	nop

0000000000000fd8 <checktick>:
    {
     fd8:	a9ae7bfd 	stp	x29, x30, [sp, #-288]!
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
     fdc:	b0000001 	adrp	x1, 1000 <checktick+0x28>
    {
     fe0:	910003fd 	mov	x29, sp
     fe4:	a9025bf5 	stp	x21, x22, [sp, #32]
     fe8:	d0000096 	adrp	x22, 12000 <__FRAME_END__+0xfe90>
     fec:	9101c3f5 	add	x21, sp, #0x70
     ff0:	f947f2c0 	ldr	x0, [x22, #4064]
     ff4:	a90153f3 	stp	x19, x20, [sp, #16]
     ff8:	910163f4 	add	x20, sp, #0x58
     ffc:	910183f3 	add	x19, sp, #0x60
    1000:	6d0427e8 	stp	d8, d9, [sp, #64]
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
    1004:	fd471828 	ldr	d8, [x1, #3632]
    {
    1008:	f9400001 	ldr	x1, [x0]
    100c:	f9008fe1 	str	x1, [sp, #280]
    1010:	d2800001 	mov	x1, #0x0                   	// #0
    1014:	f9001bf7 	str	x23, [sp, #48]
    1018:	910282b7 	add	x23, x21, #0xa0
    101c:	d503201f 	nop
        i = gettimeofday(&tp,&tzp);
    1020:	aa1403e1 	mov	x1, x20
    1024:	aa1303e0 	mov	x0, x19
    1028:	97fffe0e 	bl	860 <gettimeofday@plt>
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
    102c:	6d4603e9 	ldp	d9, d0, [sp, #96]
    1030:	5e61d929 	scvtf	d9, d9
    1034:	5e61d800 	scvtf	d0, d0
    1038:	1f482409 	fmadd	d9, d0, d8, d9
	while( ((t2=mysecond()) - t1) < 1.0E-6 )
    103c:	d503201f 	nop
        i = gettimeofday(&tp,&tzp);
    1040:	aa1403e1 	mov	x1, x20
    1044:	aa1303e0 	mov	x0, x19
    1048:	97fffe06 	bl	860 <gettimeofday@plt>
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
    104c:	6d4607e0 	ldp	d0, d1, [sp, #96]
    1050:	5e61d821 	scvtf	d1, d1
    1054:	5e61d800 	scvtf	d0, d0
    1058:	1f480020 	fmadd	d0, d1, d8, d0
	while( ((t2=mysecond()) - t1) < 1.0E-6 )
    105c:	1e693801 	fsub	d1, d0, d9
    1060:	1e682030 	fcmpe	d1, d8
    1064:	54fffee4 	b.mi	1040 <checktick+0x68>  // b.first
	timesfound[i] = t1 = t2;
    1068:	fc0086a0 	str	d0, [x21], #8
    for (i = 0; i < M; i++) {
    106c:	eb1702bf 	cmp	x21, x23
    1070:	54fffd81 	b.ne	1020 <checktick+0x48>  // b.any
	Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
    1074:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
    1078:	3dc01fe0 	ldr	q0, [sp, #112]
    107c:	f2e825c0 	movk	x0, #0x412e, lsl #48
    1080:	3cc783e9 	ldur	q9, [sp, #120]
    1084:	9e670010 	fmov	d16, x0
    1088:	3dc023e8 	ldr	q8, [sp, #128]
    108c:	90000000 	adrp	x0, 1000 <checktick+0x28>
    1090:	3cc883e1 	ldur	q1, [sp, #136]
    1094:	6d4f93e2 	ldp	d2, d4, [sp, #248]
    1098:	3dc39803 	ldr	q3, [x0, #3680]
    109c:	4ee0d529 	fsub	v9.2d, v9.2d, v0.2d
    10a0:	fd407be0 	ldr	d0, [sp, #240]
    10a4:	4ee8d421 	fsub	v1.2d, v1.2d, v8.2d
    10a8:	3dc027f1 	ldr	q17, [sp, #144]
    10ac:	1e603840 	fsub	d0, d2, d0
    10b0:	1e623882 	fsub	d2, d4, d2
    10b4:	6e63dc28 	fmul	v8.2d, v1.2d, v3.2d
    10b8:	fd4087e1 	ldr	d1, [sp, #264]
    10bc:	3cc983e7 	ldur	q7, [sp, #152]
    10c0:	1e700800 	fmul	d0, d0, d16
    10c4:	3dc02be5 	ldr	q5, [sp, #160]
    10c8:	1e643821 	fsub	d1, d1, d4
    10cc:	3cca83e6 	ldur	q6, [sp, #168]
    10d0:	1e700842 	fmul	d2, d2, d16
    10d4:	6e63dd29 	fmul	v9.2d, v9.2d, v3.2d
    10d8:	1e780000 	fcvtzs	w0, d0
    10dc:	4ef1d4e7 	fsub	v7.2d, v7.2d, v17.2d
    10e0:	1e700820 	fmul	d0, d1, d16
    10e4:	4ee5d4c6 	fsub	v6.2d, v6.2d, v5.2d
    10e8:	4ee1b901 	fcvtzs	v1.2d, v8.2d
    10ec:	4ee1b929 	fcvtzs	v9.2d, v9.2d
    10f0:	3dc02ff2 	ldr	q18, [sp, #176]
    10f4:	1e780042 	fcvtzs	w2, d2
    10f8:	3ccb83e5 	ldur	q5, [sp, #184]
    10fc:	1e780001 	fcvtzs	w1, d0
    1100:	3dc033f1 	ldr	q17, [sp, #192]
    1104:	0ea12928 	xtn	v8.2s, v9.2d
    1108:	4ea12828 	xtn2	v8.4s, v1.2d
    110c:	3ccc83e4 	ldur	q4, [sp, #200]
	minDelta = MIN(minDelta, MAX(Delta,0));
    1110:	7100001f 	cmp	w0, #0x0
	Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
    1114:	6e63dce7 	fmul	v7.2d, v7.2d, v3.2d
	minDelta = MIN(minDelta, MAX(Delta,0));
    1118:	1a9fa000 	csel	w0, w0, wzr, ge  // ge = tcont
	Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
    111c:	6e63dcc6 	fmul	v6.2d, v6.2d, v3.2d
	minDelta = MIN(minDelta, MAX(Delta,0));
    1120:	7100005f 	cmp	w2, #0x0
	Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
    1124:	4ef2d4a5 	fsub	v5.2d, v5.2d, v18.2d
	minDelta = MIN(minDelta, MAX(Delta,0));
    1128:	1a9fa042 	csel	w2, w2, wzr, ge  // ge = tcont
	Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
    112c:	4ef1d484 	fsub	v4.2d, v4.2d, v17.2d
	minDelta = MIN(minDelta, MAX(Delta,0));
    1130:	6b02001f 	cmp	w0, w2
	Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
    1134:	3dc037f0 	ldr	q16, [sp, #208]
	minDelta = MIN(minDelta, MAX(Delta,0));
    1138:	1a82d000 	csel	w0, w0, w2, le
	Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
    113c:	3ccd83e2 	ldur	q2, [sp, #216]
	minDelta = MIN(minDelta, MAX(Delta,0));
    1140:	90000002 	adrp	x2, 1000 <checktick+0x28>
	Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
    1144:	3dc03be0 	ldr	q0, [sp, #224]
	minDelta = MIN(minDelta, MAX(Delta,0));
    1148:	7100003f 	cmp	w1, #0x0
	Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
    114c:	3cce83e1 	ldur	q1, [sp, #232]
	minDelta = MIN(minDelta, MAX(Delta,0));
    1150:	1a9fa021 	csel	w1, w1, wzr, ge  // ge = tcont
    1154:	4f000409 	movi	v9.4s, #0x0
	Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
    1158:	4ee1b8c6 	fcvtzs	v6.2d, v6.2d
    115c:	4ee1b8e7 	fcvtzs	v7.2d, v7.2d
    1160:	4ee0d421 	fsub	v1.2d, v1.2d, v0.2d
    1164:	6e63dca5 	fmul	v5.2d, v5.2d, v3.2d
    1168:	6e63dc84 	fmul	v4.2d, v4.2d, v3.2d
    116c:	4ef0d442 	fsub	v2.2d, v2.2d, v16.2d
    1170:	0ea128e0 	xtn	v0.2s, v7.2d
    1174:	4ea128c0 	xtn2	v0.4s, v6.2d
	minDelta = MIN(minDelta, MAX(Delta,0));
    1178:	4ea96508 	smax	v8.4s, v8.4s, v9.4s
    117c:	3dc39c46 	ldr	q6, [x2, #3696]
	Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
    1180:	6e63dc42 	fmul	v2.2d, v2.2d, v3.2d
    1184:	4ee1b8a5 	fcvtzs	v5.2d, v5.2d
    1188:	6e63dc23 	fmul	v3.2d, v1.2d, v3.2d
    118c:	4ee1b884 	fcvtzs	v4.2d, v4.2d
	minDelta = MIN(minDelta, MAX(Delta,0));
    1190:	4ea66d08 	smin	v8.4s, v8.4s, v6.4s
    1194:	4ea96400 	smax	v0.4s, v0.4s, v9.4s
	Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
    1198:	4ee1b841 	fcvtzs	v1.2d, v2.2d
    119c:	4ee1b863 	fcvtzs	v3.2d, v3.2d
    11a0:	0ea128a6 	xtn	v6.2s, v5.2d
    11a4:	4ea12886 	xtn2	v6.4s, v4.2d
    }
    11a8:	f947f2c3 	ldr	x3, [x22, #4064]
	minDelta = MIN(minDelta, MAX(Delta,0));
    11ac:	4ea86c02 	smin	v2.4s, v0.4s, v8.4s
    11b0:	4ea964c6 	smax	v6.4s, v6.4s, v9.4s
	Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
    11b4:	0ea12820 	xtn	v0.2s, v1.2d
    11b8:	4ea12860 	xtn2	v0.4s, v3.2d
	minDelta = MIN(minDelta, MAX(Delta,0));
    11bc:	4ea96400 	smax	v0.4s, v0.4s, v9.4s
    11c0:	4ea26cc6 	smin	v6.4s, v6.4s, v2.4s
    11c4:	4ea66c00 	smin	v0.4s, v0.4s, v6.4s
    11c8:	4eb1a800 	sminv	s0, v0.4s
    11cc:	0e043c02 	mov	w2, v0.s[0]
    11d0:	6b02003f 	cmp	w1, w2
    11d4:	1a82d021 	csel	w1, w1, w2, le
    11d8:	6b01001f 	cmp	w0, w1
    11dc:	1a81d000 	csel	w0, w0, w1, le
    }
    11e0:	f9408fe1 	ldr	x1, [sp, #280]
    11e4:	f9400062 	ldr	x2, [x3]
    11e8:	eb020021 	subs	x1, x1, x2
    11ec:	d2800002 	mov	x2, #0x0                   	// #0
    11f0:	540000e1 	b.ne	120c <checktick+0x234>  // b.any
    11f4:	a94153f3 	ldp	x19, x20, [sp, #16]
    11f8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    11fc:	f9401bf7 	ldr	x23, [sp, #48]
    1200:	6d4427e8 	ldp	d8, d9, [sp, #64]
    1204:	a8d27bfd 	ldp	x29, x30, [sp], #288
    1208:	d65f03c0 	ret
    120c:	97fffd99 	bl	870 <__stack_chk_fail@plt>

0000000000001210 <mysecond>:
{
    1210:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    1214:	910003fd 	mov	x29, sp
    1218:	f9000bf3 	str	x19, [sp, #16]
    121c:	b0000093 	adrp	x19, 12000 <__FRAME_END__+0xfe90>
        i = gettimeofday(&tp,&tzp);
    1220:	910083e1 	add	x1, sp, #0x20
    1224:	9100a3e0 	add	x0, sp, #0x28
{
    1228:	f947f273 	ldr	x19, [x19, #4064]
    122c:	f9400262 	ldr	x2, [x19]
    1230:	f9001fe2 	str	x2, [sp, #56]
    1234:	d2800002 	mov	x2, #0x0                   	// #0
        i = gettimeofday(&tp,&tzp);
    1238:	97fffd8a 	bl	860 <gettimeofday@plt>
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
    123c:	6d4283e1 	ldp	d1, d0, [sp, #40]
    1240:	90000000 	adrp	x0, 1000 <checktick+0x28>
    1244:	fd471802 	ldr	d2, [x0, #3632]
}
    1248:	f9401fe0 	ldr	x0, [sp, #56]
    124c:	f9400261 	ldr	x1, [x19]
    1250:	eb010000 	subs	x0, x0, x1
    1254:	d2800001 	mov	x1, #0x0                   	// #0
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
    1258:	5e61d821 	scvtf	d1, d1
    125c:	5e61d800 	scvtf	d0, d0
    1260:	1f420400 	fmadd	d0, d0, d2, d1
}
    1264:	54000081 	b.ne	1274 <mysecond+0x64>  // b.any
    1268:	f9400bf3 	ldr	x19, [sp, #16]
    126c:	a8c47bfd 	ldp	x29, x30, [sp], #64
    1270:	d65f03c0 	ret
    1274:	97fffd7f 	bl	870 <__stack_chk_fail@plt>

0000000000001278 <checkSTREAMresults>:

#ifndef abs
#define abs(a) ((a) >= 0 ? (a) : -(a))
#endif
void checkSTREAMresults ()
{
    1278:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
        }

    /* accumulate deltas between observed and expected results */
	aSumErr = 0.0;
	bSumErr = 0.0;
	cSumErr = 0.0;
    127c:	2f00e411 	movi	d17, #0x0
	for (j=0; j<STREAM_ARRAY_SIZE; j++) {
		aSumErr += abs(a[j] - aj);
    1280:	90000000 	adrp	x0, 1000 <checktick+0x28>
{
    1284:	910003fd 	mov	x29, sp
		aSumErr += abs(a[j] - aj);
    1288:	3dc3a013 	ldr	q19, [x0, #3712]
		bSumErr += abs(b[j] - bj);
    128c:	90000000 	adrp	x0, 1000 <checktick+0x28>
	aSumErr = 0.0;
    1290:	1e604226 	fmov	d6, d17
{
    1294:	6d0327e8 	stp	d8, d9, [sp, #48]
	bSumErr = 0.0;
    1298:	1e604229 	fmov	d9, d17
		bSumErr += abs(b[j] - bj);
    129c:	3dc3a412 	ldr	q18, [x0, #3728]
		cSumErr += abs(c[j] - cj);
    12a0:	90000000 	adrp	x0, 1000 <checktick+0x28>
    12a4:	d2968001 	mov	x1, #0xb400                	// #46080
{
    12a8:	a90153f3 	stp	x19, x20, [sp, #16]
    12ac:	b00262f4 	adrp	x20, 4c5e000 <c+0x4c4af80>
    12b0:	d0000093 	adrp	x19, 13000 <__data_start>
		bSumErr += abs(b[j] - bj);
    12b4:	91120283 	add	x3, x20, #0x480
		cSumErr += abs(c[j] - cj);
    12b8:	91020262 	add	x2, x19, #0x80
{
    12bc:	f90013f5 	str	x21, [sp, #32]
    12c0:	9004c555 	adrp	x21, 98a9000 <b+0x4c4ab80>
		aSumErr += abs(a[j] - aj);
    12c4:	912202a4 	add	x4, x21, #0x880
    12c8:	f2a09881 	movk	x1, #0x4c4, lsl #16
{
    12cc:	6d042fea 	stp	d10, d11, [sp, #64]
		cSumErr += abs(c[j] - cj);
    12d0:	3dc3a80a 	ldr	q10, [x0, #3744]
{
    12d4:	d2800000 	mov	x0, #0x0                   	// #0
    12d8:	fd0017ec 	str	d12, [sp, #40]
    12dc:	d503201f 	nop
		aSumErr += abs(a[j] - aj);
    12e0:	3ce46802 	ldr	q2, [x0, x4]
		bSumErr += abs(b[j] - bj);
    12e4:	3ce36801 	ldr	q1, [x0, x3]
		cSumErr += abs(c[j] - cj);
    12e8:	3ce26800 	ldr	q0, [x0, x2]
    12ec:	91004000 	add	x0, x0, #0x10
		aSumErr += abs(a[j] - aj);
    12f0:	4e73d445 	fadd	v5.2d, v2.2d, v19.2d
    12f4:	eb01001f 	cmp	x0, x1
		bSumErr += abs(b[j] - bj);
    12f8:	4e72d424 	fadd	v4.2d, v1.2d, v18.2d
		cSumErr += abs(c[j] - cj);
    12fc:	4e6ad403 	fadd	v3.2d, v0.2d, v10.2d
		aSumErr += abs(a[j] - aj);
    1300:	6ee0f8b0 	fneg	v16.2d, v5.2d
    1304:	6ee0c8a2 	fcmge	v2.2d, v5.2d, #0.0
		bSumErr += abs(b[j] - bj);
    1308:	6ee0f888 	fneg	v8.2d, v4.2d
    130c:	6ee0c881 	fcmge	v1.2d, v4.2d, #0.0
		cSumErr += abs(c[j] - cj);
    1310:	6ee0f867 	fneg	v7.2d, v3.2d
    1314:	6ee0c860 	fcmge	v0.2d, v3.2d, #0.0
    1318:	6e701ca2 	bsl	v2.16b, v5.16b, v16.16b
    131c:	6e681c81 	bsl	v1.16b, v4.16b, v8.16b
    1320:	6e671c60 	bsl	v0.16b, v3.16b, v7.16b
    1324:	5e080445 	mov	d5, v2.d[0]
    1328:	5e080424 	mov	d4, v1.d[0]
		aSumErr += abs(a[j] - aj);
    132c:	5e180442 	mov	d2, v2.d[1]
    1330:	5e080403 	mov	d3, v0.d[0]
		bSumErr += abs(b[j] - bj);
    1334:	5e180421 	mov	d1, v1.d[1]
		cSumErr += abs(c[j] - cj);
    1338:	5e180400 	mov	d0, v0.d[1]
    133c:	1e6528c6 	fadd	d6, d6, d5
    1340:	1e642924 	fadd	d4, d9, d4
    1344:	1e632a23 	fadd	d3, d17, d3
		aSumErr += abs(a[j] - aj);
    1348:	1e662846 	fadd	d6, d2, d6
		bSumErr += abs(b[j] - bj);
    134c:	1e642829 	fadd	d9, d1, d4
		cSumErr += abs(c[j] - cj);
    1350:	1e632811 	fadd	d17, d0, d3
	for (j=0; j<STREAM_ARRAY_SIZE; j++) {
    1354:	54fffc61 	b.ne	12e0 <checkSTREAMresults+0x68>  // b.any
		// if (j == 417) printf("Index 417: c[j]: %f, cj: %f\n",c[j],cj);	// MCCALPIN
	}
	aAvgErr = aSumErr / (STREAM_TYPE) STREAM_ARRAY_SIZE;
    1358:	d2c25a00 	mov	x0, #0x12d000000000        	// #20684562497536
    135c:	f2e82c60 	movk	x0, #0x4163, lsl #48
    1360:	9e670001 	fmov	d1, x0
		printf("WEIRD: sizeof(STREAM_TYPE) = %lu\n",sizeof(STREAM_TYPE));
		epsilon = 1.e-6;
	}

	err = 0;
	if (abs(aAvgErr/aj) > epsilon) {
    1364:	90000000 	adrp	x0, 1000 <checktick+0x28>
	aAvgErr = aSumErr / (STREAM_TYPE) STREAM_ARRAY_SIZE;
    1368:	1e6118c8 	fdiv	d8, d6, d1
	bAvgErr = bSumErr / (STREAM_TYPE) STREAM_ARRAY_SIZE;
    136c:	1e61192a 	fdiv	d10, d9, d1
	if (abs(aAvgErr/aj) > epsilon) {
    1370:	fd471c0c 	ldr	d12, [x0, #3640]
    1374:	90000000 	adrp	x0, 1000 <checktick+0x28>
	cAvgErr = cSumErr / (STREAM_TYPE) STREAM_ARRAY_SIZE;
    1378:	1e611a29 	fdiv	d9, d17, d1
	if (abs(aAvgErr/aj) > epsilon) {
    137c:	fd472000 	ldr	d0, [x0, #3648]
    1380:	1e6c190b 	fdiv	d11, d8, d12
    1384:	1e602168 	fcmp	d11, #0.0
    1388:	1e614161 	fneg	d1, d11
    138c:	1e6bbc21 	fcsel	d1, d1, d11, lt  // lt = tstop
    1390:	1e602030 	fcmpe	d1, d0
    1394:	5400150c 	b.gt	1634 <checkSTREAMresults+0x3bc>
    1398:	52800035 	mov	w21, #0x1                   	// #1
	err = 0;
    139c:	52800000 	mov	w0, #0x0                   	// #0
#endif
			}
		}
		printf("     For array a[], %d errors were found.\n",ierr);
	}
	if (abs(bAvgErr/bj) > epsilon) {
    13a0:	90000001 	adrp	x1, 1000 <checktick+0x28>
    13a4:	fd47242b 	ldr	d11, [x1, #3656]
    13a8:	90000001 	adrp	x1, 1000 <checktick+0x28>
    13ac:	fd472020 	ldr	d0, [x1, #3648]
    13b0:	1e6b1948 	fdiv	d8, d10, d11
    13b4:	1e602108 	fcmp	d8, #0.0
    13b8:	1e614101 	fneg	d1, d8
    13bc:	1e68bc21 	fcsel	d1, d1, d8, lt  // lt = tstop
    13c0:	1e602030 	fcmpe	d1, d0
    13c4:	54000bcc 	b.gt	153c <checkSTREAMresults+0x2c4>
#endif
			}
		}
		printf("     For array b[], %d errors were found.\n",ierr);
	}
	if (abs(cAvgErr/cj) > epsilon) {
    13c8:	90000001 	adrp	x1, 1000 <checktick+0x28>
    13cc:	fd47282a 	ldr	d10, [x1, #3664]
    13d0:	90000001 	adrp	x1, 1000 <checktick+0x28>
    13d4:	fd472020 	ldr	d0, [x1, #3648]
    13d8:	1e6a1928 	fdiv	d8, d9, d10
    13dc:	1e602108 	fcmp	d8, #0.0
    13e0:	1e614101 	fneg	d1, d8
    13e4:	1e68bc21 	fcsel	d1, d1, d8, lt  // lt = tstop
    13e8:	1e602030 	fcmpe	d1, d0
    13ec:	5400026c 	b.gt	1438 <checkSTREAMresults+0x1c0>
#endif
			}
		}
		printf("     For array c[], %d errors were found.\n",ierr);
	}
	if (err == 0) {
    13f0:	34000100 	cbz	w0, 1410 <checkSTREAMresults+0x198>
	printf ("Results Validation Verbose Results: \n");
	printf ("    Expected a(1), b(1), c(1): %f %f %f \n",aj,bj,cj);
	printf ("    Observed a(1), b(1), c(1): %f %f %f \n",a[1],b[1],c[1]);
	printf ("    Rel Errors on a, b, c:     %e %e %e \n",abs(aAvgErr/aj),abs(bAvgErr/bj),abs(cAvgErr/cj));
#endif
}
    13f4:	a94153f3 	ldp	x19, x20, [sp, #16]
    13f8:	f94013f5 	ldr	x21, [sp, #32]
    13fc:	fd4017ec 	ldr	d12, [sp, #40]
    1400:	6d4327e8 	ldp	d8, d9, [sp, #48]
    1404:	6d442fea 	ldp	d10, d11, [sp, #64]
    1408:	a8c57bfd 	ldp	x29, x30, [sp], #80
    140c:	d65f03c0 	ret
    1410:	a94153f3 	ldp	x19, x20, [sp, #16]
    1414:	90000001 	adrp	x1, 1000 <checktick+0x28>
    1418:	f94013f5 	ldr	x21, [sp, #32]
    141c:	91268021 	add	x1, x1, #0x9a0
    1420:	fd4017ec 	ldr	d12, [sp, #40]
    1424:	52800020 	mov	w0, #0x1                   	// #1
    1428:	6d4327e8 	ldp	d8, d9, [sp, #48]
    142c:	6d442fea 	ldp	d10, d11, [sp, #64]
    1430:	a8c57bfd 	ldp	x29, x30, [sp], #80
    1434:	17fffd03 	b	840 <__printf_chk@plt>
    1438:	90000001 	adrp	x1, 1000 <checktick+0x28>
    143c:	52800020 	mov	w0, #0x1                   	// #1
    1440:	9124c021 	add	x1, x1, #0x930
    1444:	97fffcff 	bl	840 <__printf_chk@plt>
		printf ("     Expected Value: %e, AvgAbsErr: %e, AvgRelAbsErr: %e\n",cj,cAvgErr,abs(cAvgErr)/cj);
    1448:	1e602138 	fcmpe	d9, #0.0
    144c:	5400172b 	b.lt	1730 <checkSTREAMresults+0x4b8>  // b.tstop
    1450:	90000000 	adrp	x0, 1000 <checktick+0x28>
    1454:	1e604102 	fmov	d2, d8
    1458:	1e604121 	fmov	d1, d9
    145c:	90000001 	adrp	x1, 1000 <checktick+0x28>
    1460:	fd472800 	ldr	d0, [x0, #3664]
    1464:	9120a021 	add	x1, x1, #0x828
    1468:	52800020 	mov	w0, #0x1                   	// #1
    146c:	97fffcf5 	bl	840 <__printf_chk@plt>
    1470:	90000000 	adrp	x0, 1000 <checktick+0x28>
    1474:	90000001 	adrp	x1, 1000 <checktick+0x28>
    1478:	91236021 	add	x1, x1, #0x8d8
    147c:	fd472000 	ldr	d0, [x0, #3648]
    1480:	52800020 	mov	w0, #0x1                   	// #1
    1484:	97fffcef 	bl	840 <__printf_chk@plt>
			if (abs(c[j]/cj-1.0) > epsilon) {
    1488:	90000002 	adrp	x2, 1000 <checktick+0x28>
    148c:	91020260 	add	x0, x19, #0x80
    1490:	4f000406 	movi	v6.4s, #0x0
    1494:	d2968001 	mov	x1, #0xb400                	// #46080
    1498:	3dc3bc4a 	ldr	q10, [x2, #3824]
    149c:	90000002 	adrp	x2, 1000 <checktick+0x28>
    14a0:	6f07f609 	fmov	v9.2d, #-1.000000000000000000e+00
    14a4:	f2a09881 	movk	x1, #0x4c4, lsl #16
    14a8:	3dc3b048 	ldr	q8, [x2, #3776]
    14ac:	90000002 	adrp	x2, 1000 <checktick+0x28>
    14b0:	8b010001 	add	x1, x0, x1
    14b4:	3dc3b447 	ldr	q7, [x2, #3792]
    14b8:	ad400001 	ldp	q1, q0, [x0]
    14bc:	91008000 	add	x0, x0, #0x20
    14c0:	eb00003f 	cmp	x1, x0
    14c4:	6e6afc21 	fdiv	v1.2d, v1.2d, v10.2d
    14c8:	6e6afc00 	fdiv	v0.2d, v0.2d, v10.2d
    14cc:	4e69d423 	fadd	v3.2d, v1.2d, v9.2d
    14d0:	4e69d402 	fadd	v2.2d, v0.2d, v9.2d
    14d4:	6ee0f865 	fneg	v5.2d, v3.2d
    14d8:	6ee0c861 	fcmge	v1.2d, v3.2d, #0.0
    14dc:	6ee0f844 	fneg	v4.2d, v2.2d
    14e0:	6ee0c840 	fcmge	v0.2d, v2.2d, #0.0
    14e4:	6e651c61 	bsl	v1.16b, v3.16b, v5.16b
    14e8:	6e641c40 	bsl	v0.16b, v2.16b, v4.16b
    14ec:	6ee8e421 	fcmgt	v1.2d, v1.2d, v8.2d
    14f0:	6ee8e400 	fcmgt	v0.2d, v0.2d, v8.2d
    14f4:	4e211ce1 	and	v1.16b, v7.16b, v1.16b
    14f8:	4e201ce0 	and	v0.16b, v7.16b, v0.16b
    14fc:	0ea12822 	xtn	v2.2s, v1.2d
    1500:	4ea12802 	xtn2	v2.4s, v0.2d
    1504:	4ea284c6 	add	v6.4s, v6.4s, v2.4s
		for (j=0; j<STREAM_ARRAY_SIZE; j++) {
    1508:	54fffd81 	b.ne	14b8 <checkSTREAMresults+0x240>  // b.any
    150c:	4eb1b8c6 	addv	s6, v6.4s
}
    1510:	fd4017ec 	ldr	d12, [sp, #40]
    1514:	a94153f3 	ldp	x19, x20, [sp, #16]
    1518:	90000001 	adrp	x1, 1000 <checktick+0x28>
    151c:	f94013f5 	ldr	x21, [sp, #32]
    1520:	0e043cc2 	mov	w2, v6.s[0]
    1524:	6d4327e8 	ldp	d8, d9, [sp, #48]
    1528:	9125c021 	add	x1, x1, #0x970
    152c:	6d442fea 	ldp	d10, d11, [sp, #64]
    1530:	52800020 	mov	w0, #0x1                   	// #1
    1534:	a8c57bfd 	ldp	x29, x30, [sp], #80
    1538:	17fffcc2 	b	840 <__printf_chk@plt>
    153c:	90000001 	adrp	x1, 1000 <checktick+0x28>
    1540:	52800020 	mov	w0, #0x1                   	// #1
    1544:	91226021 	add	x1, x1, #0x898
    1548:	97fffcbe 	bl	840 <__printf_chk@plt>
		printf ("     Expected Value: %e, AvgAbsErr: %e, AvgRelAbsErr: %e\n",bj,bAvgErr,abs(bAvgErr)/bj);
    154c:	1e602158 	fcmpe	d10, #0.0
    1550:	54000eab 	b.lt	1724 <checkSTREAMresults+0x4ac>  // b.tstop
    1554:	90000000 	adrp	x0, 1000 <checktick+0x28>
    1558:	1e604102 	fmov	d2, d8
    155c:	1e604141 	fmov	d1, d10
    1560:	90000001 	adrp	x1, 1000 <checktick+0x28>
    1564:	fd472400 	ldr	d0, [x0, #3656]
    1568:	9120a021 	add	x1, x1, #0x828
    156c:	52800020 	mov	w0, #0x1                   	// #1
    1570:	97fffcb4 	bl	840 <__printf_chk@plt>
    1574:	90000000 	adrp	x0, 1000 <checktick+0x28>
    1578:	90000001 	adrp	x1, 1000 <checktick+0x28>
    157c:	91236021 	add	x1, x1, #0x8d8
    1580:	fd472000 	ldr	d0, [x0, #3648]
    1584:	52800020 	mov	w0, #0x1                   	// #1
    1588:	97fffcae 	bl	840 <__printf_chk@plt>
			if (abs(b[j]/bj-1.0) > epsilon) {
    158c:	90000002 	adrp	x2, 1000 <checktick+0x28>
    1590:	91120280 	add	x0, x20, #0x480
    1594:	4f000406 	movi	v6.4s, #0x0
    1598:	d2968001 	mov	x1, #0xb400                	// #46080
    159c:	3dc3b850 	ldr	q16, [x2, #3808]
    15a0:	90000002 	adrp	x2, 1000 <checktick+0x28>
    15a4:	6f07f60a 	fmov	v10.2d, #-1.000000000000000000e+00
    15a8:	f2a09881 	movk	x1, #0x4c4, lsl #16
    15ac:	3dc3b048 	ldr	q8, [x2, #3776]
    15b0:	90000002 	adrp	x2, 1000 <checktick+0x28>
    15b4:	8b010001 	add	x1, x0, x1
    15b8:	3dc3b447 	ldr	q7, [x2, #3792]
    15bc:	d503201f 	nop
    15c0:	ad400001 	ldp	q1, q0, [x0]
    15c4:	91008000 	add	x0, x0, #0x20
    15c8:	eb00003f 	cmp	x1, x0
    15cc:	6e70fc21 	fdiv	v1.2d, v1.2d, v16.2d
    15d0:	6e70fc00 	fdiv	v0.2d, v0.2d, v16.2d
    15d4:	4e6ad423 	fadd	v3.2d, v1.2d, v10.2d
    15d8:	4e6ad402 	fadd	v2.2d, v0.2d, v10.2d
    15dc:	6ee0f865 	fneg	v5.2d, v3.2d
    15e0:	6ee0c861 	fcmge	v1.2d, v3.2d, #0.0
    15e4:	6ee0f844 	fneg	v4.2d, v2.2d
    15e8:	6ee0c840 	fcmge	v0.2d, v2.2d, #0.0
    15ec:	6e651c61 	bsl	v1.16b, v3.16b, v5.16b
    15f0:	6e641c40 	bsl	v0.16b, v2.16b, v4.16b
    15f4:	6ee8e421 	fcmgt	v1.2d, v1.2d, v8.2d
    15f8:	6ee8e400 	fcmgt	v0.2d, v0.2d, v8.2d
    15fc:	4e211ce1 	and	v1.16b, v7.16b, v1.16b
    1600:	4e201ce0 	and	v0.16b, v7.16b, v0.16b
    1604:	0ea12822 	xtn	v2.2s, v1.2d
    1608:	4ea12802 	xtn2	v2.4s, v0.2d
    160c:	4ea284c6 	add	v6.4s, v6.4s, v2.4s
		for (j=0; j<STREAM_ARRAY_SIZE; j++) {
    1610:	54fffd81 	b.ne	15c0 <checkSTREAMresults+0x348>  // b.any
    1614:	4eb1b8c6 	addv	s6, v6.4s
    1618:	90000001 	adrp	x1, 1000 <checktick+0x28>
    161c:	52800020 	mov	w0, #0x1                   	// #1
    1620:	91240021 	add	x1, x1, #0x900
    1624:	0e043cc2 	mov	w2, v6.s[0]
    1628:	97fffc86 	bl	840 <__printf_chk@plt>
		err++;
    162c:	2a1503e0 	mov	w0, w21
    1630:	17ffff66 	b	13c8 <checkSTREAMresults+0x150>
    1634:	90000001 	adrp	x1, 1000 <checktick+0x28>
    1638:	52800020 	mov	w0, #0x1                   	// #1
    163c:	911fa021 	add	x1, x1, #0x7e8
    1640:	97fffc80 	bl	840 <__printf_chk@plt>
		printf ("     Expected Value: %e, AvgAbsErr: %e, AvgRelAbsErr: %e\n",aj,aAvgErr,abs(aAvgErr)/aj);
    1644:	1e602118 	fcmpe	d8, #0.0
    1648:	5400068b 	b.lt	1718 <checkSTREAMresults+0x4a0>  // b.tstop
    164c:	90000000 	adrp	x0, 1000 <checktick+0x28>
    1650:	1e604101 	fmov	d1, d8
    1654:	1e604162 	fmov	d2, d11
    1658:	90000001 	adrp	x1, 1000 <checktick+0x28>
    165c:	fd471c00 	ldr	d0, [x0, #3640]
    1660:	9120a021 	add	x1, x1, #0x828
    1664:	52800020 	mov	w0, #0x1                   	// #1
    1668:	97fffc76 	bl	840 <__printf_chk@plt>
			if (abs(a[j]/aj-1.0) > epsilon) {
    166c:	90000002 	adrp	x2, 1000 <checktick+0x28>
    1670:	912202a0 	add	x0, x21, #0x880
    1674:	4f000406 	movi	v6.4s, #0x0
    1678:	d2968001 	mov	x1, #0xb400                	// #46080
    167c:	3dc3ac51 	ldr	q17, [x2, #3760]
    1680:	90000002 	adrp	x2, 1000 <checktick+0x28>
    1684:	6f07f610 	fmov	v16.2d, #-1.000000000000000000e+00
    1688:	f2a09881 	movk	x1, #0x4c4, lsl #16
    168c:	3dc3b048 	ldr	q8, [x2, #3776]
    1690:	90000002 	adrp	x2, 1000 <checktick+0x28>
    1694:	8b010001 	add	x1, x0, x1
    1698:	3dc3b447 	ldr	q7, [x2, #3792]
    169c:	d503201f 	nop
    16a0:	ad400001 	ldp	q1, q0, [x0]
    16a4:	91008000 	add	x0, x0, #0x20
    16a8:	eb00003f 	cmp	x1, x0
    16ac:	6e71fc21 	fdiv	v1.2d, v1.2d, v17.2d
    16b0:	6e71fc00 	fdiv	v0.2d, v0.2d, v17.2d
    16b4:	4e70d423 	fadd	v3.2d, v1.2d, v16.2d
    16b8:	4e70d402 	fadd	v2.2d, v0.2d, v16.2d
    16bc:	6ee0f865 	fneg	v5.2d, v3.2d
    16c0:	6ee0c861 	fcmge	v1.2d, v3.2d, #0.0
    16c4:	6ee0f844 	fneg	v4.2d, v2.2d
    16c8:	6ee0c840 	fcmge	v0.2d, v2.2d, #0.0
    16cc:	6e651c61 	bsl	v1.16b, v3.16b, v5.16b
    16d0:	6e641c40 	bsl	v0.16b, v2.16b, v4.16b
    16d4:	6ee8e421 	fcmgt	v1.2d, v1.2d, v8.2d
    16d8:	6ee8e400 	fcmgt	v0.2d, v0.2d, v8.2d
    16dc:	4e211ce1 	and	v1.16b, v7.16b, v1.16b
    16e0:	4e201ce0 	and	v0.16b, v7.16b, v0.16b
    16e4:	0ea12822 	xtn	v2.2s, v1.2d
    16e8:	4ea12802 	xtn2	v2.4s, v0.2d
    16ec:	4ea284c6 	add	v6.4s, v6.4s, v2.4s
		for (j=0; j<STREAM_ARRAY_SIZE; j++) {
    16f0:	54fffd81 	b.ne	16a0 <checkSTREAMresults+0x428>  // b.any
    16f4:	4eb1b8c6 	addv	s6, v6.4s
    16f8:	90000001 	adrp	x1, 1000 <checktick+0x28>
    16fc:	52800020 	mov	w0, #0x1                   	// #1
    1700:	9121a021 	add	x1, x1, #0x868
    1704:	52800055 	mov	w21, #0x2                   	// #2
    1708:	0e043cc2 	mov	w2, v6.s[0]
    170c:	97fffc4d 	bl	840 <__printf_chk@plt>
		err++;
    1710:	52800020 	mov	w0, #0x1                   	// #1
    1714:	17ffff23 	b	13a0 <checkSTREAMresults+0x128>
		printf ("     Expected Value: %e, AvgAbsErr: %e, AvgRelAbsErr: %e\n",aj,aAvgErr,abs(aAvgErr)/aj);
    1718:	1e61410b 	fneg	d11, d8
    171c:	1e6c196b 	fdiv	d11, d11, d12
    1720:	17ffffcb 	b	164c <checkSTREAMresults+0x3d4>
		printf ("     Expected Value: %e, AvgAbsErr: %e, AvgRelAbsErr: %e\n",bj,bAvgErr,abs(bAvgErr)/bj);
    1724:	1e614148 	fneg	d8, d10
    1728:	1e6b1908 	fdiv	d8, d8, d11
    172c:	17ffff8a 	b	1554 <checkSTREAMresults+0x2dc>
		printf ("     Expected Value: %e, AvgAbsErr: %e, AvgRelAbsErr: %e\n",cj,cAvgErr,abs(cAvgErr)/cj);
    1730:	1e614128 	fneg	d8, d9
    1734:	1e6a1908 	fdiv	d8, d8, d10
    1738:	17ffff46 	b	1450 <checkSTREAMresults+0x1d8>
    173c:	d503201f 	nop

0000000000001740 <__libc_csu_init>:
    1740:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    1744:	910003fd 	mov	x29, sp
    1748:	a90153f3 	stp	x19, x20, [sp, #16]
    174c:	b0000094 	adrp	x20, 12000 <__FRAME_END__+0xfe90>
    1750:	9134a294 	add	x20, x20, #0xd28
    1754:	a9025bf5 	stp	x21, x22, [sp, #32]
    1758:	b0000095 	adrp	x21, 12000 <__FRAME_END__+0xfe90>
    175c:	913482b5 	add	x21, x21, #0xd20
    1760:	cb150294 	sub	x20, x20, x21
    1764:	2a0003f6 	mov	w22, w0
    1768:	a90363f7 	stp	x23, x24, [sp, #48]
    176c:	aa0103f7 	mov	x23, x1
    1770:	aa0203f8 	mov	x24, x2
    1774:	97fffc19 	bl	7d8 <_init>
    1778:	eb940fff 	cmp	xzr, x20, asr #3
    177c:	54000160 	b.eq	17a8 <__libc_csu_init+0x68>  // b.none
    1780:	9343fe94 	asr	x20, x20, #3
    1784:	d2800013 	mov	x19, #0x0                   	// #0
    1788:	f8737aa3 	ldr	x3, [x21, x19, lsl #3]
    178c:	aa1803e2 	mov	x2, x24
    1790:	91000673 	add	x19, x19, #0x1
    1794:	aa1703e1 	mov	x1, x23
    1798:	2a1603e0 	mov	w0, w22
    179c:	d63f0060 	blr	x3
    17a0:	eb13029f 	cmp	x20, x19
    17a4:	54ffff21 	b.ne	1788 <__libc_csu_init+0x48>  // b.any
    17a8:	a94153f3 	ldp	x19, x20, [sp, #16]
    17ac:	a9425bf5 	ldp	x21, x22, [sp, #32]
    17b0:	a94363f7 	ldp	x23, x24, [sp, #48]
    17b4:	a8c47bfd 	ldp	x29, x30, [sp], #64
    17b8:	d65f03c0 	ret
    17bc:	d503201f 	nop

00000000000017c0 <__libc_csu_fini>:
    17c0:	d65f03c0 	ret

Disassembly of section .fini:

00000000000017c4 <_fini>:
    17c4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    17c8:	910003fd 	mov	x29, sp
    17cc:	a8c17bfd 	ldp	x29, x30, [sp], #16
    17d0:	d65f03c0 	ret
