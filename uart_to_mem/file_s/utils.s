	.file	"utils.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	exit
	.type	exit, @function
exit:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a0,-20(s0)
	call	eoc
.L2:
	j	.L2
	.size	exit, .-exit
	.align	1
	.globl	eoc
	.type	eoc, @function
eoc:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	beq	a5,zero,.L4
	li	a5,437284864
	addi	a5,a5,20
	li	a4,1
	sw	a4,0(a5)
	j	.L5
.L4:
	li	a5,437284864
	addi	a5,a5,20
	sw	zero,0(a5)
.L5:
	li	a5,437284864
	addi	a5,a5,4
	lw	a4,0(a5)
	li	a5,437284864
	addi	a5,a5,4
	ori	a4,a4,4
	sw	a4,0(a5)
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	eoc, .-eoc
	.align	1
	.globl	sleep_busy
	.type	sleep_busy, @function
sleep_busy:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	j	.L7
.L8:
 #APP
# 44 "./file_c/utils.c" 1
	nop
# 0 "" 2
 #NO_APP
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L7:
	lw	a5,-36(s0)
	lw	a4,-20(s0)
	blt	a4,a5,.L8
	nop
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	sleep_busy, .-sleep_busy
	.section	.rodata
	.align	2
.LC0:
	.string	"cpu_perf_set: not implemented yet"
	.text
	.align	1
	.globl	cpu_perf_set
	.type	cpu_perf_set, @function
cpu_perf_set:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	puts
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	cpu_perf_set, .-cpu_perf_set
	.section	.rodata
	.align	2
.LC1:
	.string	"CSR %d not yet supported\n"
	.text
	.align	1
	.globl	cpu_perf_get
	.type	cpu_perf_get, @function
cpu_perf_get:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	lw	a4,-36(s0)
	li	a5,15
	bgtu	a4,a5,.L11
	lw	a5,-36(s0)
	slli	a4,a5,2
	lui	a5,%hi(.L13)
	addi	a5,a5,%lo(.L13)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L13:
	.word	.L28
	.word	.L27
	.word	.L26
	.word	.L25
	.word	.L24
	.word	.L23
	.word	.L22
	.word	.L21
	.word	.L20
	.word	.L19
	.word	.L18
	.word	.L17
	.word	.L16
	.word	.L15
	.word	.L14
	.word	.L12
	.text
.L28:
 #APP
# 57 "./file_c/utils.c" 1
	csrr a5, 0x780
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L27:
 #APP
# 58 "./file_c/utils.c" 1
	csrr a5, 0x781
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L26:
 #APP
# 59 "./file_c/utils.c" 1
	csrr a5, 0x782
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L25:
 #APP
# 60 "./file_c/utils.c" 1
	csrr a5, 0x783
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L24:
 #APP
# 61 "./file_c/utils.c" 1
	csrr a5, 0x784
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L23:
 #APP
# 62 "./file_c/utils.c" 1
	csrr a5, 0x785
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L22:
 #APP
# 63 "./file_c/utils.c" 1
	csrr a5, 0x786
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L21:
 #APP
# 64 "./file_c/utils.c" 1
	csrr a5, 0x787
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L20:
 #APP
# 65 "./file_c/utils.c" 1
	csrr a5, 0x788
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L19:
 #APP
# 66 "./file_c/utils.c" 1
	csrr a5, 0x789
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L18:
 #APP
# 67 "./file_c/utils.c" 1
	csrr a5, 0x78A
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L17:
 #APP
# 68 "./file_c/utils.c" 1
	csrr a5, 0x78B
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L16:
 #APP
# 69 "./file_c/utils.c" 1
	csrr a5, 0x78C
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L15:
 #APP
# 70 "./file_c/utils.c" 1
	csrr a5, 0x78D
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L14:
 #APP
# 71 "./file_c/utils.c" 1
	csrr a5, 0x78E
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L12:
 #APP
# 72 "./file_c/utils.c" 1
	csrr a5, 0x78F
# 0 "" 2
 #NO_APP
	sw	a5,-20(s0)
	j	.L29
.L11:
	lw	a1,-36(s0)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	nop
.L29:
	lw	a5,-20(s0)
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	cpu_perf_get, .-cpu_perf_get
	.ident	"GCC: (GNU) 10.2.0"
