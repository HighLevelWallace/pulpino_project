	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	is_hex
	.type	is_hex, @function
is_hex:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a4,-17(s0)
	li	a5,72
	bgtu	a4,a5,.L2
	lbu	a4,-17(s0)
	li	a5,64
	bgtu	a4,a5,.L3
.L2:
	lbu	a4,-17(s0)
	li	a5,104
	bgtu	a4,a5,.L4
	lbu	a4,-17(s0)
	li	a5,96
	bgtu	a4,a5,.L3
.L4:
	lbu	a4,-17(s0)
	li	a5,57
	bgtu	a4,a5,.L5
	lbu	a4,-17(s0)
	li	a5,47
	bleu	a4,a5,.L5
.L3:
	li	a5,1
	j	.L7
.L5:
	li	a5,0
.L7:
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	is_hex, .-is_hex
	.align	1
	.globl	one_count
	.type	one_count, @function
one_count:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sb	zero,-17(s0)
	sw	zero,-24(s0)
	j	.L9
.L10:
	lw	a5,-36(s0)
	andi	a5,a5,0xff
	andi	a5,a5,1
	andi	a4,a5,0xff
	lbu	a5,-17(s0)
	add	a5,a4,a5
	sb	a5,-17(s0)
	lw	a5,-36(s0)
	srli	a5,a5,1
	sw	a5,-36(s0)
.L9:
	lw	a5,-36(s0)
	bne	a5,zero,.L10
	lbu	a5,-17(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	one_count, .-one_count
	.align	1
	.globl	jump_and_start
	.type	jump_and_start, @function
jump_and_start:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
 #APP
# 29 "./file_c/main.c" 1
	jalr x0, a5
nop
nop
nop

# 0 "" 2
 #NO_APP
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	jump_and_start, .-jump_and_start
	.section	.rodata
	.align	2
.LC0:
	.string	"hello world!"
	.align	2
.LC1:
	.string	"waiting for uart signals to write to ram..."
	.align	2
.LC2:
	.string	"Done, jumping to Instruction RAM.\n"
	.align	2
.LC3:
	.string	"This isn't supposed to be shown. "
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	addi	s0,sp,64
	li	a1,12
	li	a0,0
	call	uart_set_cfg
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	sw	zero,-28(s0)
	j	.L14
.L15:
	li	a1,1
	lw	a0,-28(s0)
	call	set_gpio_pin_direction
	li	a1,1
	lw	a0,-28(s0)
	call	set_gpio_pin_value
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L14:
	lw	a4,-28(s0)
	li	a5,7
	ble	a4,a5,.L15
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	puts
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	call	uart_wait_tx_done
.L25:
	sw	zero,-32(s0)
.L20:
	lw	s1,-32(s0)
	addi	a5,s1,1
	sw	a5,-32(s0)
	call	uart_getchar
	mv	a5,a0
	mv	a4,a5
	addi	a5,s0,-16
	add	a5,a5,s1
	sb	a4,-32(a5)
	addi	a5,s0,-16
	add	a5,a5,s1
	lbu	a5,-32(a5)
	mv	a0,a5
	call	is_hex
	mv	a5,a0
	bne	a5,zero,.L16
	lw	a5,-32(s0)
	addi	a5,a5,-1
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a4,-32(a5)
	li	a5,64
	bne	a4,a5,.L28
	li	a5,1
	sw	a5,-24(s0)
	lw	a5,-32(s0)
	addi	a5,a5,-1
	sw	a5,-32(s0)
	j	.L18
.L16:
	lw	a4,-32(s0)
	li	a5,19
	bgt	a4,a5,.L29
.L18:
	j	.L20
.L28:
	nop
	j	.L19
.L29:
	nop
.L19:
	lw	a5,-24(s0)
	beq	a5,zero,.L21
	addi	a5,s0,-48
	mv	a0,a5
	call	str_to_int
	mv	a5,a0
	sw	a5,-20(s0)
	sw	zero,-24(s0)
	j	.L22
.L21:
	sb	zero,-40(s0)
	lw	a5,-32(s0)
	addi	a5,a5,-1
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a4,-32(a5)
	li	a5,113
	beq	a4,a5,.L30
	addi	a5,s0,-48
	mv	a0,a5
	call	str_to_int
	mv	a5,a0
	sw	a5,-36(s0)
	lw	a5,-20(s0)
	addi	a4,a5,4
	sw	a4,-20(s0)
	lw	a4,-36(s0)
	sw	a4,0(a5)
	lw	a0,-36(s0)
	call	one_count
	mv	a5,a0
	mv	a0,a5
	call	uart_sendchar
.L22:
	j	.L25
.L30:
	nop
	li	a1,34
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	uart_send
	call	uart_wait_tx_done
	li	a5,437284864
	addi	a5,a5,8
	sw	zero,0(a5)
	li	a0,128
	call	jump_and_start
.L26:
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	puts
	j	.L26
	.size	main, .-main
	.section	.rodata
	.align	2
.LC4:
	.ascii	"0123456789ABCDEF"
	.text
	.align	1
	.globl	hex_to_string
	.type	hex_to_string, @function
hex_to_string:
	addi	sp,sp,-64
	sw	s0,60(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	lui	a5,%hi(.LC4)
	addi	a5,a5,%lo(.LC4)
	lw	a2,0(a5)
	lw	a3,4(a5)
	lw	a4,8(a5)
	lw	a5,12(a5)
	sw	a2,-36(s0)
	sw	a3,-32(s0)
	sw	a4,-28(s0)
	sw	a5,-24(s0)
	sw	zero,-20(s0)
	j	.L32
.L33:
	li	a4,7
	lw	a5,-20(s0)
	sub	a5,a4,a5
	slli	a5,a5,2
	lw	a4,-56(s0)
	srl	a5,a4,a5
	andi	a4,a5,15
	lw	a5,-20(s0)
	lw	a3,-52(s0)
	add	a5,a3,a5
	addi	a3,s0,-16
	add	a4,a3,a4
	lbu	a4,-20(a4)
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L32:
	lw	a4,-20(s0)
	li	a5,7
	ble	a4,a5,.L33
	lw	a5,-52(s0)
	addi	a5,a5,8
	sb	zero,0(a5)
	nop
	lw	s0,60(sp)
	addi	sp,sp,64
	jr	ra
	.size	hex_to_string, .-hex_to_string
	.align	1
	.globl	str_to_int
	.type	str_to_int, @function
str_to_int:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	j	.L36
.L40:
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,57
	bgtu	a4,a5,.L37
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,47
	bleu	a4,a5,.L37
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	addi	a4,a5,-48
	li	a3,7
	lw	a5,-24(s0)
	sub	a5,a3,a5
	slli	a5,a5,2
	sll	a5,a4,a5
	lw	a4,-20(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
	j	.L38
.L37:
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,70
	bgtu	a4,a5,.L39
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,64
	bleu	a4,a5,.L39
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	addi	a4,a5,-55
	li	a3,7
	lw	a5,-24(s0)
	sub	a5,a3,a5
	slli	a5,a5,2
	sll	a5,a4,a5
	lw	a4,-20(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
	j	.L38
.L39:
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,102
	bgtu	a4,a5,.L38
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,96
	bleu	a4,a5,.L38
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	addi	a4,a5,-87
	li	a3,7
	lw	a5,-24(s0)
	sub	a5,a3,a5
	slli	a5,a5,2
	sll	a5,a4,a5
	lw	a4,-20(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
.L38:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L36:
	lw	a4,-24(s0)
	li	a5,7
	ble	a4,a5,.L40
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	str_to_int, .-str_to_int
	.ident	"GCC: (GNU) 10.2.0"
