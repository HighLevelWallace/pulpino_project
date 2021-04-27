	.file	"spi.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	spi_setup_slave
	.type	spi_setup_slave, @function
spi_setup_slave:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a1,0
	li	a0,4
	call	set_pin_function
	li	a1,0
	li	a0,5
	call	set_pin_function
	li	a1,0
	li	a0,6
	call	set_pin_function
	li	a1,0
	li	a0,7
	call	set_pin_function
	li	a1,0
	li	a0,3
	call	set_pin_function
	nop
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	spi_setup_slave, .-spi_setup_slave
	.align	1
	.globl	spi_setup_master
	.type	spi_setup_master, @function
spi_setup_master:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	li	a1,0
	li	a0,15
	call	set_pin_function
	li	a1,0
	li	a0,14
	call	set_pin_function
	li	a1,0
	li	a0,13
	call	set_pin_function
	li	a1,0
	li	a0,12
	call	set_pin_function
	lw	a5,-20(s0)
	ble	a5,zero,.L3
	li	a1,0
	li	a0,16
	call	set_pin_function
.L3:
	lw	a4,-20(s0)
	li	a5,1
	ble	a4,a5,.L4
	li	a1,0
	li	a0,11
	call	set_pin_function
.L4:
	lw	a4,-20(s0)
	li	a5,2
	ble	a4,a5,.L5
	li	a1,0
	li	a0,0
	call	set_pin_function
.L5:
	lw	a4,-20(s0)
	li	a5,3
	ble	a4,a5,.L7
	li	a1,0
	li	a0,1
	call	set_pin_function
.L7:
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	spi_setup_master, .-spi_setup_master
	.align	1
	.globl	spi_setup_cmd_addr
	.type	spi_setup_cmd_addr, @function
spi_setup_cmd_addr:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	a3,-48(s0)
	li	a4,32
	lw	a5,-40(s0)
	sub	a5,a4,a5
	lw	a4,-36(s0)
	sll	a5,a4,a5
	sw	a5,-20(s0)
	li	a5,437264384
	addi	a5,a5,8
	lw	a4,-20(s0)
	sw	a4,0(a5)
	li	a5,437264384
	addi	a5,a5,12
	lw	a4,-44(s0)
	sw	a4,0(a5)
	lw	a5,-40(s0)
	andi	a3,a5,63
	lw	a5,-48(s0)
	slli	a4,a5,8
	li	a5,16384
	addi	a5,a5,-256
	and	a4,a4,a5
	li	a5,437264384
	addi	a5,a5,16
	or	a4,a3,a4
	sw	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	spi_setup_cmd_addr, .-spi_setup_cmd_addr
	.align	1
	.globl	spi_setup_dummy
	.type	spi_setup_dummy, @function
spi_setup_dummy:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-24(s0)
	slli	a5,a5,16
	mv	a3,a5
	lw	a4,-20(s0)
	li	a5,65536
	addi	a5,a5,-1
	and	a5,a4,a5
	or	a4,a3,a5
	li	a5,437264384
	addi	a5,a5,20
	sw	a4,0(a5)
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	spi_setup_dummy, .-spi_setup_dummy
	.align	1
	.globl	spi_set_datalen
	.type	spi_set_datalen, @function
spi_set_datalen:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	li	a5,437264384
	addi	a5,a5,16
	lw	a5,0(a5)
	sw	a5,-20(s0)
	lw	a5,-36(s0)
	slli	a5,a5,16
	mv	a4,a5
	lw	a5,-20(s0)
	mv	a3,a5
	li	a5,65536
	addi	a5,a5,-1
	and	a5,a3,a5
	or	a5,a4,a5
	sw	a5,-20(s0)
	li	a5,437264384
	addi	a5,a5,16
	lw	a4,-20(s0)
	sw	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	spi_set_datalen, .-spi_set_datalen
	.align	1
	.globl	spi_start_transaction
	.type	spi_start_transaction, @function
spi_start_transaction:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-24(s0)
	addi	a5,a5,8
	li	a4,1
	sll	a4,a4,a5
	li	a5,4096
	addi	a5,a5,-256
	and	a3,a4,a5
	lw	a5,-20(s0)
	li	a4,1
	sll	a5,a4,a5
	andi	a4,a5,255
	li	a5,437264384
	or	a4,a3,a4
	sw	a4,0(a5)
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	spi_start_transaction, .-spi_start_transaction
	.align	1
	.globl	spi_get_status
	.type	spi_get_status, @function
spi_get_status:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	li	a5,437264384
	lw	a5,0(a5)
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	spi_get_status, .-spi_get_status
	.align	1
	.globl	spi_write_fifo
	.type	spi_write_fifo, @function
spi_write_fifo:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	lw	a5,-40(s0)
	srai	a5,a5,5
	andi	a5,a5,2047
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	andi	a5,a5,31
	beq	a5,zero,.L15
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L15:
	sw	zero,-24(s0)
	j	.L16
.L18:
	nop
.L17:
	li	a5,437264384
	lw	a5,0(a5)
	srai	a5,a5,24
	andi	a5,a5,248
	bne	a5,zero,.L17
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a4,a4,a5
	li	a5,437264384
	addi	a5,a5,24
	lw	a4,0(a4)
	sw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L16:
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	blt	a4,a5,.L18
	nop
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	spi_write_fifo, .-spi_write_fifo
	.align	1
	.globl	spi_read_fifo
	.type	spi_read_fifo, @function
spi_read_fifo:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	lw	a5,-40(s0)
	srai	a5,a5,5
	andi	a5,a5,2047
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	andi	a5,a5,31
	beq	a5,zero,.L20
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L20:
	sw	zero,-24(s0)
	j	.L21
.L23:
	nop
.L22:
	li	a5,437264384
	lw	a5,0(a5)
	srai	a5,a5,16
	andi	a5,a5,255
	beq	a5,zero,.L22
	li	a5,437264384
	addi	a4,a5,32
	lw	a5,-24(s0)
	slli	a5,a5,2
	lw	a3,-36(s0)
	add	a5,a3,a5
	lw	a4,0(a4)
	sw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L21:
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	blt	a4,a5,.L23
	nop
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	spi_read_fifo, .-spi_read_fifo
	.ident	"GCC: (GNU) 10.2.0"
