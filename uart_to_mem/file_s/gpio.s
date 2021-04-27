	.file	"gpio.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	set_pin_function
	.type	set_pin_function, @function
set_pin_function:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	li	a5,437284864
	lw	a5,0(a5)
	sw	a5,-20(s0)
	lw	a5,-36(s0)
	li	a4,1
	sll	a5,a4,a5
	not	a4,a5
	lw	a5,-20(s0)
	and	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-36(s0)
	lw	a4,-40(s0)
	sll	a4,a4,a5
	lw	a5,-20(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
	li	a5,437284864
	lw	a4,-20(s0)
	sw	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	set_pin_function, .-set_pin_function
	.align	1
	.globl	get_pin_function
	.type	get_pin_function, @function
get_pin_function:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	li	a5,437284864
	lw	a5,0(a5)
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-36(s0)
	sra	a5,a4,a5
	andi	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	get_pin_function, .-get_pin_function
	.align	1
	.globl	set_gpio_pin_direction
	.type	set_gpio_pin_direction, @function
set_gpio_pin_direction:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	li	a5,437260288
	lw	a5,0(a5)
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	bne	a5,zero,.L5
	lw	a5,-36(s0)
	li	a4,1
	sll	a5,a4,a5
	not	a4,a5
	lw	a5,-20(s0)
	and	a5,a4,a5
	sw	a5,-20(s0)
	j	.L6
.L5:
	lw	a5,-36(s0)
	li	a4,1
	sll	a4,a4,a5
	lw	a5,-20(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
.L6:
	li	a5,437260288
	lw	a4,-20(s0)
	sw	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	set_gpio_pin_direction, .-set_gpio_pin_direction
	.align	1
	.globl	get_gpio_pin_direction
	.type	get_gpio_pin_direction, @function
get_gpio_pin_direction:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	li	a5,437260288
	lw	a5,0(a5)
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-36(s0)
	slli	a5,a5,1
	sra	a5,a4,a5
	andi	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	get_gpio_pin_direction, .-get_gpio_pin_direction
	.align	1
	.globl	set_gpio_pin_value
	.type	set_gpio_pin_value, @function
set_gpio_pin_value:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	li	a5,437260288
	addi	a5,a5,8
	lw	a5,0(a5)
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	bne	a5,zero,.L10
	lw	a5,-36(s0)
	li	a4,1
	sll	a5,a4,a5
	not	a4,a5
	lw	a5,-20(s0)
	and	a5,a4,a5
	sw	a5,-20(s0)
	j	.L11
.L10:
	lw	a5,-36(s0)
	li	a4,1
	sll	a4,a4,a5
	lw	a5,-20(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
.L11:
	li	a5,437260288
	addi	a5,a5,8
	lw	a4,-20(s0)
	sw	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	set_gpio_pin_value, .-set_gpio_pin_value
	.align	1
	.globl	get_gpio_pin_value
	.type	get_gpio_pin_value, @function
get_gpio_pin_value:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	li	a5,437260288
	addi	a5,a5,4
	lw	a5,0(a5)
	sw	a5,-20(s0)
	lw	a4,-20(s0)
	lw	a5,-36(s0)
	sra	a5,a4,a5
	andi	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	get_gpio_pin_value, .-get_gpio_pin_value
	.align	1
	.globl	set_gpio_pin_irq_en
	.type	set_gpio_pin_irq_en, @function
set_gpio_pin_irq_en:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	li	a5,437260288
	addi	a5,a5,12
	lw	a5,0(a5)
	sw	a5,-20(s0)
	lw	a5,-40(s0)
	bne	a5,zero,.L15
	lw	a5,-36(s0)
	li	a4,1
	sll	a5,a4,a5
	not	a5,a5
	lw	a4,-20(s0)
	and	a5,a4,a5
	sw	a5,-20(s0)
	j	.L16
.L15:
	lw	a5,-36(s0)
	li	a4,1
	sll	a5,a4,a5
	lw	a4,-20(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
.L16:
	li	a5,437260288
	addi	a5,a5,12
	lw	a4,-20(s0)
	sw	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	set_gpio_pin_irq_en, .-set_gpio_pin_irq_en
	.align	1
	.globl	set_gpio_pin_irq_type
	.type	set_gpio_pin_irq_type, @function
set_gpio_pin_irq_type:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	li	a5,437260288
	addi	a5,a5,16
	lw	a5,0(a5)
	sw	a5,-20(s0)
	li	a5,437260288
	addi	a5,a5,20
	lw	a5,0(a5)
	sw	a5,-24(s0)
	lw	a5,-40(s0)
	andi	a5,a5,1
	bne	a5,zero,.L18
	lw	a5,-36(s0)
	li	a4,1
	sll	a5,a4,a5
	not	a5,a5
	lw	a4,-20(s0)
	and	a5,a4,a5
	sw	a5,-20(s0)
	j	.L19
.L18:
	lw	a5,-36(s0)
	li	a4,1
	sll	a5,a4,a5
	lw	a4,-20(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
.L19:
	lw	a5,-40(s0)
	andi	a5,a5,2
	bne	a5,zero,.L20
	lw	a5,-36(s0)
	li	a4,1
	sll	a5,a4,a5
	not	a5,a5
	lw	a4,-24(s0)
	and	a5,a4,a5
	sw	a5,-24(s0)
	j	.L21
.L20:
	lw	a5,-36(s0)
	li	a4,1
	sll	a5,a4,a5
	lw	a4,-24(s0)
	or	a5,a4,a5
	sw	a5,-24(s0)
.L21:
	li	a5,437260288
	addi	a5,a5,16
	lw	a4,-20(s0)
	sw	a4,0(a5)
	li	a5,437260288
	addi	a5,a5,20
	lw	a4,-24(s0)
	sw	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	set_gpio_pin_irq_type, .-set_gpio_pin_irq_type
	.align	1
	.globl	get_gpio_irq_status
	.type	get_gpio_irq_status, @function
get_gpio_irq_status:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
	li	a5,437260288
	addi	a5,a5,24
	lw	a5,0(a5)
	mv	a0,a5
	lw	s0,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	get_gpio_irq_status, .-get_gpio_irq_status
	.ident	"GCC: (GNU) 10.2.0"
