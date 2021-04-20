
hello：     文件格式 elf32-littleriscv


Disassembly of section .vectors:

00010000 <_stack_start-0xf4000>:
   10000:	08c0006f          	j	1008c <_stext>
   10004:	00000013          	nop
   10008:	00000013          	nop
   1000c:	00000013          	nop
   10010:	00000013          	nop
   10014:	00000013          	nop
   10018:	00000013          	nop
   1001c:	00000013          	nop
   10020:	00000013          	nop
   10024:	00000013          	nop
   10028:	00000013          	nop
   1002c:	00000013          	nop
   10030:	00000013          	nop
   10034:	00000013          	nop
   10038:	00000013          	nop
   1003c:	00000013          	nop
   10040:	00000013          	nop
   10044:	00000013          	nop
   10048:	00000013          	nop
   1004c:	00000013          	nop
   10050:	00000013          	nop
   10054:	00000013          	nop
   10058:	0c00006f          	j	10118 <ISR_SRAM_ASM>
   1005c:	0d40006f          	j	10130 <ISR_I2C_ASM>
   10060:	0e80006f          	j	10148 <ISR_UART_ASM>
   10064:	0fc0006f          	j	10160 <ISR_GPIO_ASM>
   10068:	1100006f          	j	10178 <ISR_SPIM0_ASM>
   1006c:	1240006f          	j	10190 <ISR_SPIM1_ASM>
   10070:	1500006f          	j	101c0 <ISR_TA_OVF_ASM>
   10074:	1340006f          	j	101a8 <ISR_TA_CMP_ASM>
   10078:	1780006f          	j	101f0 <ISR_TB_OVF_ASM>
   1007c:	15c0006f          	j	101d8 <ISR_TB_CMP_ASM>
   10080:	00c0006f          	j	1008c <_stext>
   10084:	1840006f          	j	10208 <illegal_insn_handler>
   10088:	1980006f          	j	10220 <ecall_insn_handler>

Disassembly of section .text:

0001008c <_stext>:
   1008c:	30501073          	csrw	mtvec,zero
   10090:	00000093          	li	ra,0
   10094:	00008113          	mv	sp,ra
   10098:	00008193          	mv	gp,ra
   1009c:	00008213          	mv	tp,ra
   100a0:	00008293          	mv	t0,ra
   100a4:	00008313          	mv	t1,ra
   100a8:	00008393          	mv	t2,ra
   100ac:	00008413          	mv	s0,ra
   100b0:	00008493          	mv	s1,ra
   100b4:	00008513          	mv	a0,ra
   100b8:	00008593          	mv	a1,ra
   100bc:	00008613          	mv	a2,ra
   100c0:	00008693          	mv	a3,ra
   100c4:	00008713          	mv	a4,ra
   100c8:	00008793          	mv	a5,ra
   100cc:	000f4117          	auipc	sp,0xf4
   100d0:	f3410113          	addi	sp,sp,-204 # 104000 <_stack_start>

000100d4 <_start>:
   100d4:	00002717          	auipc	a4,0x2
   100d8:	0f070713          	addi	a4,a4,240 # 121c4 <_bss_end>
   100dc:	00002797          	auipc	a5,0x2
   100e0:	0e878793          	addi	a5,a5,232 # 121c4 <_bss_end>
   100e4:	00f75863          	bge	a4,a5,100f4 <main_entry>

000100e8 <zero_loop>:
   100e8:	00072023          	sw	zero,0(a4)
   100ec:	00470713          	addi	a4,a4,4
   100f0:	fee7dce3          	bge	a5,a4,100e8 <zero_loop>

000100f4 <main_entry>:
   100f4:	00000513          	li	a0,0
   100f8:	00100593          	li	a1,1
   100fc:	339010ef          	jal	ra,11c34 <uart_set_cfg>
   10100:	00000513          	li	a0,0
   10104:	00000593          	li	a1,0
   10108:	754000ef          	jal	ra,1085c <main>
   1010c:	00050413          	mv	s0,a0
   10110:	511010ef          	jal	ra,11e20 <uart_wait_tx_done>
   10114:	00040513          	mv	a0,s0

00010118 <ISR_SRAM_ASM>:
   10118:	fa010113          	addi	sp,sp,-96
   1011c:	04112e23          	sw	ra,92(sp)
   10120:	118000ef          	jal	ra,10238 <store_regs>
   10124:	00000097          	auipc	ra,0x0
   10128:	14408093          	addi	ra,ra,324 # 10268 <end_except>
   1012c:	5840006f          	j	106b0 <ISR_SRAM>

00010130 <ISR_I2C_ASM>:
   10130:	fa010113          	addi	sp,sp,-96
   10134:	04112e23          	sw	ra,92(sp)
   10138:	100000ef          	jal	ra,10238 <store_regs>
   1013c:	00000097          	auipc	ra,0x0
   10140:	12c08093          	addi	ra,ra,300 # 10268 <end_except>
   10144:	57c0006f          	j	106c0 <ISR_I2C>

00010148 <ISR_UART_ASM>:
   10148:	fa010113          	addi	sp,sp,-96
   1014c:	04112e23          	sw	ra,92(sp)
   10150:	0e8000ef          	jal	ra,10238 <store_regs>
   10154:	00000097          	auipc	ra,0x0
   10158:	11408093          	addi	ra,ra,276 # 10268 <end_except>
   1015c:	5740006f          	j	106d0 <ISR_UART>

00010160 <ISR_GPIO_ASM>:
   10160:	fa010113          	addi	sp,sp,-96
   10164:	04112e23          	sw	ra,92(sp)
   10168:	0d0000ef          	jal	ra,10238 <store_regs>
   1016c:	00000097          	auipc	ra,0x0
   10170:	0fc08093          	addi	ra,ra,252 # 10268 <end_except>
   10174:	56c0006f          	j	106e0 <ISR_GPIO>

00010178 <ISR_SPIM0_ASM>:
   10178:	fa010113          	addi	sp,sp,-96
   1017c:	04112e23          	sw	ra,92(sp)
   10180:	0b8000ef          	jal	ra,10238 <store_regs>
   10184:	00000097          	auipc	ra,0x0
   10188:	0e408093          	addi	ra,ra,228 # 10268 <end_except>
   1018c:	5640006f          	j	106f0 <ISR_SPIM0>

00010190 <ISR_SPIM1_ASM>:
   10190:	fa010113          	addi	sp,sp,-96
   10194:	04112e23          	sw	ra,92(sp)
   10198:	0a0000ef          	jal	ra,10238 <store_regs>
   1019c:	00000097          	auipc	ra,0x0
   101a0:	0cc08093          	addi	ra,ra,204 # 10268 <end_except>
   101a4:	55c0006f          	j	10700 <ISR_SPIM1>

000101a8 <ISR_TA_CMP_ASM>:
   101a8:	fa010113          	addi	sp,sp,-96
   101ac:	04112e23          	sw	ra,92(sp)
   101b0:	088000ef          	jal	ra,10238 <store_regs>
   101b4:	00000097          	auipc	ra,0x0
   101b8:	0b408093          	addi	ra,ra,180 # 10268 <end_except>
   101bc:	5640006f          	j	10720 <ISR_TA_CMP>

000101c0 <ISR_TA_OVF_ASM>:
   101c0:	fa010113          	addi	sp,sp,-96
   101c4:	04112e23          	sw	ra,92(sp)
   101c8:	070000ef          	jal	ra,10238 <store_regs>
   101cc:	00000097          	auipc	ra,0x0
   101d0:	09c08093          	addi	ra,ra,156 # 10268 <end_except>
   101d4:	53c0006f          	j	10710 <ISR_TA_OVF>

000101d8 <ISR_TB_CMP_ASM>:
   101d8:	fa010113          	addi	sp,sp,-96
   101dc:	04112e23          	sw	ra,92(sp)
   101e0:	058000ef          	jal	ra,10238 <store_regs>
   101e4:	00000097          	auipc	ra,0x0
   101e8:	08408093          	addi	ra,ra,132 # 10268 <end_except>
   101ec:	5540006f          	j	10740 <ISR_TB_CMP>

000101f0 <ISR_TB_OVF_ASM>:
   101f0:	fa010113          	addi	sp,sp,-96
   101f4:	04112e23          	sw	ra,92(sp)
   101f8:	040000ef          	jal	ra,10238 <store_regs>
   101fc:	00000097          	auipc	ra,0x0
   10200:	06c08093          	addi	ra,ra,108 # 10268 <end_except>
   10204:	52c0006f          	j	10730 <ISR_TB_OVF>

00010208 <illegal_insn_handler>:
   10208:	fa010113          	addi	sp,sp,-96
   1020c:	04112e23          	sw	ra,92(sp)
   10210:	028000ef          	jal	ra,10238 <store_regs>
   10214:	00000097          	auipc	ra,0x0
   10218:	05408093          	addi	ra,ra,84 # 10268 <end_except>
   1021c:	0980006f          	j	102b4 <illegal_insn_handler_c>

00010220 <ecall_insn_handler>:
   10220:	fa010113          	addi	sp,sp,-96
   10224:	04112e23          	sw	ra,92(sp)
   10228:	010000ef          	jal	ra,10238 <store_regs>
   1022c:	00000097          	auipc	ra,0x0
   10230:	03c08093          	addi	ra,ra,60 # 10268 <end_except>
   10234:	0900006f          	j	102c4 <ecall_insn_handler_c>

00010238 <store_regs>:
   10238:	00312023          	sw	gp,0(sp)
   1023c:	00412223          	sw	tp,4(sp)
   10240:	00512423          	sw	t0,8(sp)
   10244:	00612623          	sw	t1,12(sp)
   10248:	00712823          	sw	t2,16(sp)
   1024c:	00a12a23          	sw	a0,20(sp)
   10250:	00b12c23          	sw	a1,24(sp)
   10254:	00c12e23          	sw	a2,28(sp)
   10258:	02d12023          	sw	a3,32(sp)
   1025c:	02e12223          	sw	a4,36(sp)
   10260:	02f12423          	sw	a5,40(sp)
   10264:	00008067          	ret

00010268 <end_except>:
   10268:	00012183          	lw	gp,0(sp)
   1026c:	00412203          	lw	tp,4(sp)
   10270:	00812283          	lw	t0,8(sp)
   10274:	00c12303          	lw	t1,12(sp)
   10278:	01012383          	lw	t2,16(sp)
   1027c:	01412503          	lw	a0,20(sp)
   10280:	01812583          	lw	a1,24(sp)
   10284:	01c12603          	lw	a2,28(sp)
   10288:	02012683          	lw	a3,32(sp)
   1028c:	02412703          	lw	a4,36(sp)
   10290:	02812783          	lw	a5,40(sp)
   10294:	05c12083          	lw	ra,92(sp)
   10298:	06010113          	addi	sp,sp,96
   1029c:	30200073          	mret

000102a0 <_fini>:
   102a0:	00008067          	ret

000102a4 <default_exception_handler_c>:
   102a4:	ff010113          	addi	sp,sp,-16
   102a8:	00812623          	sw	s0,12(sp)
   102ac:	01010413          	addi	s0,sp,16
   102b0:	0000006f          	j	102b0 <default_exception_handler_c+0xc>

000102b4 <illegal_insn_handler_c>:
   102b4:	ff010113          	addi	sp,sp,-16
   102b8:	00812623          	sw	s0,12(sp)
   102bc:	01010413          	addi	s0,sp,16
   102c0:	0000006f          	j	102c0 <illegal_insn_handler_c+0xc>

000102c4 <ecall_insn_handler_c>:
   102c4:	ff010113          	addi	sp,sp,-16
   102c8:	00812623          	sw	s0,12(sp)
   102cc:	01010413          	addi	s0,sp,16
   102d0:	0000006f          	j	102d0 <ecall_insn_handler_c+0xc>

000102d4 <set_pin_function>:
   102d4:	fd010113          	addi	sp,sp,-48
   102d8:	02812623          	sw	s0,44(sp)
   102dc:	03010413          	addi	s0,sp,48
   102e0:	fca42e23          	sw	a0,-36(s0)
   102e4:	fcb42c23          	sw	a1,-40(s0)
   102e8:	1a1077b7          	lui	a5,0x1a107
   102ec:	0007a783          	lw	a5,0(a5) # 1a107000 <_stack_start+0x1a003000>
   102f0:	fef42623          	sw	a5,-20(s0)
   102f4:	fdc42783          	lw	a5,-36(s0)
   102f8:	00100713          	li	a4,1
   102fc:	00f717b3          	sll	a5,a4,a5
   10300:	fff7c713          	not	a4,a5
   10304:	fec42783          	lw	a5,-20(s0)
   10308:	00f777b3          	and	a5,a4,a5
   1030c:	fef42623          	sw	a5,-20(s0)
   10310:	fdc42783          	lw	a5,-36(s0)
   10314:	fd842703          	lw	a4,-40(s0)
   10318:	00f71733          	sll	a4,a4,a5
   1031c:	fec42783          	lw	a5,-20(s0)
   10320:	00f767b3          	or	a5,a4,a5
   10324:	fef42623          	sw	a5,-20(s0)
   10328:	1a1077b7          	lui	a5,0x1a107
   1032c:	fec42703          	lw	a4,-20(s0)
   10330:	00e7a023          	sw	a4,0(a5) # 1a107000 <_stack_start+0x1a003000>
   10334:	00000013          	nop
   10338:	02c12403          	lw	s0,44(sp)
   1033c:	03010113          	addi	sp,sp,48
   10340:	00008067          	ret

00010344 <get_pin_function>:
   10344:	fd010113          	addi	sp,sp,-48
   10348:	02812623          	sw	s0,44(sp)
   1034c:	03010413          	addi	s0,sp,48
   10350:	fca42e23          	sw	a0,-36(s0)
   10354:	1a1077b7          	lui	a5,0x1a107
   10358:	0007a783          	lw	a5,0(a5) # 1a107000 <_stack_start+0x1a003000>
   1035c:	fef42623          	sw	a5,-20(s0)
   10360:	fec42703          	lw	a4,-20(s0)
   10364:	fdc42783          	lw	a5,-36(s0)
   10368:	40f757b3          	sra	a5,a4,a5
   1036c:	0017f793          	andi	a5,a5,1
   10370:	fef42623          	sw	a5,-20(s0)
   10374:	fec42783          	lw	a5,-20(s0)
   10378:	00078513          	mv	a0,a5
   1037c:	02c12403          	lw	s0,44(sp)
   10380:	03010113          	addi	sp,sp,48
   10384:	00008067          	ret

00010388 <set_gpio_pin_direction>:
   10388:	fd010113          	addi	sp,sp,-48
   1038c:	02812623          	sw	s0,44(sp)
   10390:	03010413          	addi	s0,sp,48
   10394:	fca42e23          	sw	a0,-36(s0)
   10398:	fcb42c23          	sw	a1,-40(s0)
   1039c:	1a1017b7          	lui	a5,0x1a101
   103a0:	0007a783          	lw	a5,0(a5) # 1a101000 <_stack_start+0x19ffd000>
   103a4:	fef42623          	sw	a5,-20(s0)
   103a8:	fd842783          	lw	a5,-40(s0)
   103ac:	02079263          	bnez	a5,103d0 <set_gpio_pin_direction+0x48>
   103b0:	fdc42783          	lw	a5,-36(s0)
   103b4:	00100713          	li	a4,1
   103b8:	00f717b3          	sll	a5,a4,a5
   103bc:	fff7c713          	not	a4,a5
   103c0:	fec42783          	lw	a5,-20(s0)
   103c4:	00f777b3          	and	a5,a4,a5
   103c8:	fef42623          	sw	a5,-20(s0)
   103cc:	01c0006f          	j	103e8 <set_gpio_pin_direction+0x60>
   103d0:	fdc42783          	lw	a5,-36(s0)
   103d4:	00100713          	li	a4,1
   103d8:	00f71733          	sll	a4,a4,a5
   103dc:	fec42783          	lw	a5,-20(s0)
   103e0:	00f767b3          	or	a5,a4,a5
   103e4:	fef42623          	sw	a5,-20(s0)
   103e8:	1a1017b7          	lui	a5,0x1a101
   103ec:	fec42703          	lw	a4,-20(s0)
   103f0:	00e7a023          	sw	a4,0(a5) # 1a101000 <_stack_start+0x19ffd000>
   103f4:	00000013          	nop
   103f8:	02c12403          	lw	s0,44(sp)
   103fc:	03010113          	addi	sp,sp,48
   10400:	00008067          	ret

00010404 <get_gpio_pin_direction>:
   10404:	fd010113          	addi	sp,sp,-48
   10408:	02812623          	sw	s0,44(sp)
   1040c:	03010413          	addi	s0,sp,48
   10410:	fca42e23          	sw	a0,-36(s0)
   10414:	1a1017b7          	lui	a5,0x1a101
   10418:	0007a783          	lw	a5,0(a5) # 1a101000 <_stack_start+0x19ffd000>
   1041c:	fef42623          	sw	a5,-20(s0)
   10420:	fec42703          	lw	a4,-20(s0)
   10424:	fdc42783          	lw	a5,-36(s0)
   10428:	00179793          	slli	a5,a5,0x1
   1042c:	40f757b3          	sra	a5,a4,a5
   10430:	0017f793          	andi	a5,a5,1
   10434:	fef42623          	sw	a5,-20(s0)
   10438:	fec42783          	lw	a5,-20(s0)
   1043c:	00078513          	mv	a0,a5
   10440:	02c12403          	lw	s0,44(sp)
   10444:	03010113          	addi	sp,sp,48
   10448:	00008067          	ret

0001044c <set_gpio_pin_value>:
   1044c:	fd010113          	addi	sp,sp,-48
   10450:	02812623          	sw	s0,44(sp)
   10454:	03010413          	addi	s0,sp,48
   10458:	fca42e23          	sw	a0,-36(s0)
   1045c:	fcb42c23          	sw	a1,-40(s0)
   10460:	1a1017b7          	lui	a5,0x1a101
   10464:	00878793          	addi	a5,a5,8 # 1a101008 <_stack_start+0x19ffd008>
   10468:	0007a783          	lw	a5,0(a5)
   1046c:	fef42623          	sw	a5,-20(s0)
   10470:	fd842783          	lw	a5,-40(s0)
   10474:	02079263          	bnez	a5,10498 <set_gpio_pin_value+0x4c>
   10478:	fdc42783          	lw	a5,-36(s0)
   1047c:	00100713          	li	a4,1
   10480:	00f717b3          	sll	a5,a4,a5
   10484:	fff7c713          	not	a4,a5
   10488:	fec42783          	lw	a5,-20(s0)
   1048c:	00f777b3          	and	a5,a4,a5
   10490:	fef42623          	sw	a5,-20(s0)
   10494:	01c0006f          	j	104b0 <set_gpio_pin_value+0x64>
   10498:	fdc42783          	lw	a5,-36(s0)
   1049c:	00100713          	li	a4,1
   104a0:	00f71733          	sll	a4,a4,a5
   104a4:	fec42783          	lw	a5,-20(s0)
   104a8:	00f767b3          	or	a5,a4,a5
   104ac:	fef42623          	sw	a5,-20(s0)
   104b0:	1a1017b7          	lui	a5,0x1a101
   104b4:	00878793          	addi	a5,a5,8 # 1a101008 <_stack_start+0x19ffd008>
   104b8:	fec42703          	lw	a4,-20(s0)
   104bc:	00e7a023          	sw	a4,0(a5)
   104c0:	00000013          	nop
   104c4:	02c12403          	lw	s0,44(sp)
   104c8:	03010113          	addi	sp,sp,48
   104cc:	00008067          	ret

000104d0 <get_gpio_pin_value>:
   104d0:	fd010113          	addi	sp,sp,-48
   104d4:	02812623          	sw	s0,44(sp)
   104d8:	03010413          	addi	s0,sp,48
   104dc:	fca42e23          	sw	a0,-36(s0)
   104e0:	1a1017b7          	lui	a5,0x1a101
   104e4:	00478793          	addi	a5,a5,4 # 1a101004 <_stack_start+0x19ffd004>
   104e8:	0007a783          	lw	a5,0(a5)
   104ec:	fef42623          	sw	a5,-20(s0)
   104f0:	fec42703          	lw	a4,-20(s0)
   104f4:	fdc42783          	lw	a5,-36(s0)
   104f8:	40f757b3          	sra	a5,a4,a5
   104fc:	0017f793          	andi	a5,a5,1
   10500:	fef42623          	sw	a5,-20(s0)
   10504:	fec42783          	lw	a5,-20(s0)
   10508:	00078513          	mv	a0,a5
   1050c:	02c12403          	lw	s0,44(sp)
   10510:	03010113          	addi	sp,sp,48
   10514:	00008067          	ret

00010518 <set_gpio_pin_irq_en>:
   10518:	fd010113          	addi	sp,sp,-48
   1051c:	02812623          	sw	s0,44(sp)
   10520:	03010413          	addi	s0,sp,48
   10524:	fca42e23          	sw	a0,-36(s0)
   10528:	fcb42c23          	sw	a1,-40(s0)
   1052c:	1a1017b7          	lui	a5,0x1a101
   10530:	00c78793          	addi	a5,a5,12 # 1a10100c <_stack_start+0x19ffd00c>
   10534:	0007a783          	lw	a5,0(a5)
   10538:	fef42623          	sw	a5,-20(s0)
   1053c:	fd842783          	lw	a5,-40(s0)
   10540:	02079263          	bnez	a5,10564 <set_gpio_pin_irq_en+0x4c>
   10544:	fdc42783          	lw	a5,-36(s0)
   10548:	00100713          	li	a4,1
   1054c:	00f717b3          	sll	a5,a4,a5
   10550:	fff7c793          	not	a5,a5
   10554:	fec42703          	lw	a4,-20(s0)
   10558:	00f777b3          	and	a5,a4,a5
   1055c:	fef42623          	sw	a5,-20(s0)
   10560:	01c0006f          	j	1057c <set_gpio_pin_irq_en+0x64>
   10564:	fdc42783          	lw	a5,-36(s0)
   10568:	00100713          	li	a4,1
   1056c:	00f717b3          	sll	a5,a4,a5
   10570:	fec42703          	lw	a4,-20(s0)
   10574:	00f767b3          	or	a5,a4,a5
   10578:	fef42623          	sw	a5,-20(s0)
   1057c:	1a1017b7          	lui	a5,0x1a101
   10580:	00c78793          	addi	a5,a5,12 # 1a10100c <_stack_start+0x19ffd00c>
   10584:	fec42703          	lw	a4,-20(s0)
   10588:	00e7a023          	sw	a4,0(a5)
   1058c:	00000013          	nop
   10590:	02c12403          	lw	s0,44(sp)
   10594:	03010113          	addi	sp,sp,48
   10598:	00008067          	ret

0001059c <set_gpio_pin_irq_type>:
   1059c:	fd010113          	addi	sp,sp,-48
   105a0:	02812623          	sw	s0,44(sp)
   105a4:	03010413          	addi	s0,sp,48
   105a8:	fca42e23          	sw	a0,-36(s0)
   105ac:	fcb42c23          	sw	a1,-40(s0)
   105b0:	1a1017b7          	lui	a5,0x1a101
   105b4:	01078793          	addi	a5,a5,16 # 1a101010 <_stack_start+0x19ffd010>
   105b8:	0007a783          	lw	a5,0(a5)
   105bc:	fef42623          	sw	a5,-20(s0)
   105c0:	1a1017b7          	lui	a5,0x1a101
   105c4:	01478793          	addi	a5,a5,20 # 1a101014 <_stack_start+0x19ffd014>
   105c8:	0007a783          	lw	a5,0(a5)
   105cc:	fef42423          	sw	a5,-24(s0)
   105d0:	fd842783          	lw	a5,-40(s0)
   105d4:	0017f793          	andi	a5,a5,1
   105d8:	02079263          	bnez	a5,105fc <set_gpio_pin_irq_type+0x60>
   105dc:	fdc42783          	lw	a5,-36(s0)
   105e0:	00100713          	li	a4,1
   105e4:	00f717b3          	sll	a5,a4,a5
   105e8:	fff7c793          	not	a5,a5
   105ec:	fec42703          	lw	a4,-20(s0)
   105f0:	00f777b3          	and	a5,a4,a5
   105f4:	fef42623          	sw	a5,-20(s0)
   105f8:	01c0006f          	j	10614 <set_gpio_pin_irq_type+0x78>
   105fc:	fdc42783          	lw	a5,-36(s0)
   10600:	00100713          	li	a4,1
   10604:	00f717b3          	sll	a5,a4,a5
   10608:	fec42703          	lw	a4,-20(s0)
   1060c:	00f767b3          	or	a5,a4,a5
   10610:	fef42623          	sw	a5,-20(s0)
   10614:	fd842783          	lw	a5,-40(s0)
   10618:	0027f793          	andi	a5,a5,2
   1061c:	02079263          	bnez	a5,10640 <set_gpio_pin_irq_type+0xa4>
   10620:	fdc42783          	lw	a5,-36(s0)
   10624:	00100713          	li	a4,1
   10628:	00f717b3          	sll	a5,a4,a5
   1062c:	fff7c793          	not	a5,a5
   10630:	fe842703          	lw	a4,-24(s0)
   10634:	00f777b3          	and	a5,a4,a5
   10638:	fef42423          	sw	a5,-24(s0)
   1063c:	01c0006f          	j	10658 <set_gpio_pin_irq_type+0xbc>
   10640:	fdc42783          	lw	a5,-36(s0)
   10644:	00100713          	li	a4,1
   10648:	00f717b3          	sll	a5,a4,a5
   1064c:	fe842703          	lw	a4,-24(s0)
   10650:	00f767b3          	or	a5,a4,a5
   10654:	fef42423          	sw	a5,-24(s0)
   10658:	1a1017b7          	lui	a5,0x1a101
   1065c:	01078793          	addi	a5,a5,16 # 1a101010 <_stack_start+0x19ffd010>
   10660:	fec42703          	lw	a4,-20(s0)
   10664:	00e7a023          	sw	a4,0(a5)
   10668:	1a1017b7          	lui	a5,0x1a101
   1066c:	01478793          	addi	a5,a5,20 # 1a101014 <_stack_start+0x19ffd014>
   10670:	fe842703          	lw	a4,-24(s0)
   10674:	00e7a023          	sw	a4,0(a5)
   10678:	00000013          	nop
   1067c:	02c12403          	lw	s0,44(sp)
   10680:	03010113          	addi	sp,sp,48
   10684:	00008067          	ret

00010688 <get_gpio_irq_status>:
   10688:	ff010113          	addi	sp,sp,-16
   1068c:	00812623          	sw	s0,12(sp)
   10690:	01010413          	addi	s0,sp,16
   10694:	1a1017b7          	lui	a5,0x1a101
   10698:	01878793          	addi	a5,a5,24 # 1a101018 <_stack_start+0x19ffd018>
   1069c:	0007a783          	lw	a5,0(a5)
   106a0:	00078513          	mv	a0,a5
   106a4:	00c12403          	lw	s0,12(sp)
   106a8:	01010113          	addi	sp,sp,16
   106ac:	00008067          	ret

000106b0 <ISR_SRAM>:
   106b0:	ff010113          	addi	sp,sp,-16
   106b4:	00812623          	sw	s0,12(sp)
   106b8:	01010413          	addi	s0,sp,16
   106bc:	0000006f          	j	106bc <ISR_SRAM+0xc>

000106c0 <ISR_I2C>:
   106c0:	ff010113          	addi	sp,sp,-16
   106c4:	00812623          	sw	s0,12(sp)
   106c8:	01010413          	addi	s0,sp,16
   106cc:	0000006f          	j	106cc <ISR_I2C+0xc>

000106d0 <ISR_UART>:
   106d0:	ff010113          	addi	sp,sp,-16
   106d4:	00812623          	sw	s0,12(sp)
   106d8:	01010413          	addi	s0,sp,16
   106dc:	0000006f          	j	106dc <ISR_UART+0xc>

000106e0 <ISR_GPIO>:
   106e0:	ff010113          	addi	sp,sp,-16
   106e4:	00812623          	sw	s0,12(sp)
   106e8:	01010413          	addi	s0,sp,16
   106ec:	0000006f          	j	106ec <ISR_GPIO+0xc>

000106f0 <ISR_SPIM0>:
   106f0:	ff010113          	addi	sp,sp,-16
   106f4:	00812623          	sw	s0,12(sp)
   106f8:	01010413          	addi	s0,sp,16
   106fc:	0000006f          	j	106fc <ISR_SPIM0+0xc>

00010700 <ISR_SPIM1>:
   10700:	ff010113          	addi	sp,sp,-16
   10704:	00812623          	sw	s0,12(sp)
   10708:	01010413          	addi	s0,sp,16
   1070c:	0000006f          	j	1070c <ISR_SPIM1+0xc>

00010710 <ISR_TA_OVF>:
   10710:	ff010113          	addi	sp,sp,-16
   10714:	00812623          	sw	s0,12(sp)
   10718:	01010413          	addi	s0,sp,16
   1071c:	0000006f          	j	1071c <ISR_TA_OVF+0xc>

00010720 <ISR_TA_CMP>:
   10720:	ff010113          	addi	sp,sp,-16
   10724:	00812623          	sw	s0,12(sp)
   10728:	01010413          	addi	s0,sp,16
   1072c:	0000006f          	j	1072c <ISR_TA_CMP+0xc>

00010730 <ISR_TB_OVF>:
   10730:	ff010113          	addi	sp,sp,-16
   10734:	00812623          	sw	s0,12(sp)
   10738:	01010413          	addi	s0,sp,16
   1073c:	0000006f          	j	1073c <ISR_TB_OVF+0xc>

00010740 <ISR_TB_CMP>:
   10740:	ff010113          	addi	sp,sp,-16
   10744:	00812623          	sw	s0,12(sp)
   10748:	01010413          	addi	s0,sp,16
   1074c:	0000006f          	j	1074c <ISR_TB_CMP+0xc>

00010750 <is_hex>:
   10750:	fe010113          	addi	sp,sp,-32
   10754:	00812e23          	sw	s0,28(sp)
   10758:	02010413          	addi	s0,sp,32
   1075c:	00050793          	mv	a5,a0
   10760:	fef407a3          	sb	a5,-17(s0)
   10764:	fef44703          	lbu	a4,-17(s0)
   10768:	04800793          	li	a5,72
   1076c:	00e7e863          	bltu	a5,a4,1077c <is_hex+0x2c>
   10770:	fef44703          	lbu	a4,-17(s0)
   10774:	04000793          	li	a5,64
   10778:	02e7ea63          	bltu	a5,a4,107ac <is_hex+0x5c>
   1077c:	fef44703          	lbu	a4,-17(s0)
   10780:	06800793          	li	a5,104
   10784:	00e7e863          	bltu	a5,a4,10794 <is_hex+0x44>
   10788:	fef44703          	lbu	a4,-17(s0)
   1078c:	06000793          	li	a5,96
   10790:	00e7ee63          	bltu	a5,a4,107ac <is_hex+0x5c>
   10794:	fef44703          	lbu	a4,-17(s0)
   10798:	03900793          	li	a5,57
   1079c:	00e7ec63          	bltu	a5,a4,107b4 <is_hex+0x64>
   107a0:	fef44703          	lbu	a4,-17(s0)
   107a4:	02f00793          	li	a5,47
   107a8:	00e7f663          	bgeu	a5,a4,107b4 <is_hex+0x64>
   107ac:	00100793          	li	a5,1
   107b0:	0080006f          	j	107b8 <is_hex+0x68>
   107b4:	00000793          	li	a5,0
   107b8:	00078513          	mv	a0,a5
   107bc:	01c12403          	lw	s0,28(sp)
   107c0:	02010113          	addi	sp,sp,32
   107c4:	00008067          	ret

000107c8 <one_count>:
   107c8:	fd010113          	addi	sp,sp,-48
   107cc:	02812623          	sw	s0,44(sp)
   107d0:	03010413          	addi	s0,sp,48
   107d4:	fca42e23          	sw	a0,-36(s0)
   107d8:	fe0407a3          	sb	zero,-17(s0)
   107dc:	fe042423          	sw	zero,-24(s0)
   107e0:	02c0006f          	j	1080c <one_count+0x44>
   107e4:	fdc42783          	lw	a5,-36(s0)
   107e8:	0ff7f793          	andi	a5,a5,255
   107ec:	0017f793          	andi	a5,a5,1
   107f0:	0ff7f713          	andi	a4,a5,255
   107f4:	fef44783          	lbu	a5,-17(s0)
   107f8:	00f707b3          	add	a5,a4,a5
   107fc:	fef407a3          	sb	a5,-17(s0)
   10800:	fdc42783          	lw	a5,-36(s0)
   10804:	0017d793          	srli	a5,a5,0x1
   10808:	fcf42e23          	sw	a5,-36(s0)
   1080c:	fdc42783          	lw	a5,-36(s0)
   10810:	fc079ae3          	bnez	a5,107e4 <one_count+0x1c>
   10814:	fef44783          	lbu	a5,-17(s0)
   10818:	00078513          	mv	a0,a5
   1081c:	02c12403          	lw	s0,44(sp)
   10820:	03010113          	addi	sp,sp,48
   10824:	00008067          	ret

00010828 <jump_and_start>:
   10828:	fe010113          	addi	sp,sp,-32
   1082c:	00812e23          	sw	s0,28(sp)
   10830:	02010413          	addi	s0,sp,32
   10834:	fea42623          	sw	a0,-20(s0)
   10838:	fec42783          	lw	a5,-20(s0)
   1083c:	00078067          	jr	a5
   10840:	00000013          	nop
   10844:	00000013          	nop
   10848:	00000013          	nop
   1084c:	00000013          	nop
   10850:	01c12403          	lw	s0,28(sp)
   10854:	02010113          	addi	sp,sp,32
   10858:	00008067          	ret

0001085c <main>:
   1085c:	fc010113          	addi	sp,sp,-64
   10860:	02112e23          	sw	ra,60(sp)
   10864:	02812c23          	sw	s0,56(sp)
   10868:	02912a23          	sw	s1,52(sp)
   1086c:	04010413          	addi	s0,sp,64
   10870:	00c00593          	li	a1,12
   10874:	00000513          	li	a0,0
   10878:	3bc010ef          	jal	ra,11c34 <uart_set_cfg>
   1087c:	fe042623          	sw	zero,-20(s0)
   10880:	fe042423          	sw	zero,-24(s0)
   10884:	0280006f          	j	108ac <main+0x50>
   10888:	00100593          	li	a1,1
   1088c:	fe842503          	lw	a0,-24(s0)
   10890:	af9ff0ef          	jal	ra,10388 <set_gpio_pin_direction>
   10894:	00100593          	li	a1,1
   10898:	fe842503          	lw	a0,-24(s0)
   1089c:	bb1ff0ef          	jal	ra,1044c <set_gpio_pin_value>
   108a0:	fe842783          	lw	a5,-24(s0)
   108a4:	00178793          	addi	a5,a5,1
   108a8:	fef42423          	sw	a5,-24(s0)
   108ac:	fe842703          	lw	a4,-24(s0)
   108b0:	00700793          	li	a5,7
   108b4:	fce7dae3          	bge	a5,a4,10888 <main+0x2c>
   108b8:	000127b7          	lui	a5,0x12
   108bc:	09878513          	addi	a0,a5,152 # 12098 <__DTOR_END__>
   108c0:	3e5000ef          	jal	ra,114a4 <puts>
   108c4:	000127b7          	lui	a5,0x12
   108c8:	0a878513          	addi	a0,a5,168 # 120a8 <__DTOR_END__+0x10>
   108cc:	3d9000ef          	jal	ra,114a4 <puts>
   108d0:	550010ef          	jal	ra,11e20 <uart_wait_tx_done>
   108d4:	fe042223          	sw	zero,-28(s0)
   108d8:	fe442483          	lw	s1,-28(s0)
   108dc:	00148793          	addi	a5,s1,1
   108e0:	fef42223          	sw	a5,-28(s0)
   108e4:	4b0010ef          	jal	ra,11d94 <uart_getchar>
   108e8:	00050793          	mv	a5,a0
   108ec:	00078713          	mv	a4,a5
   108f0:	ff040793          	addi	a5,s0,-16
   108f4:	009787b3          	add	a5,a5,s1
   108f8:	fee78223          	sb	a4,-28(a5)
   108fc:	ff040793          	addi	a5,s0,-16
   10900:	009787b3          	add	a5,a5,s1
   10904:	fe47c783          	lbu	a5,-28(a5)
   10908:	00078513          	mv	a0,a5
   1090c:	e45ff0ef          	jal	ra,10750 <is_hex>
   10910:	00050793          	mv	a5,a0
   10914:	00078a63          	beqz	a5,10928 <main+0xcc>
   10918:	fe442703          	lw	a4,-28(s0)
   1091c:	01300793          	li	a5,19
   10920:	00e7c863          	blt	a5,a4,10930 <main+0xd4>
   10924:	fb5ff06f          	j	108d8 <main+0x7c>
   10928:	00000013          	nop
   1092c:	0080006f          	j	10934 <main+0xd8>
   10930:	00000013          	nop
   10934:	fc040e23          	sb	zero,-36(s0)
   10938:	fe442783          	lw	a5,-28(s0)
   1093c:	fff78793          	addi	a5,a5,-1
   10940:	ff040713          	addi	a4,s0,-16
   10944:	00f707b3          	add	a5,a4,a5
   10948:	fe47c703          	lbu	a4,-28(a5)
   1094c:	07100793          	li	a5,113
   10950:	04f70263          	beq	a4,a5,10994 <main+0x138>
   10954:	fd440793          	addi	a5,s0,-44
   10958:	00078513          	mv	a0,a5
   1095c:	124000ef          	jal	ra,10a80 <str_to_int>
   10960:	00050793          	mv	a5,a0
   10964:	fef42023          	sw	a5,-32(s0)
   10968:	fec42783          	lw	a5,-20(s0)
   1096c:	00478713          	addi	a4,a5,4
   10970:	fee42623          	sw	a4,-20(s0)
   10974:	fe042703          	lw	a4,-32(s0)
   10978:	00e7a023          	sw	a4,0(a5)
   1097c:	fe042503          	lw	a0,-32(s0)
   10980:	e49ff0ef          	jal	ra,107c8 <one_count>
   10984:	00050793          	mv	a5,a0
   10988:	00078513          	mv	a0,a5
   1098c:	44c010ef          	jal	ra,11dd8 <uart_sendchar>
   10990:	f45ff06f          	j	108d4 <main+0x78>
   10994:	00000013          	nop
   10998:	02200593          	li	a1,34
   1099c:	000127b7          	lui	a5,0x12
   109a0:	0d478513          	addi	a0,a5,212 # 120d4 <__DTOR_END__+0x3c>
   109a4:	358010ef          	jal	ra,11cfc <uart_send>
   109a8:	478010ef          	jal	ra,11e20 <uart_wait_tx_done>
   109ac:	1a1077b7          	lui	a5,0x1a107
   109b0:	00878793          	addi	a5,a5,8 # 1a107008 <_stack_start+0x1a003008>
   109b4:	0007a023          	sw	zero,0(a5)
   109b8:	08000513          	li	a0,128
   109bc:	e6dff0ef          	jal	ra,10828 <jump_and_start>
   109c0:	000127b7          	lui	a5,0x12
   109c4:	0f878513          	addi	a0,a5,248 # 120f8 <__DTOR_END__+0x60>
   109c8:	2dd000ef          	jal	ra,114a4 <puts>
   109cc:	ff5ff06f          	j	109c0 <main+0x164>

000109d0 <hex_to_string>:
   109d0:	fc010113          	addi	sp,sp,-64
   109d4:	02812e23          	sw	s0,60(sp)
   109d8:	04010413          	addi	s0,sp,64
   109dc:	fca42623          	sw	a0,-52(s0)
   109e0:	fcb42423          	sw	a1,-56(s0)
   109e4:	000127b7          	lui	a5,0x12
   109e8:	11c78793          	addi	a5,a5,284 # 1211c <__DTOR_END__+0x84>
   109ec:	0007a603          	lw	a2,0(a5)
   109f0:	0047a683          	lw	a3,4(a5)
   109f4:	0087a703          	lw	a4,8(a5)
   109f8:	00c7a783          	lw	a5,12(a5)
   109fc:	fcc42e23          	sw	a2,-36(s0)
   10a00:	fed42023          	sw	a3,-32(s0)
   10a04:	fee42223          	sw	a4,-28(s0)
   10a08:	fef42423          	sw	a5,-24(s0)
   10a0c:	fe042623          	sw	zero,-20(s0)
   10a10:	0480006f          	j	10a58 <hex_to_string+0x88>
   10a14:	00700713          	li	a4,7
   10a18:	fec42783          	lw	a5,-20(s0)
   10a1c:	40f707b3          	sub	a5,a4,a5
   10a20:	00279793          	slli	a5,a5,0x2
   10a24:	fc842703          	lw	a4,-56(s0)
   10a28:	00f757b3          	srl	a5,a4,a5
   10a2c:	00f7f713          	andi	a4,a5,15
   10a30:	fec42783          	lw	a5,-20(s0)
   10a34:	fcc42683          	lw	a3,-52(s0)
   10a38:	00f687b3          	add	a5,a3,a5
   10a3c:	ff040693          	addi	a3,s0,-16
   10a40:	00e68733          	add	a4,a3,a4
   10a44:	fec74703          	lbu	a4,-20(a4)
   10a48:	00e78023          	sb	a4,0(a5)
   10a4c:	fec42783          	lw	a5,-20(s0)
   10a50:	00178793          	addi	a5,a5,1
   10a54:	fef42623          	sw	a5,-20(s0)
   10a58:	fec42703          	lw	a4,-20(s0)
   10a5c:	00700793          	li	a5,7
   10a60:	fae7dae3          	bge	a5,a4,10a14 <hex_to_string+0x44>
   10a64:	fcc42783          	lw	a5,-52(s0)
   10a68:	00878793          	addi	a5,a5,8
   10a6c:	00078023          	sb	zero,0(a5)
   10a70:	00000013          	nop
   10a74:	03c12403          	lw	s0,60(sp)
   10a78:	04010113          	addi	sp,sp,64
   10a7c:	00008067          	ret

00010a80 <str_to_int>:
   10a80:	fd010113          	addi	sp,sp,-48
   10a84:	02812623          	sw	s0,44(sp)
   10a88:	03010413          	addi	s0,sp,48
   10a8c:	fca42e23          	sw	a0,-36(s0)
   10a90:	fe042623          	sw	zero,-20(s0)
   10a94:	fe042423          	sw	zero,-24(s0)
   10a98:	1440006f          	j	10bdc <str_to_int+0x15c>
   10a9c:	fe842783          	lw	a5,-24(s0)
   10aa0:	fdc42703          	lw	a4,-36(s0)
   10aa4:	00f707b3          	add	a5,a4,a5
   10aa8:	0007c703          	lbu	a4,0(a5)
   10aac:	03900793          	li	a5,57
   10ab0:	04e7ea63          	bltu	a5,a4,10b04 <str_to_int+0x84>
   10ab4:	fe842783          	lw	a5,-24(s0)
   10ab8:	fdc42703          	lw	a4,-36(s0)
   10abc:	00f707b3          	add	a5,a4,a5
   10ac0:	0007c703          	lbu	a4,0(a5)
   10ac4:	02f00793          	li	a5,47
   10ac8:	02e7fe63          	bgeu	a5,a4,10b04 <str_to_int+0x84>
   10acc:	fe842783          	lw	a5,-24(s0)
   10ad0:	fdc42703          	lw	a4,-36(s0)
   10ad4:	00f707b3          	add	a5,a4,a5
   10ad8:	0007c783          	lbu	a5,0(a5)
   10adc:	fd078713          	addi	a4,a5,-48
   10ae0:	00700693          	li	a3,7
   10ae4:	fe842783          	lw	a5,-24(s0)
   10ae8:	40f687b3          	sub	a5,a3,a5
   10aec:	00279793          	slli	a5,a5,0x2
   10af0:	00f717b3          	sll	a5,a4,a5
   10af4:	fec42703          	lw	a4,-20(s0)
   10af8:	00f767b3          	or	a5,a4,a5
   10afc:	fef42623          	sw	a5,-20(s0)
   10b00:	0d00006f          	j	10bd0 <str_to_int+0x150>
   10b04:	fe842783          	lw	a5,-24(s0)
   10b08:	fdc42703          	lw	a4,-36(s0)
   10b0c:	00f707b3          	add	a5,a4,a5
   10b10:	0007c703          	lbu	a4,0(a5)
   10b14:	04600793          	li	a5,70
   10b18:	04e7ea63          	bltu	a5,a4,10b6c <str_to_int+0xec>
   10b1c:	fe842783          	lw	a5,-24(s0)
   10b20:	fdc42703          	lw	a4,-36(s0)
   10b24:	00f707b3          	add	a5,a4,a5
   10b28:	0007c703          	lbu	a4,0(a5)
   10b2c:	04000793          	li	a5,64
   10b30:	02e7fe63          	bgeu	a5,a4,10b6c <str_to_int+0xec>
   10b34:	fe842783          	lw	a5,-24(s0)
   10b38:	fdc42703          	lw	a4,-36(s0)
   10b3c:	00f707b3          	add	a5,a4,a5
   10b40:	0007c783          	lbu	a5,0(a5)
   10b44:	fc978713          	addi	a4,a5,-55
   10b48:	00700693          	li	a3,7
   10b4c:	fe842783          	lw	a5,-24(s0)
   10b50:	40f687b3          	sub	a5,a3,a5
   10b54:	00279793          	slli	a5,a5,0x2
   10b58:	00f717b3          	sll	a5,a4,a5
   10b5c:	fec42703          	lw	a4,-20(s0)
   10b60:	00f767b3          	or	a5,a4,a5
   10b64:	fef42623          	sw	a5,-20(s0)
   10b68:	0680006f          	j	10bd0 <str_to_int+0x150>
   10b6c:	fe842783          	lw	a5,-24(s0)
   10b70:	fdc42703          	lw	a4,-36(s0)
   10b74:	00f707b3          	add	a5,a4,a5
   10b78:	0007c703          	lbu	a4,0(a5)
   10b7c:	06600793          	li	a5,102
   10b80:	04e7e863          	bltu	a5,a4,10bd0 <str_to_int+0x150>
   10b84:	fe842783          	lw	a5,-24(s0)
   10b88:	fdc42703          	lw	a4,-36(s0)
   10b8c:	00f707b3          	add	a5,a4,a5
   10b90:	0007c703          	lbu	a4,0(a5)
   10b94:	06000793          	li	a5,96
   10b98:	02e7fc63          	bgeu	a5,a4,10bd0 <str_to_int+0x150>
   10b9c:	fe842783          	lw	a5,-24(s0)
   10ba0:	fdc42703          	lw	a4,-36(s0)
   10ba4:	00f707b3          	add	a5,a4,a5
   10ba8:	0007c783          	lbu	a5,0(a5)
   10bac:	fa978713          	addi	a4,a5,-87
   10bb0:	00700693          	li	a3,7
   10bb4:	fe842783          	lw	a5,-24(s0)
   10bb8:	40f687b3          	sub	a5,a3,a5
   10bbc:	00279793          	slli	a5,a5,0x2
   10bc0:	00f717b3          	sll	a5,a4,a5
   10bc4:	fec42703          	lw	a4,-20(s0)
   10bc8:	00f767b3          	or	a5,a4,a5
   10bcc:	fef42623          	sw	a5,-20(s0)
   10bd0:	fe842783          	lw	a5,-24(s0)
   10bd4:	00178793          	addi	a5,a5,1
   10bd8:	fef42423          	sw	a5,-24(s0)
   10bdc:	fe842703          	lw	a4,-24(s0)
   10be0:	00700793          	li	a5,7
   10be4:	eae7dce3          	bge	a5,a4,10a9c <str_to_int+0x1c>
   10be8:	fec42783          	lw	a5,-20(s0)
   10bec:	00078513          	mv	a0,a5
   10bf0:	02c12403          	lw	s0,44(sp)
   10bf4:	03010113          	addi	sp,sp,48
   10bf8:	00008067          	ret

00010bfc <divu10>:
   10bfc:	fd010113          	addi	sp,sp,-48
   10c00:	02812623          	sw	s0,44(sp)
   10c04:	03010413          	addi	s0,sp,48
   10c08:	fca42e23          	sw	a0,-36(s0)
   10c0c:	fdc42783          	lw	a5,-36(s0)
   10c10:	0017d713          	srli	a4,a5,0x1
   10c14:	fdc42783          	lw	a5,-36(s0)
   10c18:	0027d793          	srli	a5,a5,0x2
   10c1c:	00f707b3          	add	a5,a4,a5
   10c20:	fef42623          	sw	a5,-20(s0)
   10c24:	fec42783          	lw	a5,-20(s0)
   10c28:	0047d793          	srli	a5,a5,0x4
   10c2c:	fec42703          	lw	a4,-20(s0)
   10c30:	00f707b3          	add	a5,a4,a5
   10c34:	fef42623          	sw	a5,-20(s0)
   10c38:	fec42783          	lw	a5,-20(s0)
   10c3c:	0087d793          	srli	a5,a5,0x8
   10c40:	fec42703          	lw	a4,-20(s0)
   10c44:	00f707b3          	add	a5,a4,a5
   10c48:	fef42623          	sw	a5,-20(s0)
   10c4c:	fec42783          	lw	a5,-20(s0)
   10c50:	0107d793          	srli	a5,a5,0x10
   10c54:	fec42703          	lw	a4,-20(s0)
   10c58:	00f707b3          	add	a5,a4,a5
   10c5c:	fef42623          	sw	a5,-20(s0)
   10c60:	fec42783          	lw	a5,-20(s0)
   10c64:	0037d793          	srli	a5,a5,0x3
   10c68:	fef42623          	sw	a5,-20(s0)
   10c6c:	fec42703          	lw	a4,-20(s0)
   10c70:	00070793          	mv	a5,a4
   10c74:	00279793          	slli	a5,a5,0x2
   10c78:	00e787b3          	add	a5,a5,a4
   10c7c:	00179793          	slli	a5,a5,0x1
   10c80:	00078713          	mv	a4,a5
   10c84:	fdc42783          	lw	a5,-36(s0)
   10c88:	40e787b3          	sub	a5,a5,a4
   10c8c:	fef42423          	sw	a5,-24(s0)
   10c90:	fe842783          	lw	a5,-24(s0)
   10c94:	00678793          	addi	a5,a5,6
   10c98:	0047d713          	srli	a4,a5,0x4
   10c9c:	fec42783          	lw	a5,-20(s0)
   10ca0:	00f707b3          	add	a5,a4,a5
   10ca4:	00078513          	mv	a0,a5
   10ca8:	02c12403          	lw	s0,44(sp)
   10cac:	03010113          	addi	sp,sp,48
   10cb0:	00008067          	ret

00010cb4 <remu10>:
   10cb4:	fe010113          	addi	sp,sp,-32
   10cb8:	00812e23          	sw	s0,28(sp)
   10cbc:	02010413          	addi	s0,sp,32
   10cc0:	fea42623          	sw	a0,-20(s0)
   10cc4:	fec42703          	lw	a4,-20(s0)
   10cc8:	1999a7b7          	lui	a5,0x1999a
   10ccc:	99978793          	addi	a5,a5,-1639 # 19999999 <_stack_start+0x19895999>
   10cd0:	02f70733          	mul	a4,a4,a5
   10cd4:	fec42783          	lw	a5,-20(s0)
   10cd8:	0017d793          	srli	a5,a5,0x1
   10cdc:	00f70733          	add	a4,a4,a5
   10ce0:	fec42783          	lw	a5,-20(s0)
   10ce4:	0037d793          	srli	a5,a5,0x3
   10ce8:	00f707b3          	add	a5,a4,a5
   10cec:	01c7d793          	srli	a5,a5,0x1c
   10cf0:	fef42623          	sw	a5,-20(s0)
   10cf4:	000127b7          	lui	a5,0x12
   10cf8:	1b478713          	addi	a4,a5,436 # 121b4 <remu10_table>
   10cfc:	fec42783          	lw	a5,-20(s0)
   10d00:	00f707b3          	add	a5,a4,a5
   10d04:	0007c783          	lbu	a5,0(a5)
   10d08:	00078513          	mv	a0,a5
   10d0c:	01c12403          	lw	s0,28(sp)
   10d10:	02010113          	addi	sp,sp,32
   10d14:	00008067          	ret

00010d18 <putchar>:
   10d18:	fe010113          	addi	sp,sp,-32
   10d1c:	00112e23          	sw	ra,28(sp)
   10d20:	00812c23          	sw	s0,24(sp)
   10d24:	02010413          	addi	s0,sp,32
   10d28:	fea42623          	sw	a0,-20(s0)
   10d2c:	fec42783          	lw	a5,-20(s0)
   10d30:	0ff7f793          	andi	a5,a5,255
   10d34:	00078513          	mv	a0,a5
   10d38:	0a0010ef          	jal	ra,11dd8 <uart_sendchar>
   10d3c:	fec42783          	lw	a5,-20(s0)
   10d40:	00078513          	mv	a0,a5
   10d44:	01c12083          	lw	ra,28(sp)
   10d48:	01812403          	lw	s0,24(sp)
   10d4c:	02010113          	addi	sp,sp,32
   10d50:	00008067          	ret

00010d54 <qprintchar>:
   10d54:	fe010113          	addi	sp,sp,-32
   10d58:	00112e23          	sw	ra,28(sp)
   10d5c:	00812c23          	sw	s0,24(sp)
   10d60:	02010413          	addi	s0,sp,32
   10d64:	fea42623          	sw	a0,-20(s0)
   10d68:	feb42423          	sw	a1,-24(s0)
   10d6c:	fec42783          	lw	a5,-20(s0)
   10d70:	02078863          	beqz	a5,10da0 <qprintchar+0x4c>
   10d74:	fec42783          	lw	a5,-20(s0)
   10d78:	0007a783          	lw	a5,0(a5)
   10d7c:	fe842703          	lw	a4,-24(s0)
   10d80:	0ff77713          	andi	a4,a4,255
   10d84:	00e78023          	sb	a4,0(a5)
   10d88:	fec42783          	lw	a5,-20(s0)
   10d8c:	0007a783          	lw	a5,0(a5)
   10d90:	00178713          	addi	a4,a5,1
   10d94:	fec42783          	lw	a5,-20(s0)
   10d98:	00e7a023          	sw	a4,0(a5)
   10d9c:	0140006f          	j	10db0 <qprintchar+0x5c>
   10da0:	fe842783          	lw	a5,-24(s0)
   10da4:	0ff7f793          	andi	a5,a5,255
   10da8:	00078513          	mv	a0,a5
   10dac:	f6dff0ef          	jal	ra,10d18 <putchar>
   10db0:	00000013          	nop
   10db4:	01c12083          	lw	ra,28(sp)
   10db8:	01812403          	lw	s0,24(sp)
   10dbc:	02010113          	addi	sp,sp,32
   10dc0:	00008067          	ret

00010dc4 <qprints>:
   10dc4:	fd010113          	addi	sp,sp,-48
   10dc8:	02112623          	sw	ra,44(sp)
   10dcc:	02812423          	sw	s0,40(sp)
   10dd0:	02912223          	sw	s1,36(sp)
   10dd4:	03212023          	sw	s2,32(sp)
   10dd8:	01312e23          	sw	s3,28(sp)
   10ddc:	01412c23          	sw	s4,24(sp)
   10de0:	03010413          	addi	s0,sp,48
   10de4:	fca42e23          	sw	a0,-36(s0)
   10de8:	fcb42c23          	sw	a1,-40(s0)
   10dec:	fcc42a23          	sw	a2,-44(s0)
   10df0:	fcd42823          	sw	a3,-48(s0)
   10df4:	00000493          	li	s1,0
   10df8:	02000a13          	li	s4,32
   10dfc:	fd442783          	lw	a5,-44(s0)
   10e00:	04f05663          	blez	a5,10e4c <qprints+0x88>
   10e04:	00000913          	li	s2,0
   10e08:	fd842983          	lw	s3,-40(s0)
   10e0c:	00c0006f          	j	10e18 <qprints+0x54>
   10e10:	00190913          	addi	s2,s2,1
   10e14:	00198993          	addi	s3,s3,1
   10e18:	0009c783          	lbu	a5,0(s3)
   10e1c:	fe079ae3          	bnez	a5,10e10 <qprints+0x4c>
   10e20:	fd442783          	lw	a5,-44(s0)
   10e24:	00f94663          	blt	s2,a5,10e30 <qprints+0x6c>
   10e28:	fc042a23          	sw	zero,-44(s0)
   10e2c:	0100006f          	j	10e3c <qprints+0x78>
   10e30:	fd442783          	lw	a5,-44(s0)
   10e34:	412787b3          	sub	a5,a5,s2
   10e38:	fcf42a23          	sw	a5,-44(s0)
   10e3c:	fd042783          	lw	a5,-48(s0)
   10e40:	0027f793          	andi	a5,a5,2
   10e44:	00078463          	beqz	a5,10e4c <qprints+0x88>
   10e48:	03000a13          	li	s4,48
   10e4c:	fd042783          	lw	a5,-48(s0)
   10e50:	0017f793          	andi	a5,a5,1
   10e54:	04079a63          	bnez	a5,10ea8 <qprints+0xe4>
   10e58:	0200006f          	j	10e78 <qprints+0xb4>
   10e5c:	000a0593          	mv	a1,s4
   10e60:	fdc42503          	lw	a0,-36(s0)
   10e64:	ef1ff0ef          	jal	ra,10d54 <qprintchar>
   10e68:	00148493          	addi	s1,s1,1
   10e6c:	fd442783          	lw	a5,-44(s0)
   10e70:	fff78793          	addi	a5,a5,-1
   10e74:	fcf42a23          	sw	a5,-44(s0)
   10e78:	fd442783          	lw	a5,-44(s0)
   10e7c:	fef040e3          	bgtz	a5,10e5c <qprints+0x98>
   10e80:	0280006f          	j	10ea8 <qprints+0xe4>
   10e84:	fd842783          	lw	a5,-40(s0)
   10e88:	0007c783          	lbu	a5,0(a5)
   10e8c:	00078593          	mv	a1,a5
   10e90:	fdc42503          	lw	a0,-36(s0)
   10e94:	ec1ff0ef          	jal	ra,10d54 <qprintchar>
   10e98:	00148493          	addi	s1,s1,1
   10e9c:	fd842783          	lw	a5,-40(s0)
   10ea0:	00178793          	addi	a5,a5,1
   10ea4:	fcf42c23          	sw	a5,-40(s0)
   10ea8:	fd842783          	lw	a5,-40(s0)
   10eac:	0007c783          	lbu	a5,0(a5)
   10eb0:	fc079ae3          	bnez	a5,10e84 <qprints+0xc0>
   10eb4:	0200006f          	j	10ed4 <qprints+0x110>
   10eb8:	000a0593          	mv	a1,s4
   10ebc:	fdc42503          	lw	a0,-36(s0)
   10ec0:	e95ff0ef          	jal	ra,10d54 <qprintchar>
   10ec4:	00148493          	addi	s1,s1,1
   10ec8:	fd442783          	lw	a5,-44(s0)
   10ecc:	fff78793          	addi	a5,a5,-1
   10ed0:	fcf42a23          	sw	a5,-44(s0)
   10ed4:	fd442783          	lw	a5,-44(s0)
   10ed8:	fef040e3          	bgtz	a5,10eb8 <qprints+0xf4>
   10edc:	00048793          	mv	a5,s1
   10ee0:	00078513          	mv	a0,a5
   10ee4:	02c12083          	lw	ra,44(sp)
   10ee8:	02812403          	lw	s0,40(sp)
   10eec:	02412483          	lw	s1,36(sp)
   10ef0:	02012903          	lw	s2,32(sp)
   10ef4:	01c12983          	lw	s3,28(sp)
   10ef8:	01812a03          	lw	s4,24(sp)
   10efc:	03010113          	addi	sp,sp,48
   10f00:	00008067          	ret

00010f04 <qprinti>:
   10f04:	f9010113          	addi	sp,sp,-112
   10f08:	06112623          	sw	ra,108(sp)
   10f0c:	06812423          	sw	s0,104(sp)
   10f10:	06912223          	sw	s1,100(sp)
   10f14:	07212023          	sw	s2,96(sp)
   10f18:	05312e23          	sw	s3,92(sp)
   10f1c:	07010413          	addi	s0,sp,112
   10f20:	faa42623          	sw	a0,-84(s0)
   10f24:	fab42423          	sw	a1,-88(s0)
   10f28:	fac42223          	sw	a2,-92(s0)
   10f2c:	fad42023          	sw	a3,-96(s0)
   10f30:	f8e42e23          	sw	a4,-100(s0)
   10f34:	f8f42c23          	sw	a5,-104(s0)
   10f38:	00080793          	mv	a5,a6
   10f3c:	f8f40ba3          	sb	a5,-105(s0)
   10f40:	00000993          	li	s3,0
   10f44:	00000913          	li	s2,0
   10f48:	fa842783          	lw	a5,-88(s0)
   10f4c:	fcf42e23          	sw	a5,-36(s0)
   10f50:	fa842783          	lw	a5,-88(s0)
   10f54:	02079863          	bnez	a5,10f84 <qprinti+0x80>
   10f58:	03000793          	li	a5,48
   10f5c:	faf40c23          	sb	a5,-72(s0)
   10f60:	fa040ca3          	sb	zero,-71(s0)
   10f64:	fb840793          	addi	a5,s0,-72
   10f68:	f9842683          	lw	a3,-104(s0)
   10f6c:	f9c42603          	lw	a2,-100(s0)
   10f70:	00078593          	mv	a1,a5
   10f74:	fac42503          	lw	a0,-84(s0)
   10f78:	e4dff0ef          	jal	ra,10dc4 <qprints>
   10f7c:	00050793          	mv	a5,a0
   10f80:	13c0006f          	j	110bc <qprinti+0x1b8>
   10f84:	fa042783          	lw	a5,-96(s0)
   10f88:	02078463          	beqz	a5,10fb0 <qprinti+0xac>
   10f8c:	fa442703          	lw	a4,-92(s0)
   10f90:	00a00793          	li	a5,10
   10f94:	00f71e63          	bne	a4,a5,10fb0 <qprinti+0xac>
   10f98:	fa842783          	lw	a5,-88(s0)
   10f9c:	0007da63          	bgez	a5,10fb0 <qprinti+0xac>
   10fa0:	00100993          	li	s3,1
   10fa4:	fa842783          	lw	a5,-88(s0)
   10fa8:	40f007b3          	neg	a5,a5
   10fac:	fcf42e23          	sw	a5,-36(s0)
   10fb0:	fb840493          	addi	s1,s0,-72
   10fb4:	01f48493          	addi	s1,s1,31
   10fb8:	00048023          	sb	zero,0(s1)
   10fbc:	fa442703          	lw	a4,-92(s0)
   10fc0:	01000793          	li	a5,16
   10fc4:	08f71863          	bne	a4,a5,11054 <qprinti+0x150>
   10fc8:	0540006f          	j	1101c <qprinti+0x118>
   10fcc:	fdc42783          	lw	a5,-36(s0)
   10fd0:	00f7f793          	andi	a5,a5,15
   10fd4:	fcf42c23          	sw	a5,-40(s0)
   10fd8:	fd842703          	lw	a4,-40(s0)
   10fdc:	00900793          	li	a5,9
   10fe0:	00e7dc63          	bge	a5,a4,10ff8 <qprinti+0xf4>
   10fe4:	f9744783          	lbu	a5,-105(s0)
   10fe8:	fc678793          	addi	a5,a5,-58
   10fec:	fd842703          	lw	a4,-40(s0)
   10ff0:	00f707b3          	add	a5,a4,a5
   10ff4:	fcf42c23          	sw	a5,-40(s0)
   10ff8:	fd842783          	lw	a5,-40(s0)
   10ffc:	0ff7f793          	andi	a5,a5,255
   11000:	fff48493          	addi	s1,s1,-1
   11004:	03078793          	addi	a5,a5,48
   11008:	0ff7f793          	andi	a5,a5,255
   1100c:	00f48023          	sb	a5,0(s1)
   11010:	fdc42783          	lw	a5,-36(s0)
   11014:	0047d793          	srli	a5,a5,0x4
   11018:	fcf42e23          	sw	a5,-36(s0)
   1101c:	fdc42783          	lw	a5,-36(s0)
   11020:	fa0796e3          	bnez	a5,10fcc <qprinti+0xc8>
   11024:	0380006f          	j	1105c <qprinti+0x158>
   11028:	fdc42503          	lw	a0,-36(s0)
   1102c:	c89ff0ef          	jal	ra,10cb4 <remu10>
   11030:	00050793          	mv	a5,a0
   11034:	0ff7f793          	andi	a5,a5,255
   11038:	fff48493          	addi	s1,s1,-1
   1103c:	03078793          	addi	a5,a5,48
   11040:	0ff7f793          	andi	a5,a5,255
   11044:	00f48023          	sb	a5,0(s1)
   11048:	fdc42503          	lw	a0,-36(s0)
   1104c:	bb1ff0ef          	jal	ra,10bfc <divu10>
   11050:	fca42e23          	sw	a0,-36(s0)
   11054:	fdc42783          	lw	a5,-36(s0)
   11058:	fc0798e3          	bnez	a5,11028 <qprinti+0x124>
   1105c:	04098263          	beqz	s3,110a0 <qprinti+0x19c>
   11060:	f9c42783          	lw	a5,-100(s0)
   11064:	02078863          	beqz	a5,11094 <qprinti+0x190>
   11068:	f9842783          	lw	a5,-104(s0)
   1106c:	0027f793          	andi	a5,a5,2
   11070:	02078263          	beqz	a5,11094 <qprinti+0x190>
   11074:	02d00593          	li	a1,45
   11078:	fac42503          	lw	a0,-84(s0)
   1107c:	cd9ff0ef          	jal	ra,10d54 <qprintchar>
   11080:	00190913          	addi	s2,s2,1
   11084:	f9c42783          	lw	a5,-100(s0)
   11088:	fff78793          	addi	a5,a5,-1
   1108c:	f8f42e23          	sw	a5,-100(s0)
   11090:	0100006f          	j	110a0 <qprinti+0x19c>
   11094:	fff48493          	addi	s1,s1,-1
   11098:	02d00793          	li	a5,45
   1109c:	00f48023          	sb	a5,0(s1)
   110a0:	f9842683          	lw	a3,-104(s0)
   110a4:	f9c42603          	lw	a2,-100(s0)
   110a8:	00048593          	mv	a1,s1
   110ac:	fac42503          	lw	a0,-84(s0)
   110b0:	d15ff0ef          	jal	ra,10dc4 <qprints>
   110b4:	00050793          	mv	a5,a0
   110b8:	00f907b3          	add	a5,s2,a5
   110bc:	00078513          	mv	a0,a5
   110c0:	06c12083          	lw	ra,108(sp)
   110c4:	06812403          	lw	s0,104(sp)
   110c8:	06412483          	lw	s1,100(sp)
   110cc:	06012903          	lw	s2,96(sp)
   110d0:	05c12983          	lw	s3,92(sp)
   110d4:	07010113          	addi	sp,sp,112
   110d8:	00008067          	ret

000110dc <qprint>:
   110dc:	fc010113          	addi	sp,sp,-64
   110e0:	02112e23          	sw	ra,60(sp)
   110e4:	02812c23          	sw	s0,56(sp)
   110e8:	02912a23          	sw	s1,52(sp)
   110ec:	03212823          	sw	s2,48(sp)
   110f0:	03312623          	sw	s3,44(sp)
   110f4:	04010413          	addi	s0,sp,64
   110f8:	fca42623          	sw	a0,-52(s0)
   110fc:	fcb42423          	sw	a1,-56(s0)
   11100:	fcc42223          	sw	a2,-60(s0)
   11104:	00000493          	li	s1,0
   11108:	2dc0006f          	j	113e4 <qprint+0x308>
   1110c:	fc842783          	lw	a5,-56(s0)
   11110:	0007c703          	lbu	a4,0(a5)
   11114:	02500793          	li	a5,37
   11118:	28f71e63          	bne	a4,a5,113b4 <qprint+0x2d8>
   1111c:	fc842783          	lw	a5,-56(s0)
   11120:	00178793          	addi	a5,a5,1
   11124:	fcf42423          	sw	a5,-56(s0)
   11128:	00000993          	li	s3,0
   1112c:	00098913          	mv	s2,s3
   11130:	fc842783          	lw	a5,-56(s0)
   11134:	0007c783          	lbu	a5,0(a5)
   11138:	2a078e63          	beqz	a5,113f4 <qprint+0x318>
   1113c:	fc842783          	lw	a5,-56(s0)
   11140:	0007c703          	lbu	a4,0(a5)
   11144:	02500793          	li	a5,37
   11148:	26f70a63          	beq	a4,a5,113bc <qprint+0x2e0>
   1114c:	fc842783          	lw	a5,-56(s0)
   11150:	0007c703          	lbu	a4,0(a5)
   11154:	02d00793          	li	a5,45
   11158:	02f71463          	bne	a4,a5,11180 <qprint+0xa4>
   1115c:	fc842783          	lw	a5,-56(s0)
   11160:	00178793          	addi	a5,a5,1
   11164:	fcf42423          	sw	a5,-56(s0)
   11168:	00100993          	li	s3,1
   1116c:	0140006f          	j	11180 <qprint+0xa4>
   11170:	fc842783          	lw	a5,-56(s0)
   11174:	00178793          	addi	a5,a5,1
   11178:	fcf42423          	sw	a5,-56(s0)
   1117c:	0029e993          	ori	s3,s3,2
   11180:	fc842783          	lw	a5,-56(s0)
   11184:	0007c703          	lbu	a4,0(a5)
   11188:	03000793          	li	a5,48
   1118c:	fef702e3          	beq	a4,a5,11170 <qprint+0x94>
   11190:	0340006f          	j	111c4 <qprint+0xe8>
   11194:	00090793          	mv	a5,s2
   11198:	00279793          	slli	a5,a5,0x2
   1119c:	012787b3          	add	a5,a5,s2
   111a0:	00179793          	slli	a5,a5,0x1
   111a4:	00078913          	mv	s2,a5
   111a8:	fc842783          	lw	a5,-56(s0)
   111ac:	0007c783          	lbu	a5,0(a5)
   111b0:	fd078793          	addi	a5,a5,-48
   111b4:	00f90933          	add	s2,s2,a5
   111b8:	fc842783          	lw	a5,-56(s0)
   111bc:	00178793          	addi	a5,a5,1
   111c0:	fcf42423          	sw	a5,-56(s0)
   111c4:	fc842783          	lw	a5,-56(s0)
   111c8:	0007c703          	lbu	a4,0(a5)
   111cc:	02f00793          	li	a5,47
   111d0:	00e7fa63          	bgeu	a5,a4,111e4 <qprint+0x108>
   111d4:	fc842783          	lw	a5,-56(s0)
   111d8:	0007c703          	lbu	a4,0(a5)
   111dc:	03900793          	li	a5,57
   111e0:	fae7fae3          	bgeu	a5,a4,11194 <qprint+0xb8>
   111e4:	fc842783          	lw	a5,-56(s0)
   111e8:	0007c703          	lbu	a4,0(a5)
   111ec:	07300793          	li	a5,115
   111f0:	04f71463          	bne	a4,a5,11238 <qprint+0x15c>
   111f4:	fc442783          	lw	a5,-60(s0)
   111f8:	00478713          	addi	a4,a5,4
   111fc:	fce42223          	sw	a4,-60(s0)
   11200:	0007a083          	lw	ra,0(a5)
   11204:	00008663          	beqz	ra,11210 <qprint+0x134>
   11208:	00008793          	mv	a5,ra
   1120c:	00c0006f          	j	11218 <qprint+0x13c>
   11210:	000127b7          	lui	a5,0x12
   11214:	12c78793          	addi	a5,a5,300 # 1212c <__DTOR_END__+0x94>
   11218:	00098693          	mv	a3,s3
   1121c:	00090613          	mv	a2,s2
   11220:	00078593          	mv	a1,a5
   11224:	fcc42503          	lw	a0,-52(s0)
   11228:	b9dff0ef          	jal	ra,10dc4 <qprints>
   1122c:	00050793          	mv	a5,a0
   11230:	00f484b3          	add	s1,s1,a5
   11234:	1a40006f          	j	113d8 <qprint+0x2fc>
   11238:	fc842783          	lw	a5,-56(s0)
   1123c:	0007c703          	lbu	a4,0(a5)
   11240:	06400793          	li	a5,100
   11244:	02f71e63          	bne	a4,a5,11280 <qprint+0x1a4>
   11248:	fc442783          	lw	a5,-60(s0)
   1124c:	00478713          	addi	a4,a5,4
   11250:	fce42223          	sw	a4,-60(s0)
   11254:	0007a583          	lw	a1,0(a5)
   11258:	06100813          	li	a6,97
   1125c:	00098793          	mv	a5,s3
   11260:	00090713          	mv	a4,s2
   11264:	00100693          	li	a3,1
   11268:	00a00613          	li	a2,10
   1126c:	fcc42503          	lw	a0,-52(s0)
   11270:	c95ff0ef          	jal	ra,10f04 <qprinti>
   11274:	00050793          	mv	a5,a0
   11278:	00f484b3          	add	s1,s1,a5
   1127c:	15c0006f          	j	113d8 <qprint+0x2fc>
   11280:	fc842783          	lw	a5,-56(s0)
   11284:	0007c703          	lbu	a4,0(a5)
   11288:	07500793          	li	a5,117
   1128c:	04f71063          	bne	a4,a5,112cc <qprint+0x1f0>
   11290:	fc442783          	lw	a5,-60(s0)
   11294:	00478713          	addi	a4,a5,4
   11298:	fce42223          	sw	a4,-60(s0)
   1129c:	0007a783          	lw	a5,0(a5)
   112a0:	00078593          	mv	a1,a5
   112a4:	06100813          	li	a6,97
   112a8:	00098793          	mv	a5,s3
   112ac:	00090713          	mv	a4,s2
   112b0:	00000693          	li	a3,0
   112b4:	00a00613          	li	a2,10
   112b8:	fcc42503          	lw	a0,-52(s0)
   112bc:	c49ff0ef          	jal	ra,10f04 <qprinti>
   112c0:	00050793          	mv	a5,a0
   112c4:	00f484b3          	add	s1,s1,a5
   112c8:	1100006f          	j	113d8 <qprint+0x2fc>
   112cc:	fc842783          	lw	a5,-56(s0)
   112d0:	0007c703          	lbu	a4,0(a5)
   112d4:	07800793          	li	a5,120
   112d8:	04f71063          	bne	a4,a5,11318 <qprint+0x23c>
   112dc:	fc442783          	lw	a5,-60(s0)
   112e0:	00478713          	addi	a4,a5,4
   112e4:	fce42223          	sw	a4,-60(s0)
   112e8:	0007a783          	lw	a5,0(a5)
   112ec:	00078593          	mv	a1,a5
   112f0:	06100813          	li	a6,97
   112f4:	00098793          	mv	a5,s3
   112f8:	00090713          	mv	a4,s2
   112fc:	00000693          	li	a3,0
   11300:	01000613          	li	a2,16
   11304:	fcc42503          	lw	a0,-52(s0)
   11308:	bfdff0ef          	jal	ra,10f04 <qprinti>
   1130c:	00050793          	mv	a5,a0
   11310:	00f484b3          	add	s1,s1,a5
   11314:	0c40006f          	j	113d8 <qprint+0x2fc>
   11318:	fc842783          	lw	a5,-56(s0)
   1131c:	0007c703          	lbu	a4,0(a5)
   11320:	05800793          	li	a5,88
   11324:	04f71063          	bne	a4,a5,11364 <qprint+0x288>
   11328:	fc442783          	lw	a5,-60(s0)
   1132c:	00478713          	addi	a4,a5,4
   11330:	fce42223          	sw	a4,-60(s0)
   11334:	0007a783          	lw	a5,0(a5)
   11338:	00078593          	mv	a1,a5
   1133c:	04100813          	li	a6,65
   11340:	00098793          	mv	a5,s3
   11344:	00090713          	mv	a4,s2
   11348:	00000693          	li	a3,0
   1134c:	01000613          	li	a2,16
   11350:	fcc42503          	lw	a0,-52(s0)
   11354:	bb1ff0ef          	jal	ra,10f04 <qprinti>
   11358:	00050793          	mv	a5,a0
   1135c:	00f484b3          	add	s1,s1,a5
   11360:	0780006f          	j	113d8 <qprint+0x2fc>
   11364:	fc842783          	lw	a5,-56(s0)
   11368:	0007c703          	lbu	a4,0(a5)
   1136c:	06300793          	li	a5,99
   11370:	06f71463          	bne	a4,a5,113d8 <qprint+0x2fc>
   11374:	fc442783          	lw	a5,-60(s0)
   11378:	00478713          	addi	a4,a5,4
   1137c:	fce42223          	sw	a4,-60(s0)
   11380:	0007a783          	lw	a5,0(a5)
   11384:	0ff7f793          	andi	a5,a5,255
   11388:	fcf40e23          	sb	a5,-36(s0)
   1138c:	fc040ea3          	sb	zero,-35(s0)
   11390:	fdc40793          	addi	a5,s0,-36
   11394:	00098693          	mv	a3,s3
   11398:	00090613          	mv	a2,s2
   1139c:	00078593          	mv	a1,a5
   113a0:	fcc42503          	lw	a0,-52(s0)
   113a4:	a21ff0ef          	jal	ra,10dc4 <qprints>
   113a8:	00050793          	mv	a5,a0
   113ac:	00f484b3          	add	s1,s1,a5
   113b0:	0280006f          	j	113d8 <qprint+0x2fc>
   113b4:	00000013          	nop
   113b8:	0080006f          	j	113c0 <qprint+0x2e4>
   113bc:	00000013          	nop
   113c0:	fc842783          	lw	a5,-56(s0)
   113c4:	0007c783          	lbu	a5,0(a5)
   113c8:	00078593          	mv	a1,a5
   113cc:	fcc42503          	lw	a0,-52(s0)
   113d0:	985ff0ef          	jal	ra,10d54 <qprintchar>
   113d4:	00148493          	addi	s1,s1,1
   113d8:	fc842783          	lw	a5,-56(s0)
   113dc:	00178793          	addi	a5,a5,1
   113e0:	fcf42423          	sw	a5,-56(s0)
   113e4:	fc842783          	lw	a5,-56(s0)
   113e8:	0007c783          	lbu	a5,0(a5)
   113ec:	d20790e3          	bnez	a5,1110c <qprint+0x30>
   113f0:	0080006f          	j	113f8 <qprint+0x31c>
   113f4:	00000013          	nop
   113f8:	fcc42783          	lw	a5,-52(s0)
   113fc:	00078863          	beqz	a5,1140c <qprint+0x330>
   11400:	fcc42783          	lw	a5,-52(s0)
   11404:	0007a783          	lw	a5,0(a5)
   11408:	00078023          	sb	zero,0(a5)
   1140c:	00048793          	mv	a5,s1
   11410:	00078513          	mv	a0,a5
   11414:	03c12083          	lw	ra,60(sp)
   11418:	03812403          	lw	s0,56(sp)
   1141c:	03412483          	lw	s1,52(sp)
   11420:	03012903          	lw	s2,48(sp)
   11424:	02c12983          	lw	s3,44(sp)
   11428:	04010113          	addi	sp,sp,64
   1142c:	00008067          	ret

00011430 <printf>:
   11430:	fb010113          	addi	sp,sp,-80
   11434:	02112623          	sw	ra,44(sp)
   11438:	02812423          	sw	s0,40(sp)
   1143c:	03010413          	addi	s0,sp,48
   11440:	fca42e23          	sw	a0,-36(s0)
   11444:	00b42223          	sw	a1,4(s0)
   11448:	00c42423          	sw	a2,8(s0)
   1144c:	00d42623          	sw	a3,12(s0)
   11450:	00e42823          	sw	a4,16(s0)
   11454:	00f42a23          	sw	a5,20(s0)
   11458:	01042c23          	sw	a6,24(s0)
   1145c:	01142e23          	sw	a7,28(s0)
   11460:	02040793          	addi	a5,s0,32
   11464:	fcf42c23          	sw	a5,-40(s0)
   11468:	fd842783          	lw	a5,-40(s0)
   1146c:	fe478793          	addi	a5,a5,-28
   11470:	fef42423          	sw	a5,-24(s0)
   11474:	fe842783          	lw	a5,-24(s0)
   11478:	00078613          	mv	a2,a5
   1147c:	fdc42583          	lw	a1,-36(s0)
   11480:	00000513          	li	a0,0
   11484:	c59ff0ef          	jal	ra,110dc <qprint>
   11488:	fea42623          	sw	a0,-20(s0)
   1148c:	fec42783          	lw	a5,-20(s0)
   11490:	00078513          	mv	a0,a5
   11494:	02c12083          	lw	ra,44(sp)
   11498:	02812403          	lw	s0,40(sp)
   1149c:	05010113          	addi	sp,sp,80
   114a0:	00008067          	ret

000114a4 <puts>:
   114a4:	fd010113          	addi	sp,sp,-48
   114a8:	02112623          	sw	ra,44(sp)
   114ac:	02812423          	sw	s0,40(sp)
   114b0:	03010413          	addi	s0,sp,48
   114b4:	fca42e23          	sw	a0,-36(s0)
   114b8:	fe042623          	sw	zero,-20(s0)
   114bc:	0280006f          	j	114e4 <puts+0x40>
   114c0:	fec42783          	lw	a5,-20(s0)
   114c4:	00178713          	addi	a4,a5,1
   114c8:	fee42623          	sw	a4,-20(s0)
   114cc:	00078713          	mv	a4,a5
   114d0:	fdc42783          	lw	a5,-36(s0)
   114d4:	00e787b3          	add	a5,a5,a4
   114d8:	0007c783          	lbu	a5,0(a5)
   114dc:	00078513          	mv	a0,a5
   114e0:	839ff0ef          	jal	ra,10d18 <putchar>
   114e4:	fec42783          	lw	a5,-20(s0)
   114e8:	fdc42703          	lw	a4,-36(s0)
   114ec:	00f707b3          	add	a5,a4,a5
   114f0:	0007c783          	lbu	a5,0(a5)
   114f4:	fc0796e3          	bnez	a5,114c0 <puts+0x1c>
   114f8:	00a00513          	li	a0,10
   114fc:	81dff0ef          	jal	ra,10d18 <putchar>
   11500:	fec42783          	lw	a5,-20(s0)
   11504:	00078513          	mv	a0,a5
   11508:	02c12083          	lw	ra,44(sp)
   1150c:	02812403          	lw	s0,40(sp)
   11510:	03010113          	addi	sp,sp,48
   11514:	00008067          	ret

00011518 <strcmp>:
   11518:	fd010113          	addi	sp,sp,-48
   1151c:	02812623          	sw	s0,44(sp)
   11520:	03010413          	addi	s0,sp,48
   11524:	fca42e23          	sw	a0,-36(s0)
   11528:	fcb42c23          	sw	a1,-40(s0)
   1152c:	fdc42703          	lw	a4,-36(s0)
   11530:	fd842783          	lw	a5,-40(s0)
   11534:	00f767b3          	or	a5,a4,a5
   11538:	0037f793          	andi	a5,a5,3
   1153c:	0a079663          	bnez	a5,115e8 <strcmp+0xd0>
   11540:	fdc42783          	lw	a5,-36(s0)
   11544:	fef42623          	sw	a5,-20(s0)
   11548:	fd842783          	lw	a5,-40(s0)
   1154c:	fef42423          	sw	a5,-24(s0)
   11550:	0580006f          	j	115a8 <strcmp+0x90>
   11554:	fec42783          	lw	a5,-20(s0)
   11558:	0007a703          	lw	a4,0(a5)
   1155c:	feff07b7          	lui	a5,0xfeff0
   11560:	eff78793          	addi	a5,a5,-257 # fefefeff <_stack_start+0xfeeebeff>
   11564:	00f70733          	add	a4,a4,a5
   11568:	fec42783          	lw	a5,-20(s0)
   1156c:	0007a783          	lw	a5,0(a5)
   11570:	fff7c793          	not	a5,a5
   11574:	00f77733          	and	a4,a4,a5
   11578:	808087b7          	lui	a5,0x80808
   1157c:	08078793          	addi	a5,a5,128 # 80808080 <_stack_start+0x80704080>
   11580:	00f777b3          	and	a5,a4,a5
   11584:	00078663          	beqz	a5,11590 <strcmp+0x78>
   11588:	00000793          	li	a5,0
   1158c:	0940006f          	j	11620 <strcmp+0x108>
   11590:	fec42783          	lw	a5,-20(s0)
   11594:	00478793          	addi	a5,a5,4
   11598:	fef42623          	sw	a5,-20(s0)
   1159c:	fe842783          	lw	a5,-24(s0)
   115a0:	00478793          	addi	a5,a5,4
   115a4:	fef42423          	sw	a5,-24(s0)
   115a8:	fec42783          	lw	a5,-20(s0)
   115ac:	0007a703          	lw	a4,0(a5)
   115b0:	fe842783          	lw	a5,-24(s0)
   115b4:	0007a783          	lw	a5,0(a5)
   115b8:	f8f70ee3          	beq	a4,a5,11554 <strcmp+0x3c>
   115bc:	fec42783          	lw	a5,-20(s0)
   115c0:	fcf42e23          	sw	a5,-36(s0)
   115c4:	fe842783          	lw	a5,-24(s0)
   115c8:	fcf42c23          	sw	a5,-40(s0)
   115cc:	01c0006f          	j	115e8 <strcmp+0xd0>
   115d0:	fdc42783          	lw	a5,-36(s0)
   115d4:	00178793          	addi	a5,a5,1
   115d8:	fcf42e23          	sw	a5,-36(s0)
   115dc:	fd842783          	lw	a5,-40(s0)
   115e0:	00178793          	addi	a5,a5,1
   115e4:	fcf42c23          	sw	a5,-40(s0)
   115e8:	fdc42783          	lw	a5,-36(s0)
   115ec:	0007c783          	lbu	a5,0(a5)
   115f0:	00078c63          	beqz	a5,11608 <strcmp+0xf0>
   115f4:	fdc42783          	lw	a5,-36(s0)
   115f8:	0007c703          	lbu	a4,0(a5)
   115fc:	fd842783          	lw	a5,-40(s0)
   11600:	0007c783          	lbu	a5,0(a5)
   11604:	fcf706e3          	beq	a4,a5,115d0 <strcmp+0xb8>
   11608:	fdc42783          	lw	a5,-36(s0)
   1160c:	0007c783          	lbu	a5,0(a5)
   11610:	00078713          	mv	a4,a5
   11614:	fd842783          	lw	a5,-40(s0)
   11618:	0007c783          	lbu	a5,0(a5)
   1161c:	40f707b3          	sub	a5,a4,a5
   11620:	00078513          	mv	a0,a5
   11624:	02c12403          	lw	s0,44(sp)
   11628:	03010113          	addi	sp,sp,48
   1162c:	00008067          	ret

00011630 <memset>:
   11630:	fd010113          	addi	sp,sp,-48
   11634:	02812623          	sw	s0,44(sp)
   11638:	03010413          	addi	s0,sp,48
   1163c:	fca42e23          	sw	a0,-36(s0)
   11640:	fcb42c23          	sw	a1,-40(s0)
   11644:	fcc42a23          	sw	a2,-44(s0)
   11648:	fdc42783          	lw	a5,-36(s0)
   1164c:	fef42623          	sw	a5,-20(s0)
   11650:	0280006f          	j	11678 <memset+0x48>
   11654:	fec42783          	lw	a5,-20(s0)
   11658:	00178713          	addi	a4,a5,1
   1165c:	fee42623          	sw	a4,-20(s0)
   11660:	fd842703          	lw	a4,-40(s0)
   11664:	0ff77713          	andi	a4,a4,255
   11668:	00e78023          	sb	a4,0(a5)
   1166c:	fd442783          	lw	a5,-44(s0)
   11670:	fff78793          	addi	a5,a5,-1
   11674:	fcf42a23          	sw	a5,-44(s0)
   11678:	fd442783          	lw	a5,-44(s0)
   1167c:	fc079ce3          	bnez	a5,11654 <memset+0x24>
   11680:	fdc42783          	lw	a5,-36(s0)
   11684:	00078513          	mv	a0,a5
   11688:	02c12403          	lw	s0,44(sp)
   1168c:	03010113          	addi	sp,sp,48
   11690:	00008067          	ret

00011694 <strcpy>:
   11694:	fd010113          	addi	sp,sp,-48
   11698:	02812623          	sw	s0,44(sp)
   1169c:	03010413          	addi	s0,sp,48
   116a0:	fca42e23          	sw	a0,-36(s0)
   116a4:	fcb42c23          	sw	a1,-40(s0)
   116a8:	fdc42783          	lw	a5,-36(s0)
   116ac:	fef42623          	sw	a5,-20(s0)
   116b0:	fd842783          	lw	a5,-40(s0)
   116b4:	fef42423          	sw	a5,-24(s0)
   116b8:	02c0006f          	j	116e4 <strcpy+0x50>
   116bc:	fe842783          	lw	a5,-24(s0)
   116c0:	0007c703          	lbu	a4,0(a5)
   116c4:	fec42783          	lw	a5,-20(s0)
   116c8:	00e78023          	sb	a4,0(a5)
   116cc:	fec42783          	lw	a5,-20(s0)
   116d0:	00178793          	addi	a5,a5,1
   116d4:	fef42623          	sw	a5,-20(s0)
   116d8:	fe842783          	lw	a5,-24(s0)
   116dc:	00178793          	addi	a5,a5,1
   116e0:	fef42423          	sw	a5,-24(s0)
   116e4:	fe842783          	lw	a5,-24(s0)
   116e8:	0007c783          	lbu	a5,0(a5)
   116ec:	fc0798e3          	bnez	a5,116bc <strcpy+0x28>
   116f0:	fdc42783          	lw	a5,-36(s0)
   116f4:	00078513          	mv	a0,a5
   116f8:	02c12403          	lw	s0,44(sp)
   116fc:	03010113          	addi	sp,sp,48
   11700:	00008067          	ret

00011704 <strlen>:
   11704:	fd010113          	addi	sp,sp,-48
   11708:	02812623          	sw	s0,44(sp)
   1170c:	03010413          	addi	s0,sp,48
   11710:	fca42e23          	sw	a0,-36(s0)
   11714:	fdc42783          	lw	a5,-36(s0)
   11718:	fef42623          	sw	a5,-20(s0)
   1171c:	fe042423          	sw	zero,-24(s0)
   11720:	fec42783          	lw	a5,-20(s0)
   11724:	00079c63          	bnez	a5,1173c <strlen+0x38>
   11728:	00000793          	li	a5,0
   1172c:	0280006f          	j	11754 <strlen+0x50>
   11730:	fe842783          	lw	a5,-24(s0)
   11734:	00178793          	addi	a5,a5,1
   11738:	fef42423          	sw	a5,-24(s0)
   1173c:	fec42783          	lw	a5,-20(s0)
   11740:	00178713          	addi	a4,a5,1
   11744:	fee42623          	sw	a4,-20(s0)
   11748:	0007c783          	lbu	a5,0(a5)
   1174c:	fe0792e3          	bnez	a5,11730 <strlen+0x2c>
   11750:	fe842783          	lw	a5,-24(s0)
   11754:	00078513          	mv	a0,a5
   11758:	02c12403          	lw	s0,44(sp)
   1175c:	03010113          	addi	sp,sp,48
   11760:	00008067          	ret

00011764 <spi_setup_slave>:
   11764:	ff010113          	addi	sp,sp,-16
   11768:	00112623          	sw	ra,12(sp)
   1176c:	00812423          	sw	s0,8(sp)
   11770:	01010413          	addi	s0,sp,16
   11774:	00000593          	li	a1,0
   11778:	00400513          	li	a0,4
   1177c:	b59fe0ef          	jal	ra,102d4 <set_pin_function>
   11780:	00000593          	li	a1,0
   11784:	00500513          	li	a0,5
   11788:	b4dfe0ef          	jal	ra,102d4 <set_pin_function>
   1178c:	00000593          	li	a1,0
   11790:	00600513          	li	a0,6
   11794:	b41fe0ef          	jal	ra,102d4 <set_pin_function>
   11798:	00000593          	li	a1,0
   1179c:	00700513          	li	a0,7
   117a0:	b35fe0ef          	jal	ra,102d4 <set_pin_function>
   117a4:	00000593          	li	a1,0
   117a8:	00300513          	li	a0,3
   117ac:	b29fe0ef          	jal	ra,102d4 <set_pin_function>
   117b0:	00000013          	nop
   117b4:	00c12083          	lw	ra,12(sp)
   117b8:	00812403          	lw	s0,8(sp)
   117bc:	01010113          	addi	sp,sp,16
   117c0:	00008067          	ret

000117c4 <spi_setup_master>:
   117c4:	fe010113          	addi	sp,sp,-32
   117c8:	00112e23          	sw	ra,28(sp)
   117cc:	00812c23          	sw	s0,24(sp)
   117d0:	02010413          	addi	s0,sp,32
   117d4:	fea42623          	sw	a0,-20(s0)
   117d8:	00000593          	li	a1,0
   117dc:	00f00513          	li	a0,15
   117e0:	af5fe0ef          	jal	ra,102d4 <set_pin_function>
   117e4:	00000593          	li	a1,0
   117e8:	00e00513          	li	a0,14
   117ec:	ae9fe0ef          	jal	ra,102d4 <set_pin_function>
   117f0:	00000593          	li	a1,0
   117f4:	00d00513          	li	a0,13
   117f8:	addfe0ef          	jal	ra,102d4 <set_pin_function>
   117fc:	00000593          	li	a1,0
   11800:	00c00513          	li	a0,12
   11804:	ad1fe0ef          	jal	ra,102d4 <set_pin_function>
   11808:	fec42783          	lw	a5,-20(s0)
   1180c:	00f05863          	blez	a5,1181c <spi_setup_master+0x58>
   11810:	00000593          	li	a1,0
   11814:	01000513          	li	a0,16
   11818:	abdfe0ef          	jal	ra,102d4 <set_pin_function>
   1181c:	fec42703          	lw	a4,-20(s0)
   11820:	00100793          	li	a5,1
   11824:	00e7d863          	bge	a5,a4,11834 <spi_setup_master+0x70>
   11828:	00000593          	li	a1,0
   1182c:	00b00513          	li	a0,11
   11830:	aa5fe0ef          	jal	ra,102d4 <set_pin_function>
   11834:	fec42703          	lw	a4,-20(s0)
   11838:	00200793          	li	a5,2
   1183c:	00e7d863          	bge	a5,a4,1184c <spi_setup_master+0x88>
   11840:	00000593          	li	a1,0
   11844:	00000513          	li	a0,0
   11848:	a8dfe0ef          	jal	ra,102d4 <set_pin_function>
   1184c:	fec42703          	lw	a4,-20(s0)
   11850:	00300793          	li	a5,3
   11854:	00e7d863          	bge	a5,a4,11864 <spi_setup_master+0xa0>
   11858:	00000593          	li	a1,0
   1185c:	00100513          	li	a0,1
   11860:	a75fe0ef          	jal	ra,102d4 <set_pin_function>
   11864:	00000013          	nop
   11868:	01c12083          	lw	ra,28(sp)
   1186c:	01812403          	lw	s0,24(sp)
   11870:	02010113          	addi	sp,sp,32
   11874:	00008067          	ret

00011878 <spi_setup_cmd_addr>:
   11878:	fd010113          	addi	sp,sp,-48
   1187c:	02812623          	sw	s0,44(sp)
   11880:	03010413          	addi	s0,sp,48
   11884:	fca42e23          	sw	a0,-36(s0)
   11888:	fcb42c23          	sw	a1,-40(s0)
   1188c:	fcc42a23          	sw	a2,-44(s0)
   11890:	fcd42823          	sw	a3,-48(s0)
   11894:	02000713          	li	a4,32
   11898:	fd842783          	lw	a5,-40(s0)
   1189c:	40f707b3          	sub	a5,a4,a5
   118a0:	fdc42703          	lw	a4,-36(s0)
   118a4:	00f717b3          	sll	a5,a4,a5
   118a8:	fef42623          	sw	a5,-20(s0)
   118ac:	1a1027b7          	lui	a5,0x1a102
   118b0:	00878793          	addi	a5,a5,8 # 1a102008 <_stack_start+0x19ffe008>
   118b4:	fec42703          	lw	a4,-20(s0)
   118b8:	00e7a023          	sw	a4,0(a5)
   118bc:	1a1027b7          	lui	a5,0x1a102
   118c0:	00c78793          	addi	a5,a5,12 # 1a10200c <_stack_start+0x19ffe00c>
   118c4:	fd442703          	lw	a4,-44(s0)
   118c8:	00e7a023          	sw	a4,0(a5)
   118cc:	fd842783          	lw	a5,-40(s0)
   118d0:	03f7f693          	andi	a3,a5,63
   118d4:	fd042783          	lw	a5,-48(s0)
   118d8:	00879713          	slli	a4,a5,0x8
   118dc:	000047b7          	lui	a5,0x4
   118e0:	f0078793          	addi	a5,a5,-256 # 3f00 <_stack_len+0x2f00>
   118e4:	00f77733          	and	a4,a4,a5
   118e8:	1a1027b7          	lui	a5,0x1a102
   118ec:	01078793          	addi	a5,a5,16 # 1a102010 <_stack_start+0x19ffe010>
   118f0:	00e6e733          	or	a4,a3,a4
   118f4:	00e7a023          	sw	a4,0(a5)
   118f8:	00000013          	nop
   118fc:	02c12403          	lw	s0,44(sp)
   11900:	03010113          	addi	sp,sp,48
   11904:	00008067          	ret

00011908 <spi_setup_dummy>:
   11908:	fe010113          	addi	sp,sp,-32
   1190c:	00812e23          	sw	s0,28(sp)
   11910:	02010413          	addi	s0,sp,32
   11914:	fea42623          	sw	a0,-20(s0)
   11918:	feb42423          	sw	a1,-24(s0)
   1191c:	fe842783          	lw	a5,-24(s0)
   11920:	01079793          	slli	a5,a5,0x10
   11924:	00078693          	mv	a3,a5
   11928:	fec42703          	lw	a4,-20(s0)
   1192c:	000107b7          	lui	a5,0x10
   11930:	fff78793          	addi	a5,a5,-1 # ffff <_stack_len+0xefff>
   11934:	00f777b3          	and	a5,a4,a5
   11938:	00f6e733          	or	a4,a3,a5
   1193c:	1a1027b7          	lui	a5,0x1a102
   11940:	01478793          	addi	a5,a5,20 # 1a102014 <_stack_start+0x19ffe014>
   11944:	00e7a023          	sw	a4,0(a5)
   11948:	00000013          	nop
   1194c:	01c12403          	lw	s0,28(sp)
   11950:	02010113          	addi	sp,sp,32
   11954:	00008067          	ret

00011958 <spi_set_datalen>:
   11958:	fd010113          	addi	sp,sp,-48
   1195c:	02812623          	sw	s0,44(sp)
   11960:	03010413          	addi	s0,sp,48
   11964:	fca42e23          	sw	a0,-36(s0)
   11968:	1a1027b7          	lui	a5,0x1a102
   1196c:	01078793          	addi	a5,a5,16 # 1a102010 <_stack_start+0x19ffe010>
   11970:	0007a783          	lw	a5,0(a5)
   11974:	fef42623          	sw	a5,-20(s0)
   11978:	fdc42783          	lw	a5,-36(s0)
   1197c:	01079793          	slli	a5,a5,0x10
   11980:	00078713          	mv	a4,a5
   11984:	fec42783          	lw	a5,-20(s0)
   11988:	00078693          	mv	a3,a5
   1198c:	000107b7          	lui	a5,0x10
   11990:	fff78793          	addi	a5,a5,-1 # ffff <_stack_len+0xefff>
   11994:	00f6f7b3          	and	a5,a3,a5
   11998:	00f767b3          	or	a5,a4,a5
   1199c:	fef42623          	sw	a5,-20(s0)
   119a0:	1a1027b7          	lui	a5,0x1a102
   119a4:	01078793          	addi	a5,a5,16 # 1a102010 <_stack_start+0x19ffe010>
   119a8:	fec42703          	lw	a4,-20(s0)
   119ac:	00e7a023          	sw	a4,0(a5)
   119b0:	00000013          	nop
   119b4:	02c12403          	lw	s0,44(sp)
   119b8:	03010113          	addi	sp,sp,48
   119bc:	00008067          	ret

000119c0 <spi_start_transaction>:
   119c0:	fe010113          	addi	sp,sp,-32
   119c4:	00812e23          	sw	s0,28(sp)
   119c8:	02010413          	addi	s0,sp,32
   119cc:	fea42623          	sw	a0,-20(s0)
   119d0:	feb42423          	sw	a1,-24(s0)
   119d4:	fe842783          	lw	a5,-24(s0)
   119d8:	00878793          	addi	a5,a5,8
   119dc:	00100713          	li	a4,1
   119e0:	00f71733          	sll	a4,a4,a5
   119e4:	000017b7          	lui	a5,0x1
   119e8:	f0078793          	addi	a5,a5,-256 # f00 <_min_stack+0x700>
   119ec:	00f776b3          	and	a3,a4,a5
   119f0:	fec42783          	lw	a5,-20(s0)
   119f4:	00100713          	li	a4,1
   119f8:	00f717b3          	sll	a5,a4,a5
   119fc:	0ff7f713          	andi	a4,a5,255
   11a00:	1a1027b7          	lui	a5,0x1a102
   11a04:	00e6e733          	or	a4,a3,a4
   11a08:	00e7a023          	sw	a4,0(a5) # 1a102000 <_stack_start+0x19ffe000>
   11a0c:	00000013          	nop
   11a10:	01c12403          	lw	s0,28(sp)
   11a14:	02010113          	addi	sp,sp,32
   11a18:	00008067          	ret

00011a1c <spi_get_status>:
   11a1c:	fe010113          	addi	sp,sp,-32
   11a20:	00812e23          	sw	s0,28(sp)
   11a24:	02010413          	addi	s0,sp,32
   11a28:	1a1027b7          	lui	a5,0x1a102
   11a2c:	0007a783          	lw	a5,0(a5) # 1a102000 <_stack_start+0x19ffe000>
   11a30:	fef42623          	sw	a5,-20(s0)
   11a34:	fec42783          	lw	a5,-20(s0)
   11a38:	00078513          	mv	a0,a5
   11a3c:	01c12403          	lw	s0,28(sp)
   11a40:	02010113          	addi	sp,sp,32
   11a44:	00008067          	ret

00011a48 <spi_write_fifo>:
   11a48:	fd010113          	addi	sp,sp,-48
   11a4c:	02812623          	sw	s0,44(sp)
   11a50:	03010413          	addi	s0,sp,48
   11a54:	fca42e23          	sw	a0,-36(s0)
   11a58:	fcb42c23          	sw	a1,-40(s0)
   11a5c:	fd842783          	lw	a5,-40(s0)
   11a60:	4057d793          	srai	a5,a5,0x5
   11a64:	7ff7f793          	andi	a5,a5,2047
   11a68:	fef42623          	sw	a5,-20(s0)
   11a6c:	fd842783          	lw	a5,-40(s0)
   11a70:	01f7f793          	andi	a5,a5,31
   11a74:	00078863          	beqz	a5,11a84 <spi_write_fifo+0x3c>
   11a78:	fec42783          	lw	a5,-20(s0)
   11a7c:	00178793          	addi	a5,a5,1
   11a80:	fef42623          	sw	a5,-20(s0)
   11a84:	fe042423          	sw	zero,-24(s0)
   11a88:	0480006f          	j	11ad0 <spi_write_fifo+0x88>
   11a8c:	00000013          	nop
   11a90:	1a1027b7          	lui	a5,0x1a102
   11a94:	0007a783          	lw	a5,0(a5) # 1a102000 <_stack_start+0x19ffe000>
   11a98:	4187d793          	srai	a5,a5,0x18
   11a9c:	0f87f793          	andi	a5,a5,248
   11aa0:	fe0798e3          	bnez	a5,11a90 <spi_write_fifo+0x48>
   11aa4:	fe842783          	lw	a5,-24(s0)
   11aa8:	00279793          	slli	a5,a5,0x2
   11aac:	fdc42703          	lw	a4,-36(s0)
   11ab0:	00f70733          	add	a4,a4,a5
   11ab4:	1a1027b7          	lui	a5,0x1a102
   11ab8:	01878793          	addi	a5,a5,24 # 1a102018 <_stack_start+0x19ffe018>
   11abc:	00072703          	lw	a4,0(a4)
   11ac0:	00e7a023          	sw	a4,0(a5)
   11ac4:	fe842783          	lw	a5,-24(s0)
   11ac8:	00178793          	addi	a5,a5,1
   11acc:	fef42423          	sw	a5,-24(s0)
   11ad0:	fe842703          	lw	a4,-24(s0)
   11ad4:	fec42783          	lw	a5,-20(s0)
   11ad8:	faf74ae3          	blt	a4,a5,11a8c <spi_write_fifo+0x44>
   11adc:	00000013          	nop
   11ae0:	00000013          	nop
   11ae4:	02c12403          	lw	s0,44(sp)
   11ae8:	03010113          	addi	sp,sp,48
   11aec:	00008067          	ret

00011af0 <spi_read_fifo>:
   11af0:	fd010113          	addi	sp,sp,-48
   11af4:	02812623          	sw	s0,44(sp)
   11af8:	03010413          	addi	s0,sp,48
   11afc:	fca42e23          	sw	a0,-36(s0)
   11b00:	fcb42c23          	sw	a1,-40(s0)
   11b04:	fd842783          	lw	a5,-40(s0)
   11b08:	4057d793          	srai	a5,a5,0x5
   11b0c:	7ff7f793          	andi	a5,a5,2047
   11b10:	fef42623          	sw	a5,-20(s0)
   11b14:	fd842783          	lw	a5,-40(s0)
   11b18:	01f7f793          	andi	a5,a5,31
   11b1c:	00078863          	beqz	a5,11b2c <spi_read_fifo+0x3c>
   11b20:	fec42783          	lw	a5,-20(s0)
   11b24:	00178793          	addi	a5,a5,1
   11b28:	fef42623          	sw	a5,-20(s0)
   11b2c:	fe042423          	sw	zero,-24(s0)
   11b30:	0480006f          	j	11b78 <spi_read_fifo+0x88>
   11b34:	00000013          	nop
   11b38:	1a1027b7          	lui	a5,0x1a102
   11b3c:	0007a783          	lw	a5,0(a5) # 1a102000 <_stack_start+0x19ffe000>
   11b40:	4107d793          	srai	a5,a5,0x10
   11b44:	0ff7f793          	andi	a5,a5,255
   11b48:	fe0788e3          	beqz	a5,11b38 <spi_read_fifo+0x48>
   11b4c:	1a1027b7          	lui	a5,0x1a102
   11b50:	02078713          	addi	a4,a5,32 # 1a102020 <_stack_start+0x19ffe020>
   11b54:	fe842783          	lw	a5,-24(s0)
   11b58:	00279793          	slli	a5,a5,0x2
   11b5c:	fdc42683          	lw	a3,-36(s0)
   11b60:	00f687b3          	add	a5,a3,a5
   11b64:	00072703          	lw	a4,0(a4)
   11b68:	00e7a023          	sw	a4,0(a5)
   11b6c:	fe842783          	lw	a5,-24(s0)
   11b70:	00178793          	addi	a5,a5,1
   11b74:	fef42423          	sw	a5,-24(s0)
   11b78:	fe842703          	lw	a4,-24(s0)
   11b7c:	fec42783          	lw	a5,-20(s0)
   11b80:	faf74ae3          	blt	a4,a5,11b34 <spi_read_fifo+0x44>
   11b84:	00000013          	nop
   11b88:	00000013          	nop
   11b8c:	02c12403          	lw	s0,44(sp)
   11b90:	03010113          	addi	sp,sp,48
   11b94:	00008067          	ret

00011b98 <reset_timer>:
   11b98:	ff010113          	addi	sp,sp,-16
   11b9c:	00812623          	sw	s0,12(sp)
   11ba0:	01010413          	addi	s0,sp,16
   11ba4:	1a1037b7          	lui	a5,0x1a103
   11ba8:	0007a023          	sw	zero,0(a5) # 1a103000 <_stack_start+0x19fff000>
   11bac:	00000013          	nop
   11bb0:	00c12403          	lw	s0,12(sp)
   11bb4:	01010113          	addi	sp,sp,16
   11bb8:	00008067          	ret

00011bbc <start_timer>:
   11bbc:	ff010113          	addi	sp,sp,-16
   11bc0:	00812623          	sw	s0,12(sp)
   11bc4:	01010413          	addi	s0,sp,16
   11bc8:	1a1037b7          	lui	a5,0x1a103
   11bcc:	00478793          	addi	a5,a5,4 # 1a103004 <_stack_start+0x19fff004>
   11bd0:	00100713          	li	a4,1
   11bd4:	00e7a023          	sw	a4,0(a5)
   11bd8:	00000013          	nop
   11bdc:	00c12403          	lw	s0,12(sp)
   11be0:	01010113          	addi	sp,sp,16
   11be4:	00008067          	ret

00011be8 <stop_timer>:
   11be8:	ff010113          	addi	sp,sp,-16
   11bec:	00812623          	sw	s0,12(sp)
   11bf0:	01010413          	addi	s0,sp,16
   11bf4:	1a1037b7          	lui	a5,0x1a103
   11bf8:	00478793          	addi	a5,a5,4 # 1a103004 <_stack_start+0x19fff004>
   11bfc:	0007a023          	sw	zero,0(a5)
   11c00:	00000013          	nop
   11c04:	00c12403          	lw	s0,12(sp)
   11c08:	01010113          	addi	sp,sp,16
   11c0c:	00008067          	ret

00011c10 <get_time>:
   11c10:	ff010113          	addi	sp,sp,-16
   11c14:	00812623          	sw	s0,12(sp)
   11c18:	01010413          	addi	s0,sp,16
   11c1c:	1a1037b7          	lui	a5,0x1a103
   11c20:	0007a783          	lw	a5,0(a5) # 1a103000 <_stack_start+0x19fff000>
   11c24:	00078513          	mv	a0,a5
   11c28:	00c12403          	lw	s0,12(sp)
   11c2c:	01010113          	addi	sp,sp,16
   11c30:	00008067          	ret

00011c34 <uart_set_cfg>:
   11c34:	fe010113          	addi	sp,sp,-32
   11c38:	00812e23          	sw	s0,28(sp)
   11c3c:	02010413          	addi	s0,sp,32
   11c40:	fea42623          	sw	a0,-20(s0)
   11c44:	00058793          	mv	a5,a1
   11c48:	fef41523          	sh	a5,-22(s0)
   11c4c:	1a1077b7          	lui	a5,0x1a107
   11c50:	00478793          	addi	a5,a5,4 # 1a107004 <_stack_start+0x1a003004>
   11c54:	0007a703          	lw	a4,0(a5)
   11c58:	1a1077b7          	lui	a5,0x1a107
   11c5c:	00478793          	addi	a5,a5,4 # 1a107004 <_stack_start+0x1a003004>
   11c60:	00276713          	ori	a4,a4,2
   11c64:	00e7a023          	sw	a4,0(a5)
   11c68:	1a1007b7          	lui	a5,0x1a100
   11c6c:	00c78793          	addi	a5,a5,12 # 1a10000c <_stack_start+0x19ffc00c>
   11c70:	08300713          	li	a4,131
   11c74:	00e7a023          	sw	a4,0(a5)
   11c78:	fea45783          	lhu	a5,-22(s0)
   11c7c:	0087d793          	srli	a5,a5,0x8
   11c80:	01079793          	slli	a5,a5,0x10
   11c84:	0107d793          	srli	a5,a5,0x10
   11c88:	00078713          	mv	a4,a5
   11c8c:	1a1007b7          	lui	a5,0x1a100
   11c90:	00478793          	addi	a5,a5,4 # 1a100004 <_stack_start+0x19ffc004>
   11c94:	0ff77713          	andi	a4,a4,255
   11c98:	00e7a023          	sw	a4,0(a5)
   11c9c:	fea45703          	lhu	a4,-22(s0)
   11ca0:	1a1007b7          	lui	a5,0x1a100
   11ca4:	0ff77713          	andi	a4,a4,255
   11ca8:	00e7a023          	sw	a4,0(a5) # 1a100000 <_stack_start+0x19ffc000>
   11cac:	1a1007b7          	lui	a5,0x1a100
   11cb0:	00878793          	addi	a5,a5,8 # 1a100008 <_stack_start+0x19ffc008>
   11cb4:	0a700713          	li	a4,167
   11cb8:	00e7a023          	sw	a4,0(a5)
   11cbc:	1a1007b7          	lui	a5,0x1a100
   11cc0:	00c78793          	addi	a5,a5,12 # 1a10000c <_stack_start+0x19ffc00c>
   11cc4:	00300713          	li	a4,3
   11cc8:	00e7a023          	sw	a4,0(a5)
   11ccc:	1a1007b7          	lui	a5,0x1a100
   11cd0:	00478793          	addi	a5,a5,4 # 1a100004 <_stack_start+0x19ffc004>
   11cd4:	0007a783          	lw	a5,0(a5)
   11cd8:	0f07f713          	andi	a4,a5,240
   11cdc:	1a1007b7          	lui	a5,0x1a100
   11ce0:	00478793          	addi	a5,a5,4 # 1a100004 <_stack_start+0x19ffc004>
   11ce4:	00276713          	ori	a4,a4,2
   11ce8:	00e7a023          	sw	a4,0(a5)
   11cec:	00000013          	nop
   11cf0:	01c12403          	lw	s0,28(sp)
   11cf4:	02010113          	addi	sp,sp,32
   11cf8:	00008067          	ret

00011cfc <uart_send>:
   11cfc:	fd010113          	addi	sp,sp,-48
   11d00:	02812623          	sw	s0,44(sp)
   11d04:	03010413          	addi	s0,sp,48
   11d08:	fca42e23          	sw	a0,-36(s0)
   11d0c:	fcb42c23          	sw	a1,-40(s0)
   11d10:	0680006f          	j	11d78 <uart_send+0x7c>
   11d14:	00000013          	nop
   11d18:	1a1007b7          	lui	a5,0x1a100
   11d1c:	01478793          	addi	a5,a5,20 # 1a100014 <_stack_start+0x19ffc014>
   11d20:	0007a783          	lw	a5,0(a5)
   11d24:	0207f793          	andi	a5,a5,32
   11d28:	fe0788e3          	beqz	a5,11d18 <uart_send+0x1c>
   11d2c:	fe042623          	sw	zero,-20(s0)
   11d30:	0340006f          	j	11d64 <uart_send+0x68>
   11d34:	fdc42783          	lw	a5,-36(s0)
   11d38:	00178713          	addi	a4,a5,1
   11d3c:	fce42e23          	sw	a4,-36(s0)
   11d40:	0007c703          	lbu	a4,0(a5)
   11d44:	1a1007b7          	lui	a5,0x1a100
   11d48:	00e7a023          	sw	a4,0(a5) # 1a100000 <_stack_start+0x19ffc000>
   11d4c:	fd842783          	lw	a5,-40(s0)
   11d50:	fff78793          	addi	a5,a5,-1
   11d54:	fcf42c23          	sw	a5,-40(s0)
   11d58:	fec42783          	lw	a5,-20(s0)
   11d5c:	00178793          	addi	a5,a5,1
   11d60:	fef42623          	sw	a5,-20(s0)
   11d64:	fec42703          	lw	a4,-20(s0)
   11d68:	03f00793          	li	a5,63
   11d6c:	00e7e663          	bltu	a5,a4,11d78 <uart_send+0x7c>
   11d70:	fd842783          	lw	a5,-40(s0)
   11d74:	fc0790e3          	bnez	a5,11d34 <uart_send+0x38>
   11d78:	fd842783          	lw	a5,-40(s0)
   11d7c:	f8079ce3          	bnez	a5,11d14 <uart_send+0x18>
   11d80:	00000013          	nop
   11d84:	00000013          	nop
   11d88:	02c12403          	lw	s0,44(sp)
   11d8c:	03010113          	addi	sp,sp,48
   11d90:	00008067          	ret

00011d94 <uart_getchar>:
   11d94:	ff010113          	addi	sp,sp,-16
   11d98:	00812623          	sw	s0,12(sp)
   11d9c:	01010413          	addi	s0,sp,16
   11da0:	00000013          	nop
   11da4:	1a1007b7          	lui	a5,0x1a100
   11da8:	01478793          	addi	a5,a5,20 # 1a100014 <_stack_start+0x19ffc014>
   11dac:	0007a783          	lw	a5,0(a5)
   11db0:	0017f713          	andi	a4,a5,1
   11db4:	00100793          	li	a5,1
   11db8:	fef716e3          	bne	a4,a5,11da4 <uart_getchar+0x10>
   11dbc:	1a1007b7          	lui	a5,0x1a100
   11dc0:	0007a783          	lw	a5,0(a5) # 1a100000 <_stack_start+0x19ffc000>
   11dc4:	0ff7f793          	andi	a5,a5,255
   11dc8:	00078513          	mv	a0,a5
   11dcc:	00c12403          	lw	s0,12(sp)
   11dd0:	01010113          	addi	sp,sp,16
   11dd4:	00008067          	ret

00011dd8 <uart_sendchar>:
   11dd8:	fe010113          	addi	sp,sp,-32
   11ddc:	00812e23          	sw	s0,28(sp)
   11de0:	02010413          	addi	s0,sp,32
   11de4:	00050793          	mv	a5,a0
   11de8:	fef407a3          	sb	a5,-17(s0)
   11dec:	00000013          	nop
   11df0:	1a1007b7          	lui	a5,0x1a100
   11df4:	01478793          	addi	a5,a5,20 # 1a100014 <_stack_start+0x19ffc014>
   11df8:	0007a783          	lw	a5,0(a5)
   11dfc:	0207f793          	andi	a5,a5,32
   11e00:	fe0788e3          	beqz	a5,11df0 <uart_sendchar+0x18>
   11e04:	1a1007b7          	lui	a5,0x1a100
   11e08:	fef44703          	lbu	a4,-17(s0)
   11e0c:	00e7a023          	sw	a4,0(a5) # 1a100000 <_stack_start+0x19ffc000>
   11e10:	00000013          	nop
   11e14:	01c12403          	lw	s0,28(sp)
   11e18:	02010113          	addi	sp,sp,32
   11e1c:	00008067          	ret

00011e20 <uart_wait_tx_done>:
   11e20:	ff010113          	addi	sp,sp,-16
   11e24:	00812623          	sw	s0,12(sp)
   11e28:	01010413          	addi	s0,sp,16
   11e2c:	00000013          	nop
   11e30:	1a1007b7          	lui	a5,0x1a100
   11e34:	01478793          	addi	a5,a5,20 # 1a100014 <_stack_start+0x19ffc014>
   11e38:	0007a783          	lw	a5,0(a5)
   11e3c:	0407f793          	andi	a5,a5,64
   11e40:	fe0788e3          	beqz	a5,11e30 <uart_wait_tx_done+0x10>
   11e44:	00000013          	nop
   11e48:	00000013          	nop
   11e4c:	00c12403          	lw	s0,12(sp)
   11e50:	01010113          	addi	sp,sp,16
   11e54:	00008067          	ret

00011e58 <exit>:
   11e58:	fe010113          	addi	sp,sp,-32
   11e5c:	00112e23          	sw	ra,28(sp)
   11e60:	00812c23          	sw	s0,24(sp)
   11e64:	02010413          	addi	s0,sp,32
   11e68:	fea42623          	sw	a0,-20(s0)
   11e6c:	fec42503          	lw	a0,-20(s0)
   11e70:	008000ef          	jal	ra,11e78 <eoc>
   11e74:	0000006f          	j	11e74 <exit+0x1c>

00011e78 <eoc>:
   11e78:	fe010113          	addi	sp,sp,-32
   11e7c:	00812e23          	sw	s0,28(sp)
   11e80:	02010413          	addi	s0,sp,32
   11e84:	fea42623          	sw	a0,-20(s0)
   11e88:	fec42783          	lw	a5,-20(s0)
   11e8c:	00078c63          	beqz	a5,11ea4 <eoc+0x2c>
   11e90:	1a1077b7          	lui	a5,0x1a107
   11e94:	01478793          	addi	a5,a5,20 # 1a107014 <_stack_start+0x1a003014>
   11e98:	00100713          	li	a4,1
   11e9c:	00e7a023          	sw	a4,0(a5)
   11ea0:	0100006f          	j	11eb0 <eoc+0x38>
   11ea4:	1a1077b7          	lui	a5,0x1a107
   11ea8:	01478793          	addi	a5,a5,20 # 1a107014 <_stack_start+0x1a003014>
   11eac:	0007a023          	sw	zero,0(a5)
   11eb0:	1a1077b7          	lui	a5,0x1a107
   11eb4:	00478793          	addi	a5,a5,4 # 1a107004 <_stack_start+0x1a003004>
   11eb8:	0007a703          	lw	a4,0(a5)
   11ebc:	1a1077b7          	lui	a5,0x1a107
   11ec0:	00478793          	addi	a5,a5,4 # 1a107004 <_stack_start+0x1a003004>
   11ec4:	00476713          	ori	a4,a4,4
   11ec8:	00e7a023          	sw	a4,0(a5)
   11ecc:	00000013          	nop
   11ed0:	01c12403          	lw	s0,28(sp)
   11ed4:	02010113          	addi	sp,sp,32
   11ed8:	00008067          	ret

00011edc <sleep_busy>:
   11edc:	fd010113          	addi	sp,sp,-48
   11ee0:	02812623          	sw	s0,44(sp)
   11ee4:	03010413          	addi	s0,sp,48
   11ee8:	fca42e23          	sw	a0,-36(s0)
   11eec:	fe042623          	sw	zero,-20(s0)
   11ef0:	0140006f          	j	11f04 <sleep_busy+0x28>
   11ef4:	00000013          	nop
   11ef8:	fec42783          	lw	a5,-20(s0)
   11efc:	00178793          	addi	a5,a5,1
   11f00:	fef42623          	sw	a5,-20(s0)
   11f04:	fdc42783          	lw	a5,-36(s0)
   11f08:	fec42703          	lw	a4,-20(s0)
   11f0c:	fef744e3          	blt	a4,a5,11ef4 <sleep_busy+0x18>
   11f10:	00000013          	nop
   11f14:	00000013          	nop
   11f18:	02c12403          	lw	s0,44(sp)
   11f1c:	03010113          	addi	sp,sp,48
   11f20:	00008067          	ret

00011f24 <cpu_perf_set>:
   11f24:	fe010113          	addi	sp,sp,-32
   11f28:	00112e23          	sw	ra,28(sp)
   11f2c:	00812c23          	sw	s0,24(sp)
   11f30:	02010413          	addi	s0,sp,32
   11f34:	fea42623          	sw	a0,-20(s0)
   11f38:	feb42423          	sw	a1,-24(s0)
   11f3c:	000127b7          	lui	a5,0x12
   11f40:	13478513          	addi	a0,a5,308 # 12134 <__DTOR_END__+0x9c>
   11f44:	d60ff0ef          	jal	ra,114a4 <puts>
   11f48:	00000013          	nop
   11f4c:	01c12083          	lw	ra,28(sp)
   11f50:	01812403          	lw	s0,24(sp)
   11f54:	02010113          	addi	sp,sp,32
   11f58:	00008067          	ret

00011f5c <cpu_perf_get>:
   11f5c:	fd010113          	addi	sp,sp,-48
   11f60:	02112623          	sw	ra,44(sp)
   11f64:	02812423          	sw	s0,40(sp)
   11f68:	03010413          	addi	s0,sp,48
   11f6c:	fca42e23          	sw	a0,-36(s0)
   11f70:	fe042623          	sw	zero,-20(s0)
   11f74:	fdc42703          	lw	a4,-36(s0)
   11f78:	00f00793          	li	a5,15
   11f7c:	0ee7e063          	bltu	a5,a4,1205c <cpu_perf_get+0x100>
   11f80:	fdc42783          	lw	a5,-36(s0)
   11f84:	00279713          	slli	a4,a5,0x2
   11f88:	000127b7          	lui	a5,0x12
   11f8c:	17478793          	addi	a5,a5,372 # 12174 <__DTOR_END__+0xdc>
   11f90:	00f707b3          	add	a5,a4,a5
   11f94:	0007a783          	lw	a5,0(a5)
   11f98:	00078067          	jr	a5
   11f9c:	780027f3          	csrr	a5,0x780
   11fa0:	fef42623          	sw	a5,-20(s0)
   11fa4:	0cc0006f          	j	12070 <cpu_perf_get+0x114>
   11fa8:	781027f3          	csrr	a5,0x781
   11fac:	fef42623          	sw	a5,-20(s0)
   11fb0:	0c00006f          	j	12070 <cpu_perf_get+0x114>
   11fb4:	782027f3          	csrr	a5,0x782
   11fb8:	fef42623          	sw	a5,-20(s0)
   11fbc:	0b40006f          	j	12070 <cpu_perf_get+0x114>
   11fc0:	783027f3          	csrr	a5,0x783
   11fc4:	fef42623          	sw	a5,-20(s0)
   11fc8:	0a80006f          	j	12070 <cpu_perf_get+0x114>
   11fcc:	784027f3          	csrr	a5,0x784
   11fd0:	fef42623          	sw	a5,-20(s0)
   11fd4:	09c0006f          	j	12070 <cpu_perf_get+0x114>
   11fd8:	785027f3          	csrr	a5,0x785
   11fdc:	fef42623          	sw	a5,-20(s0)
   11fe0:	0900006f          	j	12070 <cpu_perf_get+0x114>
   11fe4:	786027f3          	csrr	a5,0x786
   11fe8:	fef42623          	sw	a5,-20(s0)
   11fec:	0840006f          	j	12070 <cpu_perf_get+0x114>
   11ff0:	787027f3          	csrr	a5,0x787
   11ff4:	fef42623          	sw	a5,-20(s0)
   11ff8:	0780006f          	j	12070 <cpu_perf_get+0x114>
   11ffc:	788027f3          	csrr	a5,0x788
   12000:	fef42623          	sw	a5,-20(s0)
   12004:	06c0006f          	j	12070 <cpu_perf_get+0x114>
   12008:	789027f3          	csrr	a5,0x789
   1200c:	fef42623          	sw	a5,-20(s0)
   12010:	0600006f          	j	12070 <cpu_perf_get+0x114>
   12014:	78a027f3          	csrr	a5,0x78a
   12018:	fef42623          	sw	a5,-20(s0)
   1201c:	0540006f          	j	12070 <cpu_perf_get+0x114>
   12020:	78b027f3          	csrr	a5,0x78b
   12024:	fef42623          	sw	a5,-20(s0)
   12028:	0480006f          	j	12070 <cpu_perf_get+0x114>
   1202c:	78c027f3          	csrr	a5,0x78c
   12030:	fef42623          	sw	a5,-20(s0)
   12034:	03c0006f          	j	12070 <cpu_perf_get+0x114>
   12038:	78d027f3          	csrr	a5,0x78d
   1203c:	fef42623          	sw	a5,-20(s0)
   12040:	0300006f          	j	12070 <cpu_perf_get+0x114>
   12044:	78e027f3          	csrr	a5,0x78e
   12048:	fef42623          	sw	a5,-20(s0)
   1204c:	0240006f          	j	12070 <cpu_perf_get+0x114>
   12050:	78f027f3          	csrr	a5,0x78f
   12054:	fef42623          	sw	a5,-20(s0)
   12058:	0180006f          	j	12070 <cpu_perf_get+0x114>
   1205c:	fdc42583          	lw	a1,-36(s0)
   12060:	000127b7          	lui	a5,0x12
   12064:	15878513          	addi	a0,a5,344 # 12158 <__DTOR_END__+0xc0>
   12068:	bc8ff0ef          	jal	ra,11430 <printf>
   1206c:	00000013          	nop
   12070:	fec42783          	lw	a5,-20(s0)
   12074:	00078513          	mv	a0,a5
   12078:	02c12083          	lw	ra,44(sp)
   1207c:	02812403          	lw	s0,40(sp)
   12080:	03010113          	addi	sp,sp,48
   12084:	00008067          	ret

00012088 <__CTOR_LIST__>:
	...

00012090 <__CTOR_END__>:
	...

Disassembly of section .rodata:

00012098 <.rodata>:
   12098:	6568                	flw	fa0,76(a0)
   1209a:	6c6c                	flw	fa1,92(s0)
   1209c:	6f77206f          	j	84f92 <_bss_end+0x72dce>
   120a0:	6c72                	flw	fs8,28(sp)
   120a2:	2164                	fld	fs1,192(a0)
   120a4:	0000                	unimp
   120a6:	0000                	unimp
   120a8:	74696177          	0x74696177
   120ac:	6e69                	lui	t3,0x1a
   120ae:	6f662067          	0x6f662067
   120b2:	2072                	fld	ft0,280(sp)
   120b4:	6175                	addi	sp,sp,368
   120b6:	7472                	flw	fs0,60(sp)
   120b8:	7320                	flw	fs0,96(a4)
   120ba:	6769                	lui	a4,0x1a
   120bc:	616e                	flw	ft2,216(sp)
   120be:	736c                	flw	fa1,100(a4)
   120c0:	7420                	flw	fs0,104(s0)
   120c2:	7277206f          	j	84fe8 <_bss_end+0x72e24>
   120c6:	7469                	lui	s0,0xffffa
   120c8:	2065                	jal	12170 <__DTOR_END__+0xd8>
   120ca:	6f74                	flw	fa3,92(a4)
   120cc:	7220                	flw	fs0,96(a2)
   120ce:	6d61                	lui	s10,0x18
   120d0:	2e2e                	fld	ft8,200(sp)
   120d2:	002e                	c.slli	zero,0xb
   120d4:	6f44                	flw	fs1,28(a4)
   120d6:	656e                	flw	fa0,216(sp)
   120d8:	202c                	fld	fa1,64(s0)
   120da:	756a                	flw	fa0,184(sp)
   120dc:	706d                	c.lui	zero,0xffffb
   120de:	6e69                	lui	t3,0x1a
   120e0:	6f742067          	0x6f742067
   120e4:	4920                	lw	s0,80(a0)
   120e6:	736e                	flw	ft6,248(sp)
   120e8:	7274                	flw	fa3,100(a2)
   120ea:	6375                	lui	t1,0x1d
   120ec:	6974                	flw	fa3,84(a0)
   120ee:	52206e6f          	jal	t3,18610 <_bss_end+0x644c>
   120f2:	4d41                	li	s10,16
   120f4:	0a2e                	slli	s4,s4,0xb
   120f6:	0000                	unimp
   120f8:	6854                	flw	fa3,20(s0)
   120fa:	7369                	lui	t1,0xffffa
   120fc:	6920                	flw	fs0,80(a0)
   120fe:	74276e73          	csrrsi	t3,0x742,14
   12102:	7320                	flw	fs0,96(a4)
   12104:	7075                	c.lui	zero,0xffffd
   12106:	6f70                	flw	fa2,92(a4)
   12108:	20646573          	csrrsi	a0,0x206,8
   1210c:	6f74                	flw	fa3,92(a4)
   1210e:	6220                	flw	fs0,64(a2)
   12110:	2065                	jal	121b8 <remu10_table+0x4>
   12112:	776f6873          	csrrsi	a6,0x776,30
   12116:	2e6e                	fld	ft8,216(sp)
   12118:	0020                	addi	s0,sp,8
   1211a:	0000                	unimp
   1211c:	3130                	fld	fa2,96(a0)
   1211e:	3332                	fld	ft6,296(sp)
   12120:	3534                	fld	fa3,104(a0)
   12122:	3736                	fld	fa4,360(sp)
   12124:	3938                	fld	fa4,112(a0)
   12126:	4241                	li	tp,16
   12128:	46454443          	fmadd.q	fs0,fa0,ft4,fs0,rmm
   1212c:	6e28                	flw	fa0,88(a2)
   1212e:	6c75                	lui	s8,0x1d
   12130:	296c                	fld	fa1,208(a0)
   12132:	0000                	unimp
   12134:	5f757063          	bgeu	a0,s7,12714 <_bss_end+0x550>
   12138:	6570                	flw	fa2,76(a0)
   1213a:	6672                	flw	fa2,28(sp)
   1213c:	735f 7465 203a      	0x203a7465735f
   12142:	6f6e                	flw	ft10,216(sp)
   12144:	2074                	fld	fa3,192(s0)
   12146:	6d69                	lui	s10,0x1a
   12148:	6c70                	flw	fa2,92(s0)
   1214a:	6d65                	lui	s10,0x19
   1214c:	6e65                	lui	t3,0x19
   1214e:	6574                	flw	fa3,76(a0)
   12150:	2064                	fld	fs1,192(s0)
   12152:	6579                	lui	a0,0x1e
   12154:	0074                	addi	a3,sp,12
   12156:	0000                	unimp
   12158:	20525343          	fmadd.s	ft6,ft4,ft5,ft4,unknown
   1215c:	6425                	lui	s0,0x9
   1215e:	6e20                	flw	fs0,88(a2)
   12160:	7920746f          	jal	s0,198f2 <_bss_end+0x772e>
   12164:	7465                	lui	s0,0xffff9
   12166:	7320                	flw	fs0,96(a4)
   12168:	7075                	c.lui	zero,0xffffd
   1216a:	6f70                	flw	fa2,92(a4)
   1216c:	7472                	flw	fs0,60(sp)
   1216e:	6465                	lui	s0,0x19
   12170:	000a                	c.slli	zero,0x2
   12172:	0000                	unimp
   12174:	1f9c                	addi	a5,sp,1008
   12176:	0001                	nop
   12178:	1fa8                	addi	a0,sp,1016
   1217a:	0001                	nop
   1217c:	1fb4                	addi	a3,sp,1016
   1217e:	0001                	nop
   12180:	1fc0                	addi	s0,sp,1012
   12182:	0001                	nop
   12184:	1fcc                	addi	a1,sp,1012
   12186:	0001                	nop
   12188:	1fd8                	addi	a4,sp,1012
   1218a:	0001                	nop
   1218c:	1fe4                	addi	s1,sp,1020
   1218e:	0001                	nop
   12190:	1ff0                	addi	a2,sp,1020
   12192:	0001                	nop
   12194:	1ffc                	addi	a5,sp,1020
   12196:	0001                	nop
   12198:	2008                	fld	fa0,0(s0)
   1219a:	0001                	nop
   1219c:	2014                	fld	fa3,0(s0)
   1219e:	0001                	nop
   121a0:	2020                	fld	fs0,64(s0)
   121a2:	0001                	nop
   121a4:	202c                	fld	fa1,64(s0)
   121a6:	0001                	nop
   121a8:	2038                	fld	fa4,64(s0)
   121aa:	0001                	nop
   121ac:	2044                	fld	fs1,128(s0)
   121ae:	0001                	nop
   121b0:	2050                	fld	fa2,128(s0)
   121b2:	0001                	nop

Disassembly of section .data:

000121b4 <remu10_table>:
   121b4:	0100                	addi	s0,sp,128
   121b6:	0202                	c.slli64	tp
   121b8:	05040303          	lb	t1,80(s0) # 19050 <_edata+0x6e8c>
   121bc:	0605                	addi	a2,a2,1
   121be:	08080707          	0x8080707
   121c2:	0009                	c.nop	2

Disassembly of section .stack:

00103000 <_stack-0x800>:
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	2441                	jal	280 <__DYNAMIC+0x280>
   2:	0000                	unimp
   4:	7200                	flw	fs0,32(a2)
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <__DYNAMIC+0x14>
   c:	001a                	c.slli	zero,0x6
   e:	0000                	unimp
  10:	1004                	addi	s1,sp,32
  12:	7205                	lui	tp,0xfffe1
  14:	3376                	fld	ft6,376(sp)
  16:	6932                	flw	fs2,12(sp)
  18:	7032                	flw	ft0,44(sp)
  1a:	5f30                	lw	a2,120(a4)
  1c:	326d                	jal	fffff9c6 <_stack_start+0xffefb9c6>
  1e:	3070                	fld	fa2,224(s0)
  20:	0800                	addi	s0,sp,16
  22:	0a01                	addi	s4,s4,0
  24:	0b              	地址 0x0000000000000024 越界。


Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3120                	fld	fs0,96(a0)
   c:	2e30                	fld	fa2,88(a2)
   e:	2e32                	fld	ft8,264(sp)
  10:	0030                	addi	a2,sp,8
