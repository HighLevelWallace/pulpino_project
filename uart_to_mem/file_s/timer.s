	.file	"timer.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	reset_timer
	.type	reset_timer, @function
reset_timer:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	li	a5,437268480
	sw	zero,0(a5)
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	reset_timer, .-reset_timer
	.align	1
	.globl	start_timer
	.type	start_timer, @function
start_timer:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	li	a5,437268480
	addi	a5,a5,4
	li	a4,1
	sw	a4,0(a5)
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	start_timer, .-start_timer
	.align	1
	.globl	stop_timer
	.type	stop_timer, @function
stop_timer:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	li	a5,437268480
	addi	a5,a5,4
	sw	zero,0(a5)
	nop
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	stop_timer, .-stop_timer
	.align	1
	.globl	get_time
	.type	get_time, @function
get_time:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	li	a5,437268480
	lw	a5,0(a5)
	mv	a0,a5
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	get_time, .-get_time
	.ident	"GCC: (GNU) 10.2.0"
