	.file	"exceptions.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.weak	default_exception_handler_c
	.type	default_exception_handler_c, @function
default_exception_handler_c:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
.L2:
	j	.L2
	.size	default_exception_handler_c, .-default_exception_handler_c
	.align	1
	.weak	illegal_insn_handler_c
	.type	illegal_insn_handler_c, @function
illegal_insn_handler_c:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
.L4:
	j	.L4
	.size	illegal_insn_handler_c, .-illegal_insn_handler_c
	.align	1
	.weak	ecall_insn_handler_c
	.type	ecall_insn_handler_c, @function
ecall_insn_handler_c:
	addi	sp,sp,-16
	sw	s0,12(sp)
	addi	s0,sp,16
.L6:
	j	.L6
	.size	ecall_insn_handler_c, .-ecall_insn_handler_c
	.ident	"GCC: (GNU) 10.2.0"
