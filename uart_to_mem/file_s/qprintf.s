	.file	"qprintf.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.type	divu10, @function
divu10:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a5,-36(s0)
	srli	a4,a5,1
	lw	a5,-36(s0)
	srli	a5,a5,2
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srli	a5,a5,4
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srli	a5,a5,8
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srli	a5,a5,16
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	srli	a5,a5,3
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,1
	mv	a4,a5
	lw	a5,-36(s0)
	sub	a5,a5,a4
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	addi	a5,a5,6
	srli	a4,a5,4
	lw	a5,-20(s0)
	add	a5,a4,a5
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	divu10, .-divu10
	.globl	remu10_table
	.data
	.align	2
	.type	remu10_table, @object
	.size	remu10_table, 16
remu10_table:
	.string	""
	.string	"\001\002\002\003\003\004\005\005\006\007\007\b\b\t"
	.text
	.align	1
	.type	remu10, @function
remu10:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a4,-20(s0)
	li	a5,429498368
	addi	a5,a5,-1639
	mul	a4,a4,a5
	lw	a5,-20(s0)
	srli	a5,a5,1
	add	a4,a4,a5
	lw	a5,-20(s0)
	srli	a5,a5,3
	add	a5,a4,a5
	srli	a5,a5,28
	sw	a5,-20(s0)
	lui	a5,%hi(remu10_table)
	addi	a4,a5,%lo(remu10_table)
	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	remu10, .-remu10
	.align	1
	.globl	putchar
	.type	putchar, @function
putchar:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	andi	a5,a5,0xff
	mv	a0,a5
	call	uart_sendchar
	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	putchar, .-putchar
	.align	1
	.type	qprintchar, @function
qprintchar:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-20(s0)
	beq	a5,zero,.L8
	lw	a5,-20(s0)
	lw	a5,0(a5)
	lw	a4,-24(s0)
	andi	a4,a4,0xff
	sb	a4,0(a5)
	lw	a5,-20(s0)
	lw	a5,0(a5)
	addi	a4,a5,1
	lw	a5,-20(s0)
	sw	a4,0(a5)
	j	.L10
.L8:
	lw	a5,-24(s0)
	andi	a5,a5,0xff
	mv	a0,a5
	call	putchar
.L10:
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	qprintchar, .-qprintchar
	.align	1
	.type	qprints, @function
qprints:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	a3,-48(s0)
	li	s1,0
	li	s4,32
	lw	a5,-44(s0)
	ble	a5,zero,.L12
	li	s2,0
	lw	s3,-40(s0)
	j	.L13
.L14:
	addi	s2,s2,1
	addi	s3,s3,1
.L13:
	lbu	a5,0(s3)
	bne	a5,zero,.L14
	lw	a5,-44(s0)
	blt	s2,a5,.L15
	sw	zero,-44(s0)
	j	.L16
.L15:
	lw	a5,-44(s0)
	sub	a5,a5,s2
	sw	a5,-44(s0)
.L16:
	lw	a5,-48(s0)
	andi	a5,a5,2
	beq	a5,zero,.L12
	li	s4,48
.L12:
	lw	a5,-48(s0)
	andi	a5,a5,1
	bne	a5,zero,.L20
	j	.L18
.L19:
	mv	a1,s4
	lw	a0,-36(s0)
	call	qprintchar
	addi	s1,s1,1
	lw	a5,-44(s0)
	addi	a5,a5,-1
	sw	a5,-44(s0)
.L18:
	lw	a5,-44(s0)
	bgt	a5,zero,.L19
	j	.L20
.L21:
	lw	a5,-40(s0)
	lbu	a5,0(a5)
	mv	a1,a5
	lw	a0,-36(s0)
	call	qprintchar
	addi	s1,s1,1
	lw	a5,-40(s0)
	addi	a5,a5,1
	sw	a5,-40(s0)
.L20:
	lw	a5,-40(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L21
	j	.L22
.L23:
	mv	a1,s4
	lw	a0,-36(s0)
	call	qprintchar
	addi	s1,s1,1
	lw	a5,-44(s0)
	addi	a5,a5,-1
	sw	a5,-44(s0)
.L22:
	lw	a5,-44(s0)
	bgt	a5,zero,.L23
	mv	a5,s1
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	addi	sp,sp,48
	jr	ra
	.size	qprints, .-qprints
	.align	1
	.type	qprinti, @function
qprinti:
	addi	sp,sp,-112
	sw	ra,108(sp)
	sw	s0,104(sp)
	sw	s1,100(sp)
	sw	s2,96(sp)
	sw	s3,92(sp)
	addi	s0,sp,112
	sw	a0,-84(s0)
	sw	a1,-88(s0)
	sw	a2,-92(s0)
	sw	a3,-96(s0)
	sw	a4,-100(s0)
	sw	a5,-104(s0)
	mv	a5,a6
	sb	a5,-105(s0)
	li	s3,0
	li	s2,0
	lw	a5,-88(s0)
	sw	a5,-36(s0)
	lw	a5,-88(s0)
	bne	a5,zero,.L26
	li	a5,48
	sb	a5,-72(s0)
	sb	zero,-71(s0)
	addi	a5,s0,-72
	lw	a3,-104(s0)
	lw	a2,-100(s0)
	mv	a1,a5
	lw	a0,-84(s0)
	call	qprints
	mv	a5,a0
	j	.L38
.L26:
	lw	a5,-96(s0)
	beq	a5,zero,.L28
	lw	a4,-92(s0)
	li	a5,10
	bne	a4,a5,.L28
	lw	a5,-88(s0)
	bge	a5,zero,.L28
	li	s3,1
	lw	a5,-88(s0)
	neg	a5,a5
	sw	a5,-36(s0)
.L28:
	addi	s1,s0,-72
	addi	s1,s1,31
	sb	zero,0(s1)
	lw	a4,-92(s0)
	li	a5,16
	bne	a4,a5,.L34
	j	.L30
.L32:
	lw	a5,-36(s0)
	andi	a5,a5,15
	sw	a5,-40(s0)
	lw	a4,-40(s0)
	li	a5,9
	ble	a4,a5,.L31
	lbu	a5,-105(s0)
	addi	a5,a5,-58
	lw	a4,-40(s0)
	add	a5,a4,a5
	sw	a5,-40(s0)
.L31:
	lw	a5,-40(s0)
	andi	a5,a5,0xff
	addi	s1,s1,-1
	addi	a5,a5,48
	andi	a5,a5,0xff
	sb	a5,0(s1)
	lw	a5,-36(s0)
	srli	a5,a5,4
	sw	a5,-36(s0)
.L30:
	lw	a5,-36(s0)
	bne	a5,zero,.L32
	j	.L33
.L35:
	lw	a0,-36(s0)
	call	remu10
	mv	a5,a0
	andi	a5,a5,0xff
	addi	s1,s1,-1
	addi	a5,a5,48
	andi	a5,a5,0xff
	sb	a5,0(s1)
	lw	a0,-36(s0)
	call	divu10
	sw	a0,-36(s0)
.L34:
	lw	a5,-36(s0)
	bne	a5,zero,.L35
.L33:
	beq	s3,zero,.L36
	lw	a5,-100(s0)
	beq	a5,zero,.L37
	lw	a5,-104(s0)
	andi	a5,a5,2
	beq	a5,zero,.L37
	li	a1,45
	lw	a0,-84(s0)
	call	qprintchar
	addi	s2,s2,1
	lw	a5,-100(s0)
	addi	a5,a5,-1
	sw	a5,-100(s0)
	j	.L36
.L37:
	addi	s1,s1,-1
	li	a5,45
	sb	a5,0(s1)
.L36:
	lw	a3,-104(s0)
	lw	a2,-100(s0)
	mv	a1,s1
	lw	a0,-84(s0)
	call	qprints
	mv	a5,a0
	add	a5,s2,a5
.L38:
	mv	a0,a5
	lw	ra,108(sp)
	lw	s0,104(sp)
	lw	s1,100(sp)
	lw	s2,96(sp)
	lw	s3,92(sp)
	addi	sp,sp,112
	jr	ra
	.size	qprinti, .-qprinti
	.section	.rodata
	.align	2
.LC0:
	.string	"(null)"
	.text
	.align	1
	.type	qprint, @function
qprint:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	li	s1,0
	j	.L40
.L59:
	lw	a5,-56(s0)
	lbu	a4,0(a5)
	li	a5,37
	bne	a4,a5,.L62
	lw	a5,-56(s0)
	addi	a5,a5,1
	sw	a5,-56(s0)
	li	s3,0
	mv	s2,s3
	lw	a5,-56(s0)
	lbu	a5,0(a5)
	beq	a5,zero,.L63
	lw	a5,-56(s0)
	lbu	a4,0(a5)
	li	a5,37
	beq	a4,a5,.L64
	lw	a5,-56(s0)
	lbu	a4,0(a5)
	li	a5,45
	bne	a4,a5,.L46
	lw	a5,-56(s0)
	addi	a5,a5,1
	sw	a5,-56(s0)
	li	s3,1
	j	.L46
.L47:
	lw	a5,-56(s0)
	addi	a5,a5,1
	sw	a5,-56(s0)
	ori	s3,s3,2
.L46:
	lw	a5,-56(s0)
	lbu	a4,0(a5)
	li	a5,48
	beq	a4,a5,.L47
	j	.L48
.L50:
	mv	a5,s2
	slli	a5,a5,2
	add	a5,a5,s2
	slli	a5,a5,1
	mv	s2,a5
	lw	a5,-56(s0)
	lbu	a5,0(a5)
	addi	a5,a5,-48
	add	s2,s2,a5
	lw	a5,-56(s0)
	addi	a5,a5,1
	sw	a5,-56(s0)
.L48:
	lw	a5,-56(s0)
	lbu	a4,0(a5)
	li	a5,47
	bleu	a4,a5,.L49
	lw	a5,-56(s0)
	lbu	a4,0(a5)
	li	a5,57
	bleu	a4,a5,.L50
.L49:
	lw	a5,-56(s0)
	lbu	a4,0(a5)
	li	a5,115
	bne	a4,a5,.L51
	lw	a5,-60(s0)
	addi	a4,a5,4
	sw	a4,-60(s0)
	lw	ra,0(a5)
	beq	ra,zero,.L52
	mv	a5,ra
	j	.L53
.L52:
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
.L53:
	mv	a3,s3
	mv	a2,s2
	mv	a1,a5
	lw	a0,-52(s0)
	call	qprints
	mv	a5,a0
	add	s1,s1,a5
	j	.L54
.L51:
	lw	a5,-56(s0)
	lbu	a4,0(a5)
	li	a5,100
	bne	a4,a5,.L55
	lw	a5,-60(s0)
	addi	a4,a5,4
	sw	a4,-60(s0)
	lw	a1,0(a5)
	li	a6,97
	mv	a5,s3
	mv	a4,s2
	li	a3,1
	li	a2,10
	lw	a0,-52(s0)
	call	qprinti
	mv	a5,a0
	add	s1,s1,a5
	j	.L54
.L55:
	lw	a5,-56(s0)
	lbu	a4,0(a5)
	li	a5,117
	bne	a4,a5,.L56
	lw	a5,-60(s0)
	addi	a4,a5,4
	sw	a4,-60(s0)
	lw	a5,0(a5)
	mv	a1,a5
	li	a6,97
	mv	a5,s3
	mv	a4,s2
	li	a3,0
	li	a2,10
	lw	a0,-52(s0)
	call	qprinti
	mv	a5,a0
	add	s1,s1,a5
	j	.L54
.L56:
	lw	a5,-56(s0)
	lbu	a4,0(a5)
	li	a5,120
	bne	a4,a5,.L57
	lw	a5,-60(s0)
	addi	a4,a5,4
	sw	a4,-60(s0)
	lw	a5,0(a5)
	mv	a1,a5
	li	a6,97
	mv	a5,s3
	mv	a4,s2
	li	a3,0
	li	a2,16
	lw	a0,-52(s0)
	call	qprinti
	mv	a5,a0
	add	s1,s1,a5
	j	.L54
.L57:
	lw	a5,-56(s0)
	lbu	a4,0(a5)
	li	a5,88
	bne	a4,a5,.L58
	lw	a5,-60(s0)
	addi	a4,a5,4
	sw	a4,-60(s0)
	lw	a5,0(a5)
	mv	a1,a5
	li	a6,65
	mv	a5,s3
	mv	a4,s2
	li	a3,0
	li	a2,16
	lw	a0,-52(s0)
	call	qprinti
	mv	a5,a0
	add	s1,s1,a5
	j	.L54
.L58:
	lw	a5,-56(s0)
	lbu	a4,0(a5)
	li	a5,99
	bne	a4,a5,.L54
	lw	a5,-60(s0)
	addi	a4,a5,4
	sw	a4,-60(s0)
	lw	a5,0(a5)
	andi	a5,a5,0xff
	sb	a5,-36(s0)
	sb	zero,-35(s0)
	addi	a5,s0,-36
	mv	a3,s3
	mv	a2,s2
	mv	a1,a5
	lw	a0,-52(s0)
	call	qprints
	mv	a5,a0
	add	s1,s1,a5
	j	.L54
.L62:
	nop
	j	.L41
.L64:
	nop
.L41:
	lw	a5,-56(s0)
	lbu	a5,0(a5)
	mv	a1,a5
	lw	a0,-52(s0)
	call	qprintchar
	addi	s1,s1,1
.L54:
	lw	a5,-56(s0)
	addi	a5,a5,1
	sw	a5,-56(s0)
.L40:
	lw	a5,-56(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L59
	j	.L43
.L63:
	nop
.L43:
	lw	a5,-52(s0)
	beq	a5,zero,.L60
	lw	a5,-52(s0)
	lw	a5,0(a5)
	sb	zero,0(a5)
.L60:
	mv	a5,s1
	mv	a0,a5
	lw	ra,60(sp)
	lw	s0,56(sp)
	lw	s1,52(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
	addi	sp,sp,64
	jr	ra
	.size	qprint, .-qprint
	.align	1
	.globl	printf
	.type	printf, @function
printf:
	addi	sp,sp,-80
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,4(s0)
	sw	a2,8(s0)
	sw	a3,12(s0)
	sw	a4,16(s0)
	sw	a5,20(s0)
	sw	a6,24(s0)
	sw	a7,28(s0)
	addi	a5,s0,32
	sw	a5,-40(s0)
	lw	a5,-40(s0)
	addi	a5,a5,-28
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	mv	a2,a5
	lw	a1,-36(s0)
	li	a0,0
	call	qprint
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,80
	jr	ra
	.size	printf, .-printf
	.align	1
	.globl	puts
	.type	puts, @function
puts:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	j	.L68
.L69:
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	add	a5,a5,a4
	lbu	a5,0(a5)
	mv	a0,a5
	call	putchar
.L68:
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L69
	li	a0,10
	call	putchar
	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	puts, .-puts
	.align	1
	.globl	strcmp
	.type	strcmp, @function
strcmp:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	or	a5,a4,a5
	andi	a5,a5,3
	bne	a5,zero,.L77
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	sw	a5,-24(s0)
	j	.L73
.L76:
	lw	a5,-20(s0)
	lw	a4,0(a5)
	li	a5,-16842752
	addi	a5,a5,-257
	add	a4,a4,a5
	lw	a5,-20(s0)
	lw	a5,0(a5)
	not	a5,a5
	and	a4,a4,a5
	li	a5,-2139062272
	addi	a5,a5,128
	and	a5,a4,a5
	beq	a5,zero,.L74
	li	a5,0
	j	.L75
.L74:
	lw	a5,-20(s0)
	addi	a5,a5,4
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,4
	sw	a5,-24(s0)
.L73:
	lw	a5,-20(s0)
	lw	a4,0(a5)
	lw	a5,-24(s0)
	lw	a5,0(a5)
	beq	a4,a5,.L76
	lw	a5,-20(s0)
	sw	a5,-36(s0)
	lw	a5,-24(s0)
	sw	a5,-40(s0)
	j	.L77
.L79:
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
	lw	a5,-40(s0)
	addi	a5,a5,1
	sw	a5,-40(s0)
.L77:
	lw	a5,-36(s0)
	lbu	a5,0(a5)
	beq	a5,zero,.L78
	lw	a5,-36(s0)
	lbu	a4,0(a5)
	lw	a5,-40(s0)
	lbu	a5,0(a5)
	beq	a4,a5,.L79
.L78:
	lw	a5,-36(s0)
	lbu	a5,0(a5)
	mv	a4,a5
	lw	a5,-40(s0)
	lbu	a5,0(a5)
	sub	a5,a4,a5
.L75:
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	strcmp, .-strcmp
	.align	1
	.globl	memset
	.type	memset, @function
memset:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	j	.L81
.L82:
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	lw	a4,-40(s0)
	andi	a4,a4,0xff
	sb	a4,0(a5)
	lw	a5,-44(s0)
	addi	a5,a5,-1
	sw	a5,-44(s0)
.L81:
	lw	a5,-44(s0)
	bne	a5,zero,.L82
	lw	a5,-36(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	memset, .-memset
	.align	1
	.globl	strcpy
	.type	strcpy, @function
strcpy:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	sw	a5,-24(s0)
	j	.L85
.L86:
	lw	a5,-24(s0)
	lbu	a4,0(a5)
	lw	a5,-20(s0)
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L85:
	lw	a5,-24(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L86
	lw	a5,-36(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	strcpy, .-strcpy
	.align	1
	.globl	strlen
	.type	strlen, @function
strlen:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	sw	zero,-24(s0)
	lw	a5,-20(s0)
	bne	a5,zero,.L91
	li	a5,0
	j	.L90
.L92:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L91:
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L92
	lw	a5,-24(s0)
.L90:
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	strlen, .-strlen
	.ident	"GCC: (GNU) 10.2.0"
