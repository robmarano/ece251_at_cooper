	.arch armv8-a
	.file	"stack_grows_direction.c"
	.text
	.align	2
	.type	find_stack_direction, %function
find_stack_direction:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 24]
	mov	x1,0
	adrp	x0, addr.3809
	add	x0, x0, :lo12:addr.3809
	ldr	x0, [x0]
	cmp	x0, 0
	bne	.L2
	adrp	x0, addr.3809
	add	x0, x0, :lo12:addr.3809
	add	x1, sp, 23
	str	x1, [x0]
	bl	find_stack_direction
	b	.L6
.L2:
	adrp	x0, addr.3809
	add	x0, x0, :lo12:addr.3809
	ldr	x1, [x0]
	add	x0, sp, 23
	cmp	x1, x0
	bcs	.L4
	mov	w0, 1
	b	.L6
.L4:
	mov	w0, -1
.L6:
	mov	w1, w0
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 24]
	ldr	x3, [x0]
	subs	x2, x2, x3
	mov	x3, 0
	beq	.L7
	bl	__stack_chk_fail
.L7:
	mov	w0, w1
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	find_stack_direction, .-find_stack_direction
	.section	.rodata
	.align	3
.LC0:
	.string	"The stack on this computer grows (1=up;-1=down): %d\n"
	.align	3
.LC1:
	.string	"Address of q: %d\n"
	.align	3
.LC2:
	.string	"Address of s: %d\n"
	.align	3
.LC3:
	.string	"Address of a: %d\n"
	.align	3
.LC4:
	.string	"Address of a[1]: %d\n"
	.align	3
.LC5:
	.string	"Address of a[2]: %d\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 72]
	mov	x1,0
	mov	w0, 10
	str	w0, [sp, 52]
	ldr	w0, [sp, 52]
	cmp	w0, 10
	bgt	.L9
	ldr	w0, [sp, 52]
	add	w0, w0, 1
	str	w0, [sp, 52]
.L9:
	bl	find_stack_direction
	mov	w1, w0
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	mov	w0, 10
	str	w0, [sp, 44]
	mov	w0, 5
	str	w0, [sp, 48]
	add	x0, sp, 44
	mov	w1, w0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	add	x0, sp, 48
	mov	w1, w0
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	add	x0, sp, 56
	mov	w1, w0
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	printf
	add	x0, sp, 56
	add	x0, x0, 4
	mov	w1, w0
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	printf
	add	x0, sp, 56
	add	x0, x0, 8
	mov	w1, w0
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	printf
	mov	w0, 0
	mov	w1, w0
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 72]
	ldr	x3, [x0]
	subs	x2, x2, x3
	mov	x3, 0
	beq	.L11
	bl	__stack_chk_fail
.L11:
	mov	w0, w1
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.local	addr.3809
	.comm	addr.3809,8,8
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
