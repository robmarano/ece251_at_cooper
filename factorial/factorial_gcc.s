	.arch armv8-a
	.file	"factorial.c"
	.text
	.align	2
	.global	fact
	.type	fact, %function
fact:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	bgt	.L2
	mov	x0, 1
	b	.L3
.L2:
	ldr	x0, [sp, 24]
	sub	x0, x0, #1
	bl	fact
	mov	x1, x0
	ldr	x0, [sp, 24]
	mul	x0, x1, x0
.L3:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	fact, .-fact
	.section	.rodata
	.align	3
.LC0:
	.string	"fact(%lld) = %lld\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	mov	x0, 5
	str	x0, [sp, 32]
	ldr	x0, [sp, 32]
	bl	fact
	str	x0, [sp, 40]
	ldr	x2, [sp, 40]
	ldr	x1, [sp, 32]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
