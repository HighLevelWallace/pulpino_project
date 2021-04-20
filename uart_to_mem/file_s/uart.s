	.file	"uart.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	uart_set_cfg
	.type	uart_set_cfg, @function
uart_set_cfg:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	mv	a5,a1
	sh	a5,-22(s0)
	li	a5,437284864
	addi	a5,a5,4
	lw	a4,0(a5)
	li	a5,437284864
	addi	a5,a5,4
	ori	a4,a4,2
	sw	a4,0(a5)
	li	a5,437256192
	addi	a5,a5,12
	li	a4,131
	sw	a4,0(a5)
	lhu	a5,-22(s0)
	srli	a5,a5,8
	slli	a5,a5,16
	srli	a5,a5,16
	mv	a4,a5
	li	a5,437256192
	addi	a5,a5,4
	andi	a4,a4,255
	sw	a4,0(a5)
	lhu	a4,-22(s0)
	li	a5,437256192
	andi	a4,a4,255
	sw	a4,0(a5)
	li	a5,437256192
	addi	a5,a5,8
	li	a4,167
	sw	a4,0(a5)
	li	a5,437256192
	addi	a5,a5,12
	li	a4,3
	sw	a4,0(a5)
	li	a5,437256192
	addi	a5,a5,4
	lw	a5,0(a5)
	andi	a4,a5,240
	li	a5,437256192
	addi	a5,a5,4
	ori	a4,a4,2
	sw	a4,0(a5)
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	uart_set_cfg, .-uart_set_cfg
	.align	2
	.globl	uart_send
	.type	uart_send, @function
uart_send:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	j	.L3
.L7:
	nop
.L4:
	li	a5,437256192
	addi	a5,a5,20
	lw	a5,0(a5)
	andi	a5,a5,32
	beq	a5,zero,.L4
	sw	zero,-20(s0)
	j	.L5
.L6:
	lw	a5,-36(s0)
	addi	a4,a5,1
	sw	a4,-36(s0)
	lbu	a4,0(a5)
	li	a5,437256192
	sw	a4,0(a5)
	lw	a5,-40(s0)
	addi	a5,a5,-1
	sw	a5,-40(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L5:
	lw	a4,-20(s0)
	li	a5,63
	bgtu	a4,a5,.L3
	lw	a5,-40(s0)
	bne	a5,zero,.L6
.L3:
	lw	a5,-40(s0)
	bne	a5,zero,.L7
	nop
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	uart_send, .-uart_send
	.align	2
	.globl	uart_getchar
	.type	uart_getchar, @function
uart_getchar:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	nop
.L9:
	li	a5,437256192
	addi	a5,a5,20
	lw	a5,0(a5)
	andi	a4,a5,1
	li	a5,1
	bne	a4,a5,.L9
	li	a5,437256192
	lw	a5,0(a5)
	andi	a5,a5,0xff
	mv	a0,a5
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	uart_getchar, .-uart_getchar
	.align	2
	.globl	uart_sendchar
	.type	uart_sendchar, @function
uart_sendchar:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	nop
.L12:
	li	a5,437256192
	addi	a5,a5,20
	lw	a5,0(a5)
	andi	a5,a5,32
	beq	a5,zero,.L12
	li	a5,437256192
	lbu	a4,-17(s0)
	sw	a4,0(a5)
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	uart_sendchar, .-uart_sendchar
	.align	2
	.globl	uart_wait_tx_done
	.type	uart_wait_tx_done, @function
uart_wait_tx_done:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	nop
.L14:
	li	a5,437256192
	addi	a5,a5,20
	lw	a5,0(a5)
	andi	a5,a5,64
	beq	a5,zero,.L14
	nop
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	uart_wait_tx_done, .-uart_wait_tx_done
	.ident	"GCC: (GNU) 10.2.0"
