	.arch armv8-a
	.file	"while.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"Hello, World!\n"
	.section	.data.rel.local,"aw"
	.align	3
	.type	hello_str, %object
	.size	hello_str, 8
hello_str:
	.xword	.LC0
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	wzr, [sp, 28]
	adrp	x0, hello_str
	add	x0, x0, :lo12:hello_str
	ldr	x1, [x0]
	ldrsw	x0, [sp, 28]
	add	x0, x1, x0
	ldrb	w0, [x0]
	strb	w0, [sp, 27]
	b	.L2
.L3:
	ldrb	w0, [sp, 27]
	mov	w2, 1
	mov	w1, w0
	mov	w0, 1
	bl	write
	ldr	w0, [sp, 28]
	add	w0, w0, 1
	str	w0, [sp, 28]
	adrp	x0, hello_str
	add	x0, x0, :lo12:hello_str
	ldr	x1, [x0]
	ldrsw	x0, [sp, 28]
	add	x0, x1, x0
	ldrb	w0, [x0]
	strb	w0, [sp, 27]
.L2:
	ldrb	w0, [sp, 27]
	cmp	w0, 0
	bne	.L3
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
