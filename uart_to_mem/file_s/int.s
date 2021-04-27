	.file	"int.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.weak	ISR_SRAM
	.type	ISR_SRAM, @function
ISR_SRAM:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
.L2:
	j	.L2
	.size	ISR_SRAM, .-ISR_SRAM
	.align	1
	.weak	ISR_I2C
	.type	ISR_I2C, @function
ISR_I2C:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
.L4:
	j	.L4
	.size	ISR_I2C, .-ISR_I2C
	.align	1
	.weak	ISR_UART
	.type	ISR_UART, @function
ISR_UART:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
.L6:
	j	.L6
	.size	ISR_UART, .-ISR_UART
	.align	1
	.weak	ISR_GPIO
	.type	ISR_GPIO, @function
ISR_GPIO:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
.L8:
	j	.L8
	.size	ISR_GPIO, .-ISR_GPIO
	.align	1
	.weak	ISR_SPIM0
	.type	ISR_SPIM0, @function
ISR_SPIM0:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
.L10:
	j	.L10
	.size	ISR_SPIM0, .-ISR_SPIM0
	.align	1
	.weak	ISR_SPIM1
	.type	ISR_SPIM1, @function
ISR_SPIM1:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
.L12:
	j	.L12
	.size	ISR_SPIM1, .-ISR_SPIM1
	.align	1
	.weak	ISR_TA_OVF
	.type	ISR_TA_OVF, @function
ISR_TA_OVF:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
.L14:
	j	.L14
	.size	ISR_TA_OVF, .-ISR_TA_OVF
	.align	1
	.weak	ISR_TA_CMP
	.type	ISR_TA_CMP, @function
ISR_TA_CMP:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
.L16:
	j	.L16
	.size	ISR_TA_CMP, .-ISR_TA_CMP
	.align	1
	.weak	ISR_TB_OVF
	.type	ISR_TB_OVF, @function
ISR_TB_OVF:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
.L18:
	j	.L18
	.size	ISR_TB_OVF, .-ISR_TB_OVF
	.align	1
	.weak	ISR_TB_CMP
	.type	ISR_TB_CMP, @function
ISR_TB_CMP:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
.L20:
	j	.L20
	.size	ISR_TB_CMP, .-ISR_TB_CMP
	.ident	"GCC: (GNU) 10.2.0"
