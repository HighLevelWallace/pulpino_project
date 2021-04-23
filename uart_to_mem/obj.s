
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
   100d8:	14c70713          	addi	a4,a4,332 # 12220 <_bss_end>
   100dc:	00002797          	auipc	a5,0x2
   100e0:	14478793          	addi	a5,a5,324 # 12220 <_bss_end>
   100e4:	00f75863          	bge	a4,a5,100f4 <main_entry>

000100e8 <zero_loop>:
   100e8:	00072023          	sw	zero,0(a4)
   100ec:	00470713          	addi	a4,a4,4
   100f0:	fee7dce3          	bge	a5,a4,100e8 <zero_loop>

000100f4 <main_entry>:
   100f4:	00000513          	li	a0,0
   100f8:	00100593          	li	a1,1
   100fc:	395010ef          	jal	ra,11c90 <uart_set_cfg>
   10100:	00000513          	li	a0,0
   10104:	00000593          	li	a1,0
   10108:	754000ef          	jal	ra,1085c <main>
   1010c:	00050413          	mv	s0,a0
   10110:	56d010ef          	jal	ra,11e7c <uart_wait_tx_done>
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
   10878:	418010ef          	jal	ra,11c90 <uart_set_cfg>
   1087c:	fe042623          	sw	zero,-20(s0)
   10880:	fe042423          	sw	zero,-24(s0)
   10884:	fe042223          	sw	zero,-28(s0)
   10888:	0280006f          	j	108b0 <main+0x54>
   1088c:	00100593          	li	a1,1
   10890:	fe442503          	lw	a0,-28(s0)
   10894:	af5ff0ef          	jal	ra,10388 <set_gpio_pin_direction>
   10898:	00100593          	li	a1,1
   1089c:	fe442503          	lw	a0,-28(s0)
   108a0:	badff0ef          	jal	ra,1044c <set_gpio_pin_value>
   108a4:	fe442783          	lw	a5,-28(s0)
   108a8:	00178793          	addi	a5,a5,1
   108ac:	fef42223          	sw	a5,-28(s0)
   108b0:	fe442703          	lw	a4,-28(s0)
   108b4:	00700793          	li	a5,7
   108b8:	fce7dae3          	bge	a5,a4,1088c <main+0x30>
   108bc:	000127b7          	lui	a5,0x12
   108c0:	0f478513          	addi	a0,a5,244 # 120f4 <__DTOR_END__>
   108c4:	43d000ef          	jal	ra,11500 <puts>
   108c8:	000127b7          	lui	a5,0x12
   108cc:	10478513          	addi	a0,a5,260 # 12104 <__DTOR_END__+0x10>
   108d0:	431000ef          	jal	ra,11500 <puts>
   108d4:	5a8010ef          	jal	ra,11e7c <uart_wait_tx_done>
   108d8:	fe042023          	sw	zero,-32(s0)
   108dc:	fe042483          	lw	s1,-32(s0)
   108e0:	00148793          	addi	a5,s1,1
   108e4:	fef42023          	sw	a5,-32(s0)
   108e8:	508010ef          	jal	ra,11df0 <uart_getchar>
   108ec:	00050793          	mv	a5,a0
   108f0:	00078713          	mv	a4,a5
   108f4:	ff040793          	addi	a5,s0,-16
   108f8:	009787b3          	add	a5,a5,s1
   108fc:	fee78023          	sb	a4,-32(a5)
   10900:	ff040793          	addi	a5,s0,-16
   10904:	009787b3          	add	a5,a5,s1
   10908:	fe07c783          	lbu	a5,-32(a5)
   1090c:	00078513          	mv	a0,a5
   10910:	e41ff0ef          	jal	ra,10750 <is_hex>
   10914:	00050793          	mv	a5,a0
   10918:	02079c63          	bnez	a5,10950 <main+0xf4>
   1091c:	fe042783          	lw	a5,-32(s0)
   10920:	fff78793          	addi	a5,a5,-1
   10924:	ff040713          	addi	a4,s0,-16
   10928:	00f707b3          	add	a5,a4,a5
   1092c:	fe07c703          	lbu	a4,-32(a5)
   10930:	04000793          	li	a5,64
   10934:	02f71663          	bne	a4,a5,10960 <main+0x104>
   10938:	00100793          	li	a5,1
   1093c:	fef42423          	sw	a5,-24(s0)
   10940:	fe042783          	lw	a5,-32(s0)
   10944:	fff78793          	addi	a5,a5,-1
   10948:	fef42023          	sw	a5,-32(s0)
   1094c:	0100006f          	j	1095c <main+0x100>
   10950:	fe042703          	lw	a4,-32(s0)
   10954:	01300793          	li	a5,19
   10958:	00e7c863          	blt	a5,a4,10968 <main+0x10c>
   1095c:	f81ff06f          	j	108dc <main+0x80>
   10960:	00000013          	nop
   10964:	0080006f          	j	1096c <main+0x110>
   10968:	00000013          	nop
   1096c:	fe842783          	lw	a5,-24(s0)
   10970:	02078063          	beqz	a5,10990 <main+0x134>
   10974:	fd040793          	addi	a5,s0,-48
   10978:	00078513          	mv	a0,a5
   1097c:	160000ef          	jal	ra,10adc <str_to_int>
   10980:	00050793          	mv	a5,a0
   10984:	fef42623          	sw	a5,-20(s0)
   10988:	fe042423          	sw	zero,-24(s0)
   1098c:	0600006f          	j	109ec <main+0x190>
   10990:	fc040c23          	sb	zero,-40(s0)
   10994:	fe042783          	lw	a5,-32(s0)
   10998:	fff78793          	addi	a5,a5,-1
   1099c:	ff040713          	addi	a4,s0,-16
   109a0:	00f707b3          	add	a5,a4,a5
   109a4:	fe07c703          	lbu	a4,-32(a5)
   109a8:	07100793          	li	a5,113
   109ac:	04f70263          	beq	a4,a5,109f0 <main+0x194>
   109b0:	fd040793          	addi	a5,s0,-48
   109b4:	00078513          	mv	a0,a5
   109b8:	124000ef          	jal	ra,10adc <str_to_int>
   109bc:	00050793          	mv	a5,a0
   109c0:	fcf42e23          	sw	a5,-36(s0)
   109c4:	fec42783          	lw	a5,-20(s0)
   109c8:	00478713          	addi	a4,a5,4
   109cc:	fee42623          	sw	a4,-20(s0)
   109d0:	fdc42703          	lw	a4,-36(s0)
   109d4:	00e7a023          	sw	a4,0(a5)
   109d8:	fdc42503          	lw	a0,-36(s0)
   109dc:	dedff0ef          	jal	ra,107c8 <one_count>
   109e0:	00050793          	mv	a5,a0
   109e4:	00078513          	mv	a0,a5
   109e8:	44c010ef          	jal	ra,11e34 <uart_sendchar>
   109ec:	eedff06f          	j	108d8 <main+0x7c>
   109f0:	00000013          	nop
   109f4:	02200593          	li	a1,34
   109f8:	000127b7          	lui	a5,0x12
   109fc:	13078513          	addi	a0,a5,304 # 12130 <__DTOR_END__+0x3c>
   10a00:	358010ef          	jal	ra,11d58 <uart_send>
   10a04:	478010ef          	jal	ra,11e7c <uart_wait_tx_done>
   10a08:	1a1077b7          	lui	a5,0x1a107
   10a0c:	00878793          	addi	a5,a5,8 # 1a107008 <_stack_start+0x1a003008>
   10a10:	0007a023          	sw	zero,0(a5)
   10a14:	08000513          	li	a0,128
   10a18:	e11ff0ef          	jal	ra,10828 <jump_and_start>
   10a1c:	000127b7          	lui	a5,0x12
   10a20:	15478513          	addi	a0,a5,340 # 12154 <__DTOR_END__+0x60>
   10a24:	2dd000ef          	jal	ra,11500 <puts>
   10a28:	ff5ff06f          	j	10a1c <main+0x1c0>

00010a2c <hex_to_string>:
   10a2c:	fc010113          	addi	sp,sp,-64
   10a30:	02812e23          	sw	s0,60(sp)
   10a34:	04010413          	addi	s0,sp,64
   10a38:	fca42623          	sw	a0,-52(s0)
   10a3c:	fcb42423          	sw	a1,-56(s0)
   10a40:	000127b7          	lui	a5,0x12
   10a44:	17878793          	addi	a5,a5,376 # 12178 <__DTOR_END__+0x84>
   10a48:	0007a603          	lw	a2,0(a5)
   10a4c:	0047a683          	lw	a3,4(a5)
   10a50:	0087a703          	lw	a4,8(a5)
   10a54:	00c7a783          	lw	a5,12(a5)
   10a58:	fcc42e23          	sw	a2,-36(s0)
   10a5c:	fed42023          	sw	a3,-32(s0)
   10a60:	fee42223          	sw	a4,-28(s0)
   10a64:	fef42423          	sw	a5,-24(s0)
   10a68:	fe042623          	sw	zero,-20(s0)
   10a6c:	0480006f          	j	10ab4 <hex_to_string+0x88>
   10a70:	00700713          	li	a4,7
   10a74:	fec42783          	lw	a5,-20(s0)
   10a78:	40f707b3          	sub	a5,a4,a5
   10a7c:	00279793          	slli	a5,a5,0x2
   10a80:	fc842703          	lw	a4,-56(s0)
   10a84:	00f757b3          	srl	a5,a4,a5
   10a88:	00f7f713          	andi	a4,a5,15
   10a8c:	fec42783          	lw	a5,-20(s0)
   10a90:	fcc42683          	lw	a3,-52(s0)
   10a94:	00f687b3          	add	a5,a3,a5
   10a98:	ff040693          	addi	a3,s0,-16
   10a9c:	00e68733          	add	a4,a3,a4
   10aa0:	fec74703          	lbu	a4,-20(a4)
   10aa4:	00e78023          	sb	a4,0(a5)
   10aa8:	fec42783          	lw	a5,-20(s0)
   10aac:	00178793          	addi	a5,a5,1
   10ab0:	fef42623          	sw	a5,-20(s0)
   10ab4:	fec42703          	lw	a4,-20(s0)
   10ab8:	00700793          	li	a5,7
   10abc:	fae7dae3          	bge	a5,a4,10a70 <hex_to_string+0x44>
   10ac0:	fcc42783          	lw	a5,-52(s0)
   10ac4:	00878793          	addi	a5,a5,8
   10ac8:	00078023          	sb	zero,0(a5)
   10acc:	00000013          	nop
   10ad0:	03c12403          	lw	s0,60(sp)
   10ad4:	04010113          	addi	sp,sp,64
   10ad8:	00008067          	ret

00010adc <str_to_int>:
   10adc:	fd010113          	addi	sp,sp,-48
   10ae0:	02812623          	sw	s0,44(sp)
   10ae4:	03010413          	addi	s0,sp,48
   10ae8:	fca42e23          	sw	a0,-36(s0)
   10aec:	fe042623          	sw	zero,-20(s0)
   10af0:	fe042423          	sw	zero,-24(s0)
   10af4:	1440006f          	j	10c38 <str_to_int+0x15c>
   10af8:	fe842783          	lw	a5,-24(s0)
   10afc:	fdc42703          	lw	a4,-36(s0)
   10b00:	00f707b3          	add	a5,a4,a5
   10b04:	0007c703          	lbu	a4,0(a5)
   10b08:	03900793          	li	a5,57
   10b0c:	04e7ea63          	bltu	a5,a4,10b60 <str_to_int+0x84>
   10b10:	fe842783          	lw	a5,-24(s0)
   10b14:	fdc42703          	lw	a4,-36(s0)
   10b18:	00f707b3          	add	a5,a4,a5
   10b1c:	0007c703          	lbu	a4,0(a5)
   10b20:	02f00793          	li	a5,47
   10b24:	02e7fe63          	bgeu	a5,a4,10b60 <str_to_int+0x84>
   10b28:	fe842783          	lw	a5,-24(s0)
   10b2c:	fdc42703          	lw	a4,-36(s0)
   10b30:	00f707b3          	add	a5,a4,a5
   10b34:	0007c783          	lbu	a5,0(a5)
   10b38:	fd078713          	addi	a4,a5,-48
   10b3c:	00700693          	li	a3,7
   10b40:	fe842783          	lw	a5,-24(s0)
   10b44:	40f687b3          	sub	a5,a3,a5
   10b48:	00279793          	slli	a5,a5,0x2
   10b4c:	00f717b3          	sll	a5,a4,a5
   10b50:	fec42703          	lw	a4,-20(s0)
   10b54:	00f767b3          	or	a5,a4,a5
   10b58:	fef42623          	sw	a5,-20(s0)
   10b5c:	0d00006f          	j	10c2c <str_to_int+0x150>
   10b60:	fe842783          	lw	a5,-24(s0)
   10b64:	fdc42703          	lw	a4,-36(s0)
   10b68:	00f707b3          	add	a5,a4,a5
   10b6c:	0007c703          	lbu	a4,0(a5)
   10b70:	04600793          	li	a5,70
   10b74:	04e7ea63          	bltu	a5,a4,10bc8 <str_to_int+0xec>
   10b78:	fe842783          	lw	a5,-24(s0)
   10b7c:	fdc42703          	lw	a4,-36(s0)
   10b80:	00f707b3          	add	a5,a4,a5
   10b84:	0007c703          	lbu	a4,0(a5)
   10b88:	04000793          	li	a5,64
   10b8c:	02e7fe63          	bgeu	a5,a4,10bc8 <str_to_int+0xec>
   10b90:	fe842783          	lw	a5,-24(s0)
   10b94:	fdc42703          	lw	a4,-36(s0)
   10b98:	00f707b3          	add	a5,a4,a5
   10b9c:	0007c783          	lbu	a5,0(a5)
   10ba0:	fc978713          	addi	a4,a5,-55
   10ba4:	00700693          	li	a3,7
   10ba8:	fe842783          	lw	a5,-24(s0)
   10bac:	40f687b3          	sub	a5,a3,a5
   10bb0:	00279793          	slli	a5,a5,0x2
   10bb4:	00f717b3          	sll	a5,a4,a5
   10bb8:	fec42703          	lw	a4,-20(s0)
   10bbc:	00f767b3          	or	a5,a4,a5
   10bc0:	fef42623          	sw	a5,-20(s0)
   10bc4:	0680006f          	j	10c2c <str_to_int+0x150>
   10bc8:	fe842783          	lw	a5,-24(s0)
   10bcc:	fdc42703          	lw	a4,-36(s0)
   10bd0:	00f707b3          	add	a5,a4,a5
   10bd4:	0007c703          	lbu	a4,0(a5)
   10bd8:	06600793          	li	a5,102
   10bdc:	04e7e863          	bltu	a5,a4,10c2c <str_to_int+0x150>
   10be0:	fe842783          	lw	a5,-24(s0)
   10be4:	fdc42703          	lw	a4,-36(s0)
   10be8:	00f707b3          	add	a5,a4,a5
   10bec:	0007c703          	lbu	a4,0(a5)
   10bf0:	06000793          	li	a5,96
   10bf4:	02e7fc63          	bgeu	a5,a4,10c2c <str_to_int+0x150>
   10bf8:	fe842783          	lw	a5,-24(s0)
   10bfc:	fdc42703          	lw	a4,-36(s0)
   10c00:	00f707b3          	add	a5,a4,a5
   10c04:	0007c783          	lbu	a5,0(a5)
   10c08:	fa978713          	addi	a4,a5,-87
   10c0c:	00700693          	li	a3,7
   10c10:	fe842783          	lw	a5,-24(s0)
   10c14:	40f687b3          	sub	a5,a3,a5
   10c18:	00279793          	slli	a5,a5,0x2
   10c1c:	00f717b3          	sll	a5,a4,a5
   10c20:	fec42703          	lw	a4,-20(s0)
   10c24:	00f767b3          	or	a5,a4,a5
   10c28:	fef42623          	sw	a5,-20(s0)
   10c2c:	fe842783          	lw	a5,-24(s0)
   10c30:	00178793          	addi	a5,a5,1
   10c34:	fef42423          	sw	a5,-24(s0)
   10c38:	fe842703          	lw	a4,-24(s0)
   10c3c:	00700793          	li	a5,7
   10c40:	eae7dce3          	bge	a5,a4,10af8 <str_to_int+0x1c>
   10c44:	fec42783          	lw	a5,-20(s0)
   10c48:	00078513          	mv	a0,a5
   10c4c:	02c12403          	lw	s0,44(sp)
   10c50:	03010113          	addi	sp,sp,48
   10c54:	00008067          	ret

00010c58 <divu10>:
   10c58:	fd010113          	addi	sp,sp,-48
   10c5c:	02812623          	sw	s0,44(sp)
   10c60:	03010413          	addi	s0,sp,48
   10c64:	fca42e23          	sw	a0,-36(s0)
   10c68:	fdc42783          	lw	a5,-36(s0)
   10c6c:	0017d713          	srli	a4,a5,0x1
   10c70:	fdc42783          	lw	a5,-36(s0)
   10c74:	0027d793          	srli	a5,a5,0x2
   10c78:	00f707b3          	add	a5,a4,a5
   10c7c:	fef42623          	sw	a5,-20(s0)
   10c80:	fec42783          	lw	a5,-20(s0)
   10c84:	0047d793          	srli	a5,a5,0x4
   10c88:	fec42703          	lw	a4,-20(s0)
   10c8c:	00f707b3          	add	a5,a4,a5
   10c90:	fef42623          	sw	a5,-20(s0)
   10c94:	fec42783          	lw	a5,-20(s0)
   10c98:	0087d793          	srli	a5,a5,0x8
   10c9c:	fec42703          	lw	a4,-20(s0)
   10ca0:	00f707b3          	add	a5,a4,a5
   10ca4:	fef42623          	sw	a5,-20(s0)
   10ca8:	fec42783          	lw	a5,-20(s0)
   10cac:	0107d793          	srli	a5,a5,0x10
   10cb0:	fec42703          	lw	a4,-20(s0)
   10cb4:	00f707b3          	add	a5,a4,a5
   10cb8:	fef42623          	sw	a5,-20(s0)
   10cbc:	fec42783          	lw	a5,-20(s0)
   10cc0:	0037d793          	srli	a5,a5,0x3
   10cc4:	fef42623          	sw	a5,-20(s0)
   10cc8:	fec42703          	lw	a4,-20(s0)
   10ccc:	00070793          	mv	a5,a4
   10cd0:	00279793          	slli	a5,a5,0x2
   10cd4:	00e787b3          	add	a5,a5,a4
   10cd8:	00179793          	slli	a5,a5,0x1
   10cdc:	00078713          	mv	a4,a5
   10ce0:	fdc42783          	lw	a5,-36(s0)
   10ce4:	40e787b3          	sub	a5,a5,a4
   10ce8:	fef42423          	sw	a5,-24(s0)
   10cec:	fe842783          	lw	a5,-24(s0)
   10cf0:	00678793          	addi	a5,a5,6
   10cf4:	0047d713          	srli	a4,a5,0x4
   10cf8:	fec42783          	lw	a5,-20(s0)
   10cfc:	00f707b3          	add	a5,a4,a5
   10d00:	00078513          	mv	a0,a5
   10d04:	02c12403          	lw	s0,44(sp)
   10d08:	03010113          	addi	sp,sp,48
   10d0c:	00008067          	ret

00010d10 <remu10>:
   10d10:	fe010113          	addi	sp,sp,-32
   10d14:	00812e23          	sw	s0,28(sp)
   10d18:	02010413          	addi	s0,sp,32
   10d1c:	fea42623          	sw	a0,-20(s0)
   10d20:	fec42703          	lw	a4,-20(s0)
   10d24:	1999a7b7          	lui	a5,0x1999a
   10d28:	99978793          	addi	a5,a5,-1639 # 19999999 <_stack_start+0x19895999>
   10d2c:	02f70733          	mul	a4,a4,a5
   10d30:	fec42783          	lw	a5,-20(s0)
   10d34:	0017d793          	srli	a5,a5,0x1
   10d38:	00f70733          	add	a4,a4,a5
   10d3c:	fec42783          	lw	a5,-20(s0)
   10d40:	0037d793          	srli	a5,a5,0x3
   10d44:	00f707b3          	add	a5,a4,a5
   10d48:	01c7d793          	srli	a5,a5,0x1c
   10d4c:	fef42623          	sw	a5,-20(s0)
   10d50:	000127b7          	lui	a5,0x12
   10d54:	21078713          	addi	a4,a5,528 # 12210 <remu10_table>
   10d58:	fec42783          	lw	a5,-20(s0)
   10d5c:	00f707b3          	add	a5,a4,a5
   10d60:	0007c783          	lbu	a5,0(a5)
   10d64:	00078513          	mv	a0,a5
   10d68:	01c12403          	lw	s0,28(sp)
   10d6c:	02010113          	addi	sp,sp,32
   10d70:	00008067          	ret

00010d74 <putchar>:
   10d74:	fe010113          	addi	sp,sp,-32
   10d78:	00112e23          	sw	ra,28(sp)
   10d7c:	00812c23          	sw	s0,24(sp)
   10d80:	02010413          	addi	s0,sp,32
   10d84:	fea42623          	sw	a0,-20(s0)
   10d88:	fec42783          	lw	a5,-20(s0)
   10d8c:	0ff7f793          	andi	a5,a5,255
   10d90:	00078513          	mv	a0,a5
   10d94:	0a0010ef          	jal	ra,11e34 <uart_sendchar>
   10d98:	fec42783          	lw	a5,-20(s0)
   10d9c:	00078513          	mv	a0,a5
   10da0:	01c12083          	lw	ra,28(sp)
   10da4:	01812403          	lw	s0,24(sp)
   10da8:	02010113          	addi	sp,sp,32
   10dac:	00008067          	ret

00010db0 <qprintchar>:
   10db0:	fe010113          	addi	sp,sp,-32
   10db4:	00112e23          	sw	ra,28(sp)
   10db8:	00812c23          	sw	s0,24(sp)
   10dbc:	02010413          	addi	s0,sp,32
   10dc0:	fea42623          	sw	a0,-20(s0)
   10dc4:	feb42423          	sw	a1,-24(s0)
   10dc8:	fec42783          	lw	a5,-20(s0)
   10dcc:	02078863          	beqz	a5,10dfc <qprintchar+0x4c>
   10dd0:	fec42783          	lw	a5,-20(s0)
   10dd4:	0007a783          	lw	a5,0(a5)
   10dd8:	fe842703          	lw	a4,-24(s0)
   10ddc:	0ff77713          	andi	a4,a4,255
   10de0:	00e78023          	sb	a4,0(a5)
   10de4:	fec42783          	lw	a5,-20(s0)
   10de8:	0007a783          	lw	a5,0(a5)
   10dec:	00178713          	addi	a4,a5,1
   10df0:	fec42783          	lw	a5,-20(s0)
   10df4:	00e7a023          	sw	a4,0(a5)
   10df8:	0140006f          	j	10e0c <qprintchar+0x5c>
   10dfc:	fe842783          	lw	a5,-24(s0)
   10e00:	0ff7f793          	andi	a5,a5,255
   10e04:	00078513          	mv	a0,a5
   10e08:	f6dff0ef          	jal	ra,10d74 <putchar>
   10e0c:	00000013          	nop
   10e10:	01c12083          	lw	ra,28(sp)
   10e14:	01812403          	lw	s0,24(sp)
   10e18:	02010113          	addi	sp,sp,32
   10e1c:	00008067          	ret

00010e20 <qprints>:
   10e20:	fd010113          	addi	sp,sp,-48
   10e24:	02112623          	sw	ra,44(sp)
   10e28:	02812423          	sw	s0,40(sp)
   10e2c:	02912223          	sw	s1,36(sp)
   10e30:	03212023          	sw	s2,32(sp)
   10e34:	01312e23          	sw	s3,28(sp)
   10e38:	01412c23          	sw	s4,24(sp)
   10e3c:	03010413          	addi	s0,sp,48
   10e40:	fca42e23          	sw	a0,-36(s0)
   10e44:	fcb42c23          	sw	a1,-40(s0)
   10e48:	fcc42a23          	sw	a2,-44(s0)
   10e4c:	fcd42823          	sw	a3,-48(s0)
   10e50:	00000493          	li	s1,0
   10e54:	02000a13          	li	s4,32
   10e58:	fd442783          	lw	a5,-44(s0)
   10e5c:	04f05663          	blez	a5,10ea8 <qprints+0x88>
   10e60:	00000913          	li	s2,0
   10e64:	fd842983          	lw	s3,-40(s0)
   10e68:	00c0006f          	j	10e74 <qprints+0x54>
   10e6c:	00190913          	addi	s2,s2,1
   10e70:	00198993          	addi	s3,s3,1
   10e74:	0009c783          	lbu	a5,0(s3)
   10e78:	fe079ae3          	bnez	a5,10e6c <qprints+0x4c>
   10e7c:	fd442783          	lw	a5,-44(s0)
   10e80:	00f94663          	blt	s2,a5,10e8c <qprints+0x6c>
   10e84:	fc042a23          	sw	zero,-44(s0)
   10e88:	0100006f          	j	10e98 <qprints+0x78>
   10e8c:	fd442783          	lw	a5,-44(s0)
   10e90:	412787b3          	sub	a5,a5,s2
   10e94:	fcf42a23          	sw	a5,-44(s0)
   10e98:	fd042783          	lw	a5,-48(s0)
   10e9c:	0027f793          	andi	a5,a5,2
   10ea0:	00078463          	beqz	a5,10ea8 <qprints+0x88>
   10ea4:	03000a13          	li	s4,48
   10ea8:	fd042783          	lw	a5,-48(s0)
   10eac:	0017f793          	andi	a5,a5,1
   10eb0:	04079a63          	bnez	a5,10f04 <qprints+0xe4>
   10eb4:	0200006f          	j	10ed4 <qprints+0xb4>
   10eb8:	000a0593          	mv	a1,s4
   10ebc:	fdc42503          	lw	a0,-36(s0)
   10ec0:	ef1ff0ef          	jal	ra,10db0 <qprintchar>
   10ec4:	00148493          	addi	s1,s1,1
   10ec8:	fd442783          	lw	a5,-44(s0)
   10ecc:	fff78793          	addi	a5,a5,-1
   10ed0:	fcf42a23          	sw	a5,-44(s0)
   10ed4:	fd442783          	lw	a5,-44(s0)
   10ed8:	fef040e3          	bgtz	a5,10eb8 <qprints+0x98>
   10edc:	0280006f          	j	10f04 <qprints+0xe4>
   10ee0:	fd842783          	lw	a5,-40(s0)
   10ee4:	0007c783          	lbu	a5,0(a5)
   10ee8:	00078593          	mv	a1,a5
   10eec:	fdc42503          	lw	a0,-36(s0)
   10ef0:	ec1ff0ef          	jal	ra,10db0 <qprintchar>
   10ef4:	00148493          	addi	s1,s1,1
   10ef8:	fd842783          	lw	a5,-40(s0)
   10efc:	00178793          	addi	a5,a5,1
   10f00:	fcf42c23          	sw	a5,-40(s0)
   10f04:	fd842783          	lw	a5,-40(s0)
   10f08:	0007c783          	lbu	a5,0(a5)
   10f0c:	fc079ae3          	bnez	a5,10ee0 <qprints+0xc0>
   10f10:	0200006f          	j	10f30 <qprints+0x110>
   10f14:	000a0593          	mv	a1,s4
   10f18:	fdc42503          	lw	a0,-36(s0)
   10f1c:	e95ff0ef          	jal	ra,10db0 <qprintchar>
   10f20:	00148493          	addi	s1,s1,1
   10f24:	fd442783          	lw	a5,-44(s0)
   10f28:	fff78793          	addi	a5,a5,-1
   10f2c:	fcf42a23          	sw	a5,-44(s0)
   10f30:	fd442783          	lw	a5,-44(s0)
   10f34:	fef040e3          	bgtz	a5,10f14 <qprints+0xf4>
   10f38:	00048793          	mv	a5,s1
   10f3c:	00078513          	mv	a0,a5
   10f40:	02c12083          	lw	ra,44(sp)
   10f44:	02812403          	lw	s0,40(sp)
   10f48:	02412483          	lw	s1,36(sp)
   10f4c:	02012903          	lw	s2,32(sp)
   10f50:	01c12983          	lw	s3,28(sp)
   10f54:	01812a03          	lw	s4,24(sp)
   10f58:	03010113          	addi	sp,sp,48
   10f5c:	00008067          	ret

00010f60 <qprinti>:
   10f60:	f9010113          	addi	sp,sp,-112
   10f64:	06112623          	sw	ra,108(sp)
   10f68:	06812423          	sw	s0,104(sp)
   10f6c:	06912223          	sw	s1,100(sp)
   10f70:	07212023          	sw	s2,96(sp)
   10f74:	05312e23          	sw	s3,92(sp)
   10f78:	07010413          	addi	s0,sp,112
   10f7c:	faa42623          	sw	a0,-84(s0)
   10f80:	fab42423          	sw	a1,-88(s0)
   10f84:	fac42223          	sw	a2,-92(s0)
   10f88:	fad42023          	sw	a3,-96(s0)
   10f8c:	f8e42e23          	sw	a4,-100(s0)
   10f90:	f8f42c23          	sw	a5,-104(s0)
   10f94:	00080793          	mv	a5,a6
   10f98:	f8f40ba3          	sb	a5,-105(s0)
   10f9c:	00000993          	li	s3,0
   10fa0:	00000913          	li	s2,0
   10fa4:	fa842783          	lw	a5,-88(s0)
   10fa8:	fcf42e23          	sw	a5,-36(s0)
   10fac:	fa842783          	lw	a5,-88(s0)
   10fb0:	02079863          	bnez	a5,10fe0 <qprinti+0x80>
   10fb4:	03000793          	li	a5,48
   10fb8:	faf40c23          	sb	a5,-72(s0)
   10fbc:	fa040ca3          	sb	zero,-71(s0)
   10fc0:	fb840793          	addi	a5,s0,-72
   10fc4:	f9842683          	lw	a3,-104(s0)
   10fc8:	f9c42603          	lw	a2,-100(s0)
   10fcc:	00078593          	mv	a1,a5
   10fd0:	fac42503          	lw	a0,-84(s0)
   10fd4:	e4dff0ef          	jal	ra,10e20 <qprints>
   10fd8:	00050793          	mv	a5,a0
   10fdc:	13c0006f          	j	11118 <qprinti+0x1b8>
   10fe0:	fa042783          	lw	a5,-96(s0)
   10fe4:	02078463          	beqz	a5,1100c <qprinti+0xac>
   10fe8:	fa442703          	lw	a4,-92(s0)
   10fec:	00a00793          	li	a5,10
   10ff0:	00f71e63          	bne	a4,a5,1100c <qprinti+0xac>
   10ff4:	fa842783          	lw	a5,-88(s0)
   10ff8:	0007da63          	bgez	a5,1100c <qprinti+0xac>
   10ffc:	00100993          	li	s3,1
   11000:	fa842783          	lw	a5,-88(s0)
   11004:	40f007b3          	neg	a5,a5
   11008:	fcf42e23          	sw	a5,-36(s0)
   1100c:	fb840493          	addi	s1,s0,-72
   11010:	01f48493          	addi	s1,s1,31
   11014:	00048023          	sb	zero,0(s1)
   11018:	fa442703          	lw	a4,-92(s0)
   1101c:	01000793          	li	a5,16
   11020:	08f71863          	bne	a4,a5,110b0 <qprinti+0x150>
   11024:	0540006f          	j	11078 <qprinti+0x118>
   11028:	fdc42783          	lw	a5,-36(s0)
   1102c:	00f7f793          	andi	a5,a5,15
   11030:	fcf42c23          	sw	a5,-40(s0)
   11034:	fd842703          	lw	a4,-40(s0)
   11038:	00900793          	li	a5,9
   1103c:	00e7dc63          	bge	a5,a4,11054 <qprinti+0xf4>
   11040:	f9744783          	lbu	a5,-105(s0)
   11044:	fc678793          	addi	a5,a5,-58
   11048:	fd842703          	lw	a4,-40(s0)
   1104c:	00f707b3          	add	a5,a4,a5
   11050:	fcf42c23          	sw	a5,-40(s0)
   11054:	fd842783          	lw	a5,-40(s0)
   11058:	0ff7f793          	andi	a5,a5,255
   1105c:	fff48493          	addi	s1,s1,-1
   11060:	03078793          	addi	a5,a5,48
   11064:	0ff7f793          	andi	a5,a5,255
   11068:	00f48023          	sb	a5,0(s1)
   1106c:	fdc42783          	lw	a5,-36(s0)
   11070:	0047d793          	srli	a5,a5,0x4
   11074:	fcf42e23          	sw	a5,-36(s0)
   11078:	fdc42783          	lw	a5,-36(s0)
   1107c:	fa0796e3          	bnez	a5,11028 <qprinti+0xc8>
   11080:	0380006f          	j	110b8 <qprinti+0x158>
   11084:	fdc42503          	lw	a0,-36(s0)
   11088:	c89ff0ef          	jal	ra,10d10 <remu10>
   1108c:	00050793          	mv	a5,a0
   11090:	0ff7f793          	andi	a5,a5,255
   11094:	fff48493          	addi	s1,s1,-1
   11098:	03078793          	addi	a5,a5,48
   1109c:	0ff7f793          	andi	a5,a5,255
   110a0:	00f48023          	sb	a5,0(s1)
   110a4:	fdc42503          	lw	a0,-36(s0)
   110a8:	bb1ff0ef          	jal	ra,10c58 <divu10>
   110ac:	fca42e23          	sw	a0,-36(s0)
   110b0:	fdc42783          	lw	a5,-36(s0)
   110b4:	fc0798e3          	bnez	a5,11084 <qprinti+0x124>
   110b8:	04098263          	beqz	s3,110fc <qprinti+0x19c>
   110bc:	f9c42783          	lw	a5,-100(s0)
   110c0:	02078863          	beqz	a5,110f0 <qprinti+0x190>
   110c4:	f9842783          	lw	a5,-104(s0)
   110c8:	0027f793          	andi	a5,a5,2
   110cc:	02078263          	beqz	a5,110f0 <qprinti+0x190>
   110d0:	02d00593          	li	a1,45
   110d4:	fac42503          	lw	a0,-84(s0)
   110d8:	cd9ff0ef          	jal	ra,10db0 <qprintchar>
   110dc:	00190913          	addi	s2,s2,1
   110e0:	f9c42783          	lw	a5,-100(s0)
   110e4:	fff78793          	addi	a5,a5,-1
   110e8:	f8f42e23          	sw	a5,-100(s0)
   110ec:	0100006f          	j	110fc <qprinti+0x19c>
   110f0:	fff48493          	addi	s1,s1,-1
   110f4:	02d00793          	li	a5,45
   110f8:	00f48023          	sb	a5,0(s1)
   110fc:	f9842683          	lw	a3,-104(s0)
   11100:	f9c42603          	lw	a2,-100(s0)
   11104:	00048593          	mv	a1,s1
   11108:	fac42503          	lw	a0,-84(s0)
   1110c:	d15ff0ef          	jal	ra,10e20 <qprints>
   11110:	00050793          	mv	a5,a0
   11114:	00f907b3          	add	a5,s2,a5
   11118:	00078513          	mv	a0,a5
   1111c:	06c12083          	lw	ra,108(sp)
   11120:	06812403          	lw	s0,104(sp)
   11124:	06412483          	lw	s1,100(sp)
   11128:	06012903          	lw	s2,96(sp)
   1112c:	05c12983          	lw	s3,92(sp)
   11130:	07010113          	addi	sp,sp,112
   11134:	00008067          	ret

00011138 <qprint>:
   11138:	fc010113          	addi	sp,sp,-64
   1113c:	02112e23          	sw	ra,60(sp)
   11140:	02812c23          	sw	s0,56(sp)
   11144:	02912a23          	sw	s1,52(sp)
   11148:	03212823          	sw	s2,48(sp)
   1114c:	03312623          	sw	s3,44(sp)
   11150:	04010413          	addi	s0,sp,64
   11154:	fca42623          	sw	a0,-52(s0)
   11158:	fcb42423          	sw	a1,-56(s0)
   1115c:	fcc42223          	sw	a2,-60(s0)
   11160:	00000493          	li	s1,0
   11164:	2dc0006f          	j	11440 <qprint+0x308>
   11168:	fc842783          	lw	a5,-56(s0)
   1116c:	0007c703          	lbu	a4,0(a5)
   11170:	02500793          	li	a5,37
   11174:	28f71e63          	bne	a4,a5,11410 <qprint+0x2d8>
   11178:	fc842783          	lw	a5,-56(s0)
   1117c:	00178793          	addi	a5,a5,1
   11180:	fcf42423          	sw	a5,-56(s0)
   11184:	00000993          	li	s3,0
   11188:	00098913          	mv	s2,s3
   1118c:	fc842783          	lw	a5,-56(s0)
   11190:	0007c783          	lbu	a5,0(a5)
   11194:	2a078e63          	beqz	a5,11450 <qprint+0x318>
   11198:	fc842783          	lw	a5,-56(s0)
   1119c:	0007c703          	lbu	a4,0(a5)
   111a0:	02500793          	li	a5,37
   111a4:	26f70a63          	beq	a4,a5,11418 <qprint+0x2e0>
   111a8:	fc842783          	lw	a5,-56(s0)
   111ac:	0007c703          	lbu	a4,0(a5)
   111b0:	02d00793          	li	a5,45
   111b4:	02f71463          	bne	a4,a5,111dc <qprint+0xa4>
   111b8:	fc842783          	lw	a5,-56(s0)
   111bc:	00178793          	addi	a5,a5,1
   111c0:	fcf42423          	sw	a5,-56(s0)
   111c4:	00100993          	li	s3,1
   111c8:	0140006f          	j	111dc <qprint+0xa4>
   111cc:	fc842783          	lw	a5,-56(s0)
   111d0:	00178793          	addi	a5,a5,1
   111d4:	fcf42423          	sw	a5,-56(s0)
   111d8:	0029e993          	ori	s3,s3,2
   111dc:	fc842783          	lw	a5,-56(s0)
   111e0:	0007c703          	lbu	a4,0(a5)
   111e4:	03000793          	li	a5,48
   111e8:	fef702e3          	beq	a4,a5,111cc <qprint+0x94>
   111ec:	0340006f          	j	11220 <qprint+0xe8>
   111f0:	00090793          	mv	a5,s2
   111f4:	00279793          	slli	a5,a5,0x2
   111f8:	012787b3          	add	a5,a5,s2
   111fc:	00179793          	slli	a5,a5,0x1
   11200:	00078913          	mv	s2,a5
   11204:	fc842783          	lw	a5,-56(s0)
   11208:	0007c783          	lbu	a5,0(a5)
   1120c:	fd078793          	addi	a5,a5,-48
   11210:	00f90933          	add	s2,s2,a5
   11214:	fc842783          	lw	a5,-56(s0)
   11218:	00178793          	addi	a5,a5,1
   1121c:	fcf42423          	sw	a5,-56(s0)
   11220:	fc842783          	lw	a5,-56(s0)
   11224:	0007c703          	lbu	a4,0(a5)
   11228:	02f00793          	li	a5,47
   1122c:	00e7fa63          	bgeu	a5,a4,11240 <qprint+0x108>
   11230:	fc842783          	lw	a5,-56(s0)
   11234:	0007c703          	lbu	a4,0(a5)
   11238:	03900793          	li	a5,57
   1123c:	fae7fae3          	bgeu	a5,a4,111f0 <qprint+0xb8>
   11240:	fc842783          	lw	a5,-56(s0)
   11244:	0007c703          	lbu	a4,0(a5)
   11248:	07300793          	li	a5,115
   1124c:	04f71463          	bne	a4,a5,11294 <qprint+0x15c>
   11250:	fc442783          	lw	a5,-60(s0)
   11254:	00478713          	addi	a4,a5,4
   11258:	fce42223          	sw	a4,-60(s0)
   1125c:	0007a083          	lw	ra,0(a5)
   11260:	00008663          	beqz	ra,1126c <qprint+0x134>
   11264:	00008793          	mv	a5,ra
   11268:	00c0006f          	j	11274 <qprint+0x13c>
   1126c:	000127b7          	lui	a5,0x12
   11270:	18878793          	addi	a5,a5,392 # 12188 <__DTOR_END__+0x94>
   11274:	00098693          	mv	a3,s3
   11278:	00090613          	mv	a2,s2
   1127c:	00078593          	mv	a1,a5
   11280:	fcc42503          	lw	a0,-52(s0)
   11284:	b9dff0ef          	jal	ra,10e20 <qprints>
   11288:	00050793          	mv	a5,a0
   1128c:	00f484b3          	add	s1,s1,a5
   11290:	1a40006f          	j	11434 <qprint+0x2fc>
   11294:	fc842783          	lw	a5,-56(s0)
   11298:	0007c703          	lbu	a4,0(a5)
   1129c:	06400793          	li	a5,100
   112a0:	02f71e63          	bne	a4,a5,112dc <qprint+0x1a4>
   112a4:	fc442783          	lw	a5,-60(s0)
   112a8:	00478713          	addi	a4,a5,4
   112ac:	fce42223          	sw	a4,-60(s0)
   112b0:	0007a583          	lw	a1,0(a5)
   112b4:	06100813          	li	a6,97
   112b8:	00098793          	mv	a5,s3
   112bc:	00090713          	mv	a4,s2
   112c0:	00100693          	li	a3,1
   112c4:	00a00613          	li	a2,10
   112c8:	fcc42503          	lw	a0,-52(s0)
   112cc:	c95ff0ef          	jal	ra,10f60 <qprinti>
   112d0:	00050793          	mv	a5,a0
   112d4:	00f484b3          	add	s1,s1,a5
   112d8:	15c0006f          	j	11434 <qprint+0x2fc>
   112dc:	fc842783          	lw	a5,-56(s0)
   112e0:	0007c703          	lbu	a4,0(a5)
   112e4:	07500793          	li	a5,117
   112e8:	04f71063          	bne	a4,a5,11328 <qprint+0x1f0>
   112ec:	fc442783          	lw	a5,-60(s0)
   112f0:	00478713          	addi	a4,a5,4
   112f4:	fce42223          	sw	a4,-60(s0)
   112f8:	0007a783          	lw	a5,0(a5)
   112fc:	00078593          	mv	a1,a5
   11300:	06100813          	li	a6,97
   11304:	00098793          	mv	a5,s3
   11308:	00090713          	mv	a4,s2
   1130c:	00000693          	li	a3,0
   11310:	00a00613          	li	a2,10
   11314:	fcc42503          	lw	a0,-52(s0)
   11318:	c49ff0ef          	jal	ra,10f60 <qprinti>
   1131c:	00050793          	mv	a5,a0
   11320:	00f484b3          	add	s1,s1,a5
   11324:	1100006f          	j	11434 <qprint+0x2fc>
   11328:	fc842783          	lw	a5,-56(s0)
   1132c:	0007c703          	lbu	a4,0(a5)
   11330:	07800793          	li	a5,120
   11334:	04f71063          	bne	a4,a5,11374 <qprint+0x23c>
   11338:	fc442783          	lw	a5,-60(s0)
   1133c:	00478713          	addi	a4,a5,4
   11340:	fce42223          	sw	a4,-60(s0)
   11344:	0007a783          	lw	a5,0(a5)
   11348:	00078593          	mv	a1,a5
   1134c:	06100813          	li	a6,97
   11350:	00098793          	mv	a5,s3
   11354:	00090713          	mv	a4,s2
   11358:	00000693          	li	a3,0
   1135c:	01000613          	li	a2,16
   11360:	fcc42503          	lw	a0,-52(s0)
   11364:	bfdff0ef          	jal	ra,10f60 <qprinti>
   11368:	00050793          	mv	a5,a0
   1136c:	00f484b3          	add	s1,s1,a5
   11370:	0c40006f          	j	11434 <qprint+0x2fc>
   11374:	fc842783          	lw	a5,-56(s0)
   11378:	0007c703          	lbu	a4,0(a5)
   1137c:	05800793          	li	a5,88
   11380:	04f71063          	bne	a4,a5,113c0 <qprint+0x288>
   11384:	fc442783          	lw	a5,-60(s0)
   11388:	00478713          	addi	a4,a5,4
   1138c:	fce42223          	sw	a4,-60(s0)
   11390:	0007a783          	lw	a5,0(a5)
   11394:	00078593          	mv	a1,a5
   11398:	04100813          	li	a6,65
   1139c:	00098793          	mv	a5,s3
   113a0:	00090713          	mv	a4,s2
   113a4:	00000693          	li	a3,0
   113a8:	01000613          	li	a2,16
   113ac:	fcc42503          	lw	a0,-52(s0)
   113b0:	bb1ff0ef          	jal	ra,10f60 <qprinti>
   113b4:	00050793          	mv	a5,a0
   113b8:	00f484b3          	add	s1,s1,a5
   113bc:	0780006f          	j	11434 <qprint+0x2fc>
   113c0:	fc842783          	lw	a5,-56(s0)
   113c4:	0007c703          	lbu	a4,0(a5)
   113c8:	06300793          	li	a5,99
   113cc:	06f71463          	bne	a4,a5,11434 <qprint+0x2fc>
   113d0:	fc442783          	lw	a5,-60(s0)
   113d4:	00478713          	addi	a4,a5,4
   113d8:	fce42223          	sw	a4,-60(s0)
   113dc:	0007a783          	lw	a5,0(a5)
   113e0:	0ff7f793          	andi	a5,a5,255
   113e4:	fcf40e23          	sb	a5,-36(s0)
   113e8:	fc040ea3          	sb	zero,-35(s0)
   113ec:	fdc40793          	addi	a5,s0,-36
   113f0:	00098693          	mv	a3,s3
   113f4:	00090613          	mv	a2,s2
   113f8:	00078593          	mv	a1,a5
   113fc:	fcc42503          	lw	a0,-52(s0)
   11400:	a21ff0ef          	jal	ra,10e20 <qprints>
   11404:	00050793          	mv	a5,a0
   11408:	00f484b3          	add	s1,s1,a5
   1140c:	0280006f          	j	11434 <qprint+0x2fc>
   11410:	00000013          	nop
   11414:	0080006f          	j	1141c <qprint+0x2e4>
   11418:	00000013          	nop
   1141c:	fc842783          	lw	a5,-56(s0)
   11420:	0007c783          	lbu	a5,0(a5)
   11424:	00078593          	mv	a1,a5
   11428:	fcc42503          	lw	a0,-52(s0)
   1142c:	985ff0ef          	jal	ra,10db0 <qprintchar>
   11430:	00148493          	addi	s1,s1,1
   11434:	fc842783          	lw	a5,-56(s0)
   11438:	00178793          	addi	a5,a5,1
   1143c:	fcf42423          	sw	a5,-56(s0)
   11440:	fc842783          	lw	a5,-56(s0)
   11444:	0007c783          	lbu	a5,0(a5)
   11448:	d20790e3          	bnez	a5,11168 <qprint+0x30>
   1144c:	0080006f          	j	11454 <qprint+0x31c>
   11450:	00000013          	nop
   11454:	fcc42783          	lw	a5,-52(s0)
   11458:	00078863          	beqz	a5,11468 <qprint+0x330>
   1145c:	fcc42783          	lw	a5,-52(s0)
   11460:	0007a783          	lw	a5,0(a5)
   11464:	00078023          	sb	zero,0(a5)
   11468:	00048793          	mv	a5,s1
   1146c:	00078513          	mv	a0,a5
   11470:	03c12083          	lw	ra,60(sp)
   11474:	03812403          	lw	s0,56(sp)
   11478:	03412483          	lw	s1,52(sp)
   1147c:	03012903          	lw	s2,48(sp)
   11480:	02c12983          	lw	s3,44(sp)
   11484:	04010113          	addi	sp,sp,64
   11488:	00008067          	ret

0001148c <printf>:
   1148c:	fb010113          	addi	sp,sp,-80
   11490:	02112623          	sw	ra,44(sp)
   11494:	02812423          	sw	s0,40(sp)
   11498:	03010413          	addi	s0,sp,48
   1149c:	fca42e23          	sw	a0,-36(s0)
   114a0:	00b42223          	sw	a1,4(s0)
   114a4:	00c42423          	sw	a2,8(s0)
   114a8:	00d42623          	sw	a3,12(s0)
   114ac:	00e42823          	sw	a4,16(s0)
   114b0:	00f42a23          	sw	a5,20(s0)
   114b4:	01042c23          	sw	a6,24(s0)
   114b8:	01142e23          	sw	a7,28(s0)
   114bc:	02040793          	addi	a5,s0,32
   114c0:	fcf42c23          	sw	a5,-40(s0)
   114c4:	fd842783          	lw	a5,-40(s0)
   114c8:	fe478793          	addi	a5,a5,-28
   114cc:	fef42423          	sw	a5,-24(s0)
   114d0:	fe842783          	lw	a5,-24(s0)
   114d4:	00078613          	mv	a2,a5
   114d8:	fdc42583          	lw	a1,-36(s0)
   114dc:	00000513          	li	a0,0
   114e0:	c59ff0ef          	jal	ra,11138 <qprint>
   114e4:	fea42623          	sw	a0,-20(s0)
   114e8:	fec42783          	lw	a5,-20(s0)
   114ec:	00078513          	mv	a0,a5
   114f0:	02c12083          	lw	ra,44(sp)
   114f4:	02812403          	lw	s0,40(sp)
   114f8:	05010113          	addi	sp,sp,80
   114fc:	00008067          	ret

00011500 <puts>:
   11500:	fd010113          	addi	sp,sp,-48
   11504:	02112623          	sw	ra,44(sp)
   11508:	02812423          	sw	s0,40(sp)
   1150c:	03010413          	addi	s0,sp,48
   11510:	fca42e23          	sw	a0,-36(s0)
   11514:	fe042623          	sw	zero,-20(s0)
   11518:	0280006f          	j	11540 <puts+0x40>
   1151c:	fec42783          	lw	a5,-20(s0)
   11520:	00178713          	addi	a4,a5,1
   11524:	fee42623          	sw	a4,-20(s0)
   11528:	00078713          	mv	a4,a5
   1152c:	fdc42783          	lw	a5,-36(s0)
   11530:	00e787b3          	add	a5,a5,a4
   11534:	0007c783          	lbu	a5,0(a5)
   11538:	00078513          	mv	a0,a5
   1153c:	839ff0ef          	jal	ra,10d74 <putchar>
   11540:	fec42783          	lw	a5,-20(s0)
   11544:	fdc42703          	lw	a4,-36(s0)
   11548:	00f707b3          	add	a5,a4,a5
   1154c:	0007c783          	lbu	a5,0(a5)
   11550:	fc0796e3          	bnez	a5,1151c <puts+0x1c>
   11554:	00a00513          	li	a0,10
   11558:	81dff0ef          	jal	ra,10d74 <putchar>
   1155c:	fec42783          	lw	a5,-20(s0)
   11560:	00078513          	mv	a0,a5
   11564:	02c12083          	lw	ra,44(sp)
   11568:	02812403          	lw	s0,40(sp)
   1156c:	03010113          	addi	sp,sp,48
   11570:	00008067          	ret

00011574 <strcmp>:
   11574:	fd010113          	addi	sp,sp,-48
   11578:	02812623          	sw	s0,44(sp)
   1157c:	03010413          	addi	s0,sp,48
   11580:	fca42e23          	sw	a0,-36(s0)
   11584:	fcb42c23          	sw	a1,-40(s0)
   11588:	fdc42703          	lw	a4,-36(s0)
   1158c:	fd842783          	lw	a5,-40(s0)
   11590:	00f767b3          	or	a5,a4,a5
   11594:	0037f793          	andi	a5,a5,3
   11598:	0a079663          	bnez	a5,11644 <strcmp+0xd0>
   1159c:	fdc42783          	lw	a5,-36(s0)
   115a0:	fef42623          	sw	a5,-20(s0)
   115a4:	fd842783          	lw	a5,-40(s0)
   115a8:	fef42423          	sw	a5,-24(s0)
   115ac:	0580006f          	j	11604 <strcmp+0x90>
   115b0:	fec42783          	lw	a5,-20(s0)
   115b4:	0007a703          	lw	a4,0(a5)
   115b8:	feff07b7          	lui	a5,0xfeff0
   115bc:	eff78793          	addi	a5,a5,-257 # fefefeff <_stack_start+0xfeeebeff>
   115c0:	00f70733          	add	a4,a4,a5
   115c4:	fec42783          	lw	a5,-20(s0)
   115c8:	0007a783          	lw	a5,0(a5)
   115cc:	fff7c793          	not	a5,a5
   115d0:	00f77733          	and	a4,a4,a5
   115d4:	808087b7          	lui	a5,0x80808
   115d8:	08078793          	addi	a5,a5,128 # 80808080 <_stack_start+0x80704080>
   115dc:	00f777b3          	and	a5,a4,a5
   115e0:	00078663          	beqz	a5,115ec <strcmp+0x78>
   115e4:	00000793          	li	a5,0
   115e8:	0940006f          	j	1167c <strcmp+0x108>
   115ec:	fec42783          	lw	a5,-20(s0)
   115f0:	00478793          	addi	a5,a5,4
   115f4:	fef42623          	sw	a5,-20(s0)
   115f8:	fe842783          	lw	a5,-24(s0)
   115fc:	00478793          	addi	a5,a5,4
   11600:	fef42423          	sw	a5,-24(s0)
   11604:	fec42783          	lw	a5,-20(s0)
   11608:	0007a703          	lw	a4,0(a5)
   1160c:	fe842783          	lw	a5,-24(s0)
   11610:	0007a783          	lw	a5,0(a5)
   11614:	f8f70ee3          	beq	a4,a5,115b0 <strcmp+0x3c>
   11618:	fec42783          	lw	a5,-20(s0)
   1161c:	fcf42e23          	sw	a5,-36(s0)
   11620:	fe842783          	lw	a5,-24(s0)
   11624:	fcf42c23          	sw	a5,-40(s0)
   11628:	01c0006f          	j	11644 <strcmp+0xd0>
   1162c:	fdc42783          	lw	a5,-36(s0)
   11630:	00178793          	addi	a5,a5,1
   11634:	fcf42e23          	sw	a5,-36(s0)
   11638:	fd842783          	lw	a5,-40(s0)
   1163c:	00178793          	addi	a5,a5,1
   11640:	fcf42c23          	sw	a5,-40(s0)
   11644:	fdc42783          	lw	a5,-36(s0)
   11648:	0007c783          	lbu	a5,0(a5)
   1164c:	00078c63          	beqz	a5,11664 <strcmp+0xf0>
   11650:	fdc42783          	lw	a5,-36(s0)
   11654:	0007c703          	lbu	a4,0(a5)
   11658:	fd842783          	lw	a5,-40(s0)
   1165c:	0007c783          	lbu	a5,0(a5)
   11660:	fcf706e3          	beq	a4,a5,1162c <strcmp+0xb8>
   11664:	fdc42783          	lw	a5,-36(s0)
   11668:	0007c783          	lbu	a5,0(a5)
   1166c:	00078713          	mv	a4,a5
   11670:	fd842783          	lw	a5,-40(s0)
   11674:	0007c783          	lbu	a5,0(a5)
   11678:	40f707b3          	sub	a5,a4,a5
   1167c:	00078513          	mv	a0,a5
   11680:	02c12403          	lw	s0,44(sp)
   11684:	03010113          	addi	sp,sp,48
   11688:	00008067          	ret

0001168c <memset>:
   1168c:	fd010113          	addi	sp,sp,-48
   11690:	02812623          	sw	s0,44(sp)
   11694:	03010413          	addi	s0,sp,48
   11698:	fca42e23          	sw	a0,-36(s0)
   1169c:	fcb42c23          	sw	a1,-40(s0)
   116a0:	fcc42a23          	sw	a2,-44(s0)
   116a4:	fdc42783          	lw	a5,-36(s0)
   116a8:	fef42623          	sw	a5,-20(s0)
   116ac:	0280006f          	j	116d4 <memset+0x48>
   116b0:	fec42783          	lw	a5,-20(s0)
   116b4:	00178713          	addi	a4,a5,1
   116b8:	fee42623          	sw	a4,-20(s0)
   116bc:	fd842703          	lw	a4,-40(s0)
   116c0:	0ff77713          	andi	a4,a4,255
   116c4:	00e78023          	sb	a4,0(a5)
   116c8:	fd442783          	lw	a5,-44(s0)
   116cc:	fff78793          	addi	a5,a5,-1
   116d0:	fcf42a23          	sw	a5,-44(s0)
   116d4:	fd442783          	lw	a5,-44(s0)
   116d8:	fc079ce3          	bnez	a5,116b0 <memset+0x24>
   116dc:	fdc42783          	lw	a5,-36(s0)
   116e0:	00078513          	mv	a0,a5
   116e4:	02c12403          	lw	s0,44(sp)
   116e8:	03010113          	addi	sp,sp,48
   116ec:	00008067          	ret

000116f0 <strcpy>:
   116f0:	fd010113          	addi	sp,sp,-48
   116f4:	02812623          	sw	s0,44(sp)
   116f8:	03010413          	addi	s0,sp,48
   116fc:	fca42e23          	sw	a0,-36(s0)
   11700:	fcb42c23          	sw	a1,-40(s0)
   11704:	fdc42783          	lw	a5,-36(s0)
   11708:	fef42623          	sw	a5,-20(s0)
   1170c:	fd842783          	lw	a5,-40(s0)
   11710:	fef42423          	sw	a5,-24(s0)
   11714:	02c0006f          	j	11740 <strcpy+0x50>
   11718:	fe842783          	lw	a5,-24(s0)
   1171c:	0007c703          	lbu	a4,0(a5)
   11720:	fec42783          	lw	a5,-20(s0)
   11724:	00e78023          	sb	a4,0(a5)
   11728:	fec42783          	lw	a5,-20(s0)
   1172c:	00178793          	addi	a5,a5,1
   11730:	fef42623          	sw	a5,-20(s0)
   11734:	fe842783          	lw	a5,-24(s0)
   11738:	00178793          	addi	a5,a5,1
   1173c:	fef42423          	sw	a5,-24(s0)
   11740:	fe842783          	lw	a5,-24(s0)
   11744:	0007c783          	lbu	a5,0(a5)
   11748:	fc0798e3          	bnez	a5,11718 <strcpy+0x28>
   1174c:	fdc42783          	lw	a5,-36(s0)
   11750:	00078513          	mv	a0,a5
   11754:	02c12403          	lw	s0,44(sp)
   11758:	03010113          	addi	sp,sp,48
   1175c:	00008067          	ret

00011760 <strlen>:
   11760:	fd010113          	addi	sp,sp,-48
   11764:	02812623          	sw	s0,44(sp)
   11768:	03010413          	addi	s0,sp,48
   1176c:	fca42e23          	sw	a0,-36(s0)
   11770:	fdc42783          	lw	a5,-36(s0)
   11774:	fef42623          	sw	a5,-20(s0)
   11778:	fe042423          	sw	zero,-24(s0)
   1177c:	fec42783          	lw	a5,-20(s0)
   11780:	00079c63          	bnez	a5,11798 <strlen+0x38>
   11784:	00000793          	li	a5,0
   11788:	0280006f          	j	117b0 <strlen+0x50>
   1178c:	fe842783          	lw	a5,-24(s0)
   11790:	00178793          	addi	a5,a5,1
   11794:	fef42423          	sw	a5,-24(s0)
   11798:	fec42783          	lw	a5,-20(s0)
   1179c:	00178713          	addi	a4,a5,1
   117a0:	fee42623          	sw	a4,-20(s0)
   117a4:	0007c783          	lbu	a5,0(a5)
   117a8:	fe0792e3          	bnez	a5,1178c <strlen+0x2c>
   117ac:	fe842783          	lw	a5,-24(s0)
   117b0:	00078513          	mv	a0,a5
   117b4:	02c12403          	lw	s0,44(sp)
   117b8:	03010113          	addi	sp,sp,48
   117bc:	00008067          	ret

000117c0 <spi_setup_slave>:
   117c0:	ff010113          	addi	sp,sp,-16
   117c4:	00112623          	sw	ra,12(sp)
   117c8:	00812423          	sw	s0,8(sp)
   117cc:	01010413          	addi	s0,sp,16
   117d0:	00000593          	li	a1,0
   117d4:	00400513          	li	a0,4
   117d8:	afdfe0ef          	jal	ra,102d4 <set_pin_function>
   117dc:	00000593          	li	a1,0
   117e0:	00500513          	li	a0,5
   117e4:	af1fe0ef          	jal	ra,102d4 <set_pin_function>
   117e8:	00000593          	li	a1,0
   117ec:	00600513          	li	a0,6
   117f0:	ae5fe0ef          	jal	ra,102d4 <set_pin_function>
   117f4:	00000593          	li	a1,0
   117f8:	00700513          	li	a0,7
   117fc:	ad9fe0ef          	jal	ra,102d4 <set_pin_function>
   11800:	00000593          	li	a1,0
   11804:	00300513          	li	a0,3
   11808:	acdfe0ef          	jal	ra,102d4 <set_pin_function>
   1180c:	00000013          	nop
   11810:	00c12083          	lw	ra,12(sp)
   11814:	00812403          	lw	s0,8(sp)
   11818:	01010113          	addi	sp,sp,16
   1181c:	00008067          	ret

00011820 <spi_setup_master>:
   11820:	fe010113          	addi	sp,sp,-32
   11824:	00112e23          	sw	ra,28(sp)
   11828:	00812c23          	sw	s0,24(sp)
   1182c:	02010413          	addi	s0,sp,32
   11830:	fea42623          	sw	a0,-20(s0)
   11834:	00000593          	li	a1,0
   11838:	00f00513          	li	a0,15
   1183c:	a99fe0ef          	jal	ra,102d4 <set_pin_function>
   11840:	00000593          	li	a1,0
   11844:	00e00513          	li	a0,14
   11848:	a8dfe0ef          	jal	ra,102d4 <set_pin_function>
   1184c:	00000593          	li	a1,0
   11850:	00d00513          	li	a0,13
   11854:	a81fe0ef          	jal	ra,102d4 <set_pin_function>
   11858:	00000593          	li	a1,0
   1185c:	00c00513          	li	a0,12
   11860:	a75fe0ef          	jal	ra,102d4 <set_pin_function>
   11864:	fec42783          	lw	a5,-20(s0)
   11868:	00f05863          	blez	a5,11878 <spi_setup_master+0x58>
   1186c:	00000593          	li	a1,0
   11870:	01000513          	li	a0,16
   11874:	a61fe0ef          	jal	ra,102d4 <set_pin_function>
   11878:	fec42703          	lw	a4,-20(s0)
   1187c:	00100793          	li	a5,1
   11880:	00e7d863          	bge	a5,a4,11890 <spi_setup_master+0x70>
   11884:	00000593          	li	a1,0
   11888:	00b00513          	li	a0,11
   1188c:	a49fe0ef          	jal	ra,102d4 <set_pin_function>
   11890:	fec42703          	lw	a4,-20(s0)
   11894:	00200793          	li	a5,2
   11898:	00e7d863          	bge	a5,a4,118a8 <spi_setup_master+0x88>
   1189c:	00000593          	li	a1,0
   118a0:	00000513          	li	a0,0
   118a4:	a31fe0ef          	jal	ra,102d4 <set_pin_function>
   118a8:	fec42703          	lw	a4,-20(s0)
   118ac:	00300793          	li	a5,3
   118b0:	00e7d863          	bge	a5,a4,118c0 <spi_setup_master+0xa0>
   118b4:	00000593          	li	a1,0
   118b8:	00100513          	li	a0,1
   118bc:	a19fe0ef          	jal	ra,102d4 <set_pin_function>
   118c0:	00000013          	nop
   118c4:	01c12083          	lw	ra,28(sp)
   118c8:	01812403          	lw	s0,24(sp)
   118cc:	02010113          	addi	sp,sp,32
   118d0:	00008067          	ret

000118d4 <spi_setup_cmd_addr>:
   118d4:	fd010113          	addi	sp,sp,-48
   118d8:	02812623          	sw	s0,44(sp)
   118dc:	03010413          	addi	s0,sp,48
   118e0:	fca42e23          	sw	a0,-36(s0)
   118e4:	fcb42c23          	sw	a1,-40(s0)
   118e8:	fcc42a23          	sw	a2,-44(s0)
   118ec:	fcd42823          	sw	a3,-48(s0)
   118f0:	02000713          	li	a4,32
   118f4:	fd842783          	lw	a5,-40(s0)
   118f8:	40f707b3          	sub	a5,a4,a5
   118fc:	fdc42703          	lw	a4,-36(s0)
   11900:	00f717b3          	sll	a5,a4,a5
   11904:	fef42623          	sw	a5,-20(s0)
   11908:	1a1027b7          	lui	a5,0x1a102
   1190c:	00878793          	addi	a5,a5,8 # 1a102008 <_stack_start+0x19ffe008>
   11910:	fec42703          	lw	a4,-20(s0)
   11914:	00e7a023          	sw	a4,0(a5)
   11918:	1a1027b7          	lui	a5,0x1a102
   1191c:	00c78793          	addi	a5,a5,12 # 1a10200c <_stack_start+0x19ffe00c>
   11920:	fd442703          	lw	a4,-44(s0)
   11924:	00e7a023          	sw	a4,0(a5)
   11928:	fd842783          	lw	a5,-40(s0)
   1192c:	03f7f693          	andi	a3,a5,63
   11930:	fd042783          	lw	a5,-48(s0)
   11934:	00879713          	slli	a4,a5,0x8
   11938:	000047b7          	lui	a5,0x4
   1193c:	f0078793          	addi	a5,a5,-256 # 3f00 <_stack_len+0x2f00>
   11940:	00f77733          	and	a4,a4,a5
   11944:	1a1027b7          	lui	a5,0x1a102
   11948:	01078793          	addi	a5,a5,16 # 1a102010 <_stack_start+0x19ffe010>
   1194c:	00e6e733          	or	a4,a3,a4
   11950:	00e7a023          	sw	a4,0(a5)
   11954:	00000013          	nop
   11958:	02c12403          	lw	s0,44(sp)
   1195c:	03010113          	addi	sp,sp,48
   11960:	00008067          	ret

00011964 <spi_setup_dummy>:
   11964:	fe010113          	addi	sp,sp,-32
   11968:	00812e23          	sw	s0,28(sp)
   1196c:	02010413          	addi	s0,sp,32
   11970:	fea42623          	sw	a0,-20(s0)
   11974:	feb42423          	sw	a1,-24(s0)
   11978:	fe842783          	lw	a5,-24(s0)
   1197c:	01079793          	slli	a5,a5,0x10
   11980:	00078693          	mv	a3,a5
   11984:	fec42703          	lw	a4,-20(s0)
   11988:	000107b7          	lui	a5,0x10
   1198c:	fff78793          	addi	a5,a5,-1 # ffff <_stack_len+0xefff>
   11990:	00f777b3          	and	a5,a4,a5
   11994:	00f6e733          	or	a4,a3,a5
   11998:	1a1027b7          	lui	a5,0x1a102
   1199c:	01478793          	addi	a5,a5,20 # 1a102014 <_stack_start+0x19ffe014>
   119a0:	00e7a023          	sw	a4,0(a5)
   119a4:	00000013          	nop
   119a8:	01c12403          	lw	s0,28(sp)
   119ac:	02010113          	addi	sp,sp,32
   119b0:	00008067          	ret

000119b4 <spi_set_datalen>:
   119b4:	fd010113          	addi	sp,sp,-48
   119b8:	02812623          	sw	s0,44(sp)
   119bc:	03010413          	addi	s0,sp,48
   119c0:	fca42e23          	sw	a0,-36(s0)
   119c4:	1a1027b7          	lui	a5,0x1a102
   119c8:	01078793          	addi	a5,a5,16 # 1a102010 <_stack_start+0x19ffe010>
   119cc:	0007a783          	lw	a5,0(a5)
   119d0:	fef42623          	sw	a5,-20(s0)
   119d4:	fdc42783          	lw	a5,-36(s0)
   119d8:	01079793          	slli	a5,a5,0x10
   119dc:	00078713          	mv	a4,a5
   119e0:	fec42783          	lw	a5,-20(s0)
   119e4:	00078693          	mv	a3,a5
   119e8:	000107b7          	lui	a5,0x10
   119ec:	fff78793          	addi	a5,a5,-1 # ffff <_stack_len+0xefff>
   119f0:	00f6f7b3          	and	a5,a3,a5
   119f4:	00f767b3          	or	a5,a4,a5
   119f8:	fef42623          	sw	a5,-20(s0)
   119fc:	1a1027b7          	lui	a5,0x1a102
   11a00:	01078793          	addi	a5,a5,16 # 1a102010 <_stack_start+0x19ffe010>
   11a04:	fec42703          	lw	a4,-20(s0)
   11a08:	00e7a023          	sw	a4,0(a5)
   11a0c:	00000013          	nop
   11a10:	02c12403          	lw	s0,44(sp)
   11a14:	03010113          	addi	sp,sp,48
   11a18:	00008067          	ret

00011a1c <spi_start_transaction>:
   11a1c:	fe010113          	addi	sp,sp,-32
   11a20:	00812e23          	sw	s0,28(sp)
   11a24:	02010413          	addi	s0,sp,32
   11a28:	fea42623          	sw	a0,-20(s0)
   11a2c:	feb42423          	sw	a1,-24(s0)
   11a30:	fe842783          	lw	a5,-24(s0)
   11a34:	00878793          	addi	a5,a5,8
   11a38:	00100713          	li	a4,1
   11a3c:	00f71733          	sll	a4,a4,a5
   11a40:	000017b7          	lui	a5,0x1
   11a44:	f0078793          	addi	a5,a5,-256 # f00 <_min_stack+0x700>
   11a48:	00f776b3          	and	a3,a4,a5
   11a4c:	fec42783          	lw	a5,-20(s0)
   11a50:	00100713          	li	a4,1
   11a54:	00f717b3          	sll	a5,a4,a5
   11a58:	0ff7f713          	andi	a4,a5,255
   11a5c:	1a1027b7          	lui	a5,0x1a102
   11a60:	00e6e733          	or	a4,a3,a4
   11a64:	00e7a023          	sw	a4,0(a5) # 1a102000 <_stack_start+0x19ffe000>
   11a68:	00000013          	nop
   11a6c:	01c12403          	lw	s0,28(sp)
   11a70:	02010113          	addi	sp,sp,32
   11a74:	00008067          	ret

00011a78 <spi_get_status>:
   11a78:	fe010113          	addi	sp,sp,-32
   11a7c:	00812e23          	sw	s0,28(sp)
   11a80:	02010413          	addi	s0,sp,32
   11a84:	1a1027b7          	lui	a5,0x1a102
   11a88:	0007a783          	lw	a5,0(a5) # 1a102000 <_stack_start+0x19ffe000>
   11a8c:	fef42623          	sw	a5,-20(s0)
   11a90:	fec42783          	lw	a5,-20(s0)
   11a94:	00078513          	mv	a0,a5
   11a98:	01c12403          	lw	s0,28(sp)
   11a9c:	02010113          	addi	sp,sp,32
   11aa0:	00008067          	ret

00011aa4 <spi_write_fifo>:
   11aa4:	fd010113          	addi	sp,sp,-48
   11aa8:	02812623          	sw	s0,44(sp)
   11aac:	03010413          	addi	s0,sp,48
   11ab0:	fca42e23          	sw	a0,-36(s0)
   11ab4:	fcb42c23          	sw	a1,-40(s0)
   11ab8:	fd842783          	lw	a5,-40(s0)
   11abc:	4057d793          	srai	a5,a5,0x5
   11ac0:	7ff7f793          	andi	a5,a5,2047
   11ac4:	fef42623          	sw	a5,-20(s0)
   11ac8:	fd842783          	lw	a5,-40(s0)
   11acc:	01f7f793          	andi	a5,a5,31
   11ad0:	00078863          	beqz	a5,11ae0 <spi_write_fifo+0x3c>
   11ad4:	fec42783          	lw	a5,-20(s0)
   11ad8:	00178793          	addi	a5,a5,1
   11adc:	fef42623          	sw	a5,-20(s0)
   11ae0:	fe042423          	sw	zero,-24(s0)
   11ae4:	0480006f          	j	11b2c <spi_write_fifo+0x88>
   11ae8:	00000013          	nop
   11aec:	1a1027b7          	lui	a5,0x1a102
   11af0:	0007a783          	lw	a5,0(a5) # 1a102000 <_stack_start+0x19ffe000>
   11af4:	4187d793          	srai	a5,a5,0x18
   11af8:	0f87f793          	andi	a5,a5,248
   11afc:	fe0798e3          	bnez	a5,11aec <spi_write_fifo+0x48>
   11b00:	fe842783          	lw	a5,-24(s0)
   11b04:	00279793          	slli	a5,a5,0x2
   11b08:	fdc42703          	lw	a4,-36(s0)
   11b0c:	00f70733          	add	a4,a4,a5
   11b10:	1a1027b7          	lui	a5,0x1a102
   11b14:	01878793          	addi	a5,a5,24 # 1a102018 <_stack_start+0x19ffe018>
   11b18:	00072703          	lw	a4,0(a4)
   11b1c:	00e7a023          	sw	a4,0(a5)
   11b20:	fe842783          	lw	a5,-24(s0)
   11b24:	00178793          	addi	a5,a5,1
   11b28:	fef42423          	sw	a5,-24(s0)
   11b2c:	fe842703          	lw	a4,-24(s0)
   11b30:	fec42783          	lw	a5,-20(s0)
   11b34:	faf74ae3          	blt	a4,a5,11ae8 <spi_write_fifo+0x44>
   11b38:	00000013          	nop
   11b3c:	00000013          	nop
   11b40:	02c12403          	lw	s0,44(sp)
   11b44:	03010113          	addi	sp,sp,48
   11b48:	00008067          	ret

00011b4c <spi_read_fifo>:
   11b4c:	fd010113          	addi	sp,sp,-48
   11b50:	02812623          	sw	s0,44(sp)
   11b54:	03010413          	addi	s0,sp,48
   11b58:	fca42e23          	sw	a0,-36(s0)
   11b5c:	fcb42c23          	sw	a1,-40(s0)
   11b60:	fd842783          	lw	a5,-40(s0)
   11b64:	4057d793          	srai	a5,a5,0x5
   11b68:	7ff7f793          	andi	a5,a5,2047
   11b6c:	fef42623          	sw	a5,-20(s0)
   11b70:	fd842783          	lw	a5,-40(s0)
   11b74:	01f7f793          	andi	a5,a5,31
   11b78:	00078863          	beqz	a5,11b88 <spi_read_fifo+0x3c>
   11b7c:	fec42783          	lw	a5,-20(s0)
   11b80:	00178793          	addi	a5,a5,1
   11b84:	fef42623          	sw	a5,-20(s0)
   11b88:	fe042423          	sw	zero,-24(s0)
   11b8c:	0480006f          	j	11bd4 <spi_read_fifo+0x88>
   11b90:	00000013          	nop
   11b94:	1a1027b7          	lui	a5,0x1a102
   11b98:	0007a783          	lw	a5,0(a5) # 1a102000 <_stack_start+0x19ffe000>
   11b9c:	4107d793          	srai	a5,a5,0x10
   11ba0:	0ff7f793          	andi	a5,a5,255
   11ba4:	fe0788e3          	beqz	a5,11b94 <spi_read_fifo+0x48>
   11ba8:	1a1027b7          	lui	a5,0x1a102
   11bac:	02078713          	addi	a4,a5,32 # 1a102020 <_stack_start+0x19ffe020>
   11bb0:	fe842783          	lw	a5,-24(s0)
   11bb4:	00279793          	slli	a5,a5,0x2
   11bb8:	fdc42683          	lw	a3,-36(s0)
   11bbc:	00f687b3          	add	a5,a3,a5
   11bc0:	00072703          	lw	a4,0(a4)
   11bc4:	00e7a023          	sw	a4,0(a5)
   11bc8:	fe842783          	lw	a5,-24(s0)
   11bcc:	00178793          	addi	a5,a5,1
   11bd0:	fef42423          	sw	a5,-24(s0)
   11bd4:	fe842703          	lw	a4,-24(s0)
   11bd8:	fec42783          	lw	a5,-20(s0)
   11bdc:	faf74ae3          	blt	a4,a5,11b90 <spi_read_fifo+0x44>
   11be0:	00000013          	nop
   11be4:	00000013          	nop
   11be8:	02c12403          	lw	s0,44(sp)
   11bec:	03010113          	addi	sp,sp,48
   11bf0:	00008067          	ret

00011bf4 <reset_timer>:
   11bf4:	ff010113          	addi	sp,sp,-16
   11bf8:	00812623          	sw	s0,12(sp)
   11bfc:	01010413          	addi	s0,sp,16
   11c00:	1a1037b7          	lui	a5,0x1a103
   11c04:	0007a023          	sw	zero,0(a5) # 1a103000 <_stack_start+0x19fff000>
   11c08:	00000013          	nop
   11c0c:	00c12403          	lw	s0,12(sp)
   11c10:	01010113          	addi	sp,sp,16
   11c14:	00008067          	ret

00011c18 <start_timer>:
   11c18:	ff010113          	addi	sp,sp,-16
   11c1c:	00812623          	sw	s0,12(sp)
   11c20:	01010413          	addi	s0,sp,16
   11c24:	1a1037b7          	lui	a5,0x1a103
   11c28:	00478793          	addi	a5,a5,4 # 1a103004 <_stack_start+0x19fff004>
   11c2c:	00100713          	li	a4,1
   11c30:	00e7a023          	sw	a4,0(a5)
   11c34:	00000013          	nop
   11c38:	00c12403          	lw	s0,12(sp)
   11c3c:	01010113          	addi	sp,sp,16
   11c40:	00008067          	ret

00011c44 <stop_timer>:
   11c44:	ff010113          	addi	sp,sp,-16
   11c48:	00812623          	sw	s0,12(sp)
   11c4c:	01010413          	addi	s0,sp,16
   11c50:	1a1037b7          	lui	a5,0x1a103
   11c54:	00478793          	addi	a5,a5,4 # 1a103004 <_stack_start+0x19fff004>
   11c58:	0007a023          	sw	zero,0(a5)
   11c5c:	00000013          	nop
   11c60:	00c12403          	lw	s0,12(sp)
   11c64:	01010113          	addi	sp,sp,16
   11c68:	00008067          	ret

00011c6c <get_time>:
   11c6c:	ff010113          	addi	sp,sp,-16
   11c70:	00812623          	sw	s0,12(sp)
   11c74:	01010413          	addi	s0,sp,16
   11c78:	1a1037b7          	lui	a5,0x1a103
   11c7c:	0007a783          	lw	a5,0(a5) # 1a103000 <_stack_start+0x19fff000>
   11c80:	00078513          	mv	a0,a5
   11c84:	00c12403          	lw	s0,12(sp)
   11c88:	01010113          	addi	sp,sp,16
   11c8c:	00008067          	ret

00011c90 <uart_set_cfg>:
   11c90:	fe010113          	addi	sp,sp,-32
   11c94:	00812e23          	sw	s0,28(sp)
   11c98:	02010413          	addi	s0,sp,32
   11c9c:	fea42623          	sw	a0,-20(s0)
   11ca0:	00058793          	mv	a5,a1
   11ca4:	fef41523          	sh	a5,-22(s0)
   11ca8:	1a1077b7          	lui	a5,0x1a107
   11cac:	00478793          	addi	a5,a5,4 # 1a107004 <_stack_start+0x1a003004>
   11cb0:	0007a703          	lw	a4,0(a5)
   11cb4:	1a1077b7          	lui	a5,0x1a107
   11cb8:	00478793          	addi	a5,a5,4 # 1a107004 <_stack_start+0x1a003004>
   11cbc:	00276713          	ori	a4,a4,2
   11cc0:	00e7a023          	sw	a4,0(a5)
   11cc4:	1a1007b7          	lui	a5,0x1a100
   11cc8:	00c78793          	addi	a5,a5,12 # 1a10000c <_stack_start+0x19ffc00c>
   11ccc:	08300713          	li	a4,131
   11cd0:	00e7a023          	sw	a4,0(a5)
   11cd4:	fea45783          	lhu	a5,-22(s0)
   11cd8:	0087d793          	srli	a5,a5,0x8
   11cdc:	01079793          	slli	a5,a5,0x10
   11ce0:	0107d793          	srli	a5,a5,0x10
   11ce4:	00078713          	mv	a4,a5
   11ce8:	1a1007b7          	lui	a5,0x1a100
   11cec:	00478793          	addi	a5,a5,4 # 1a100004 <_stack_start+0x19ffc004>
   11cf0:	0ff77713          	andi	a4,a4,255
   11cf4:	00e7a023          	sw	a4,0(a5)
   11cf8:	fea45703          	lhu	a4,-22(s0)
   11cfc:	1a1007b7          	lui	a5,0x1a100
   11d00:	0ff77713          	andi	a4,a4,255
   11d04:	00e7a023          	sw	a4,0(a5) # 1a100000 <_stack_start+0x19ffc000>
   11d08:	1a1007b7          	lui	a5,0x1a100
   11d0c:	00878793          	addi	a5,a5,8 # 1a100008 <_stack_start+0x19ffc008>
   11d10:	0a700713          	li	a4,167
   11d14:	00e7a023          	sw	a4,0(a5)
   11d18:	1a1007b7          	lui	a5,0x1a100
   11d1c:	00c78793          	addi	a5,a5,12 # 1a10000c <_stack_start+0x19ffc00c>
   11d20:	00300713          	li	a4,3
   11d24:	00e7a023          	sw	a4,0(a5)
   11d28:	1a1007b7          	lui	a5,0x1a100
   11d2c:	00478793          	addi	a5,a5,4 # 1a100004 <_stack_start+0x19ffc004>
   11d30:	0007a783          	lw	a5,0(a5)
   11d34:	0f07f713          	andi	a4,a5,240
   11d38:	1a1007b7          	lui	a5,0x1a100
   11d3c:	00478793          	addi	a5,a5,4 # 1a100004 <_stack_start+0x19ffc004>
   11d40:	00276713          	ori	a4,a4,2
   11d44:	00e7a023          	sw	a4,0(a5)
   11d48:	00000013          	nop
   11d4c:	01c12403          	lw	s0,28(sp)
   11d50:	02010113          	addi	sp,sp,32
   11d54:	00008067          	ret

00011d58 <uart_send>:
   11d58:	fd010113          	addi	sp,sp,-48
   11d5c:	02812623          	sw	s0,44(sp)
   11d60:	03010413          	addi	s0,sp,48
   11d64:	fca42e23          	sw	a0,-36(s0)
   11d68:	fcb42c23          	sw	a1,-40(s0)
   11d6c:	0680006f          	j	11dd4 <uart_send+0x7c>
   11d70:	00000013          	nop
   11d74:	1a1007b7          	lui	a5,0x1a100
   11d78:	01478793          	addi	a5,a5,20 # 1a100014 <_stack_start+0x19ffc014>
   11d7c:	0007a783          	lw	a5,0(a5)
   11d80:	0207f793          	andi	a5,a5,32
   11d84:	fe0788e3          	beqz	a5,11d74 <uart_send+0x1c>
   11d88:	fe042623          	sw	zero,-20(s0)
   11d8c:	0340006f          	j	11dc0 <uart_send+0x68>
   11d90:	fdc42783          	lw	a5,-36(s0)
   11d94:	00178713          	addi	a4,a5,1
   11d98:	fce42e23          	sw	a4,-36(s0)
   11d9c:	0007c703          	lbu	a4,0(a5)
   11da0:	1a1007b7          	lui	a5,0x1a100
   11da4:	00e7a023          	sw	a4,0(a5) # 1a100000 <_stack_start+0x19ffc000>
   11da8:	fd842783          	lw	a5,-40(s0)
   11dac:	fff78793          	addi	a5,a5,-1
   11db0:	fcf42c23          	sw	a5,-40(s0)
   11db4:	fec42783          	lw	a5,-20(s0)
   11db8:	00178793          	addi	a5,a5,1
   11dbc:	fef42623          	sw	a5,-20(s0)
   11dc0:	fec42703          	lw	a4,-20(s0)
   11dc4:	03f00793          	li	a5,63
   11dc8:	00e7e663          	bltu	a5,a4,11dd4 <uart_send+0x7c>
   11dcc:	fd842783          	lw	a5,-40(s0)
   11dd0:	fc0790e3          	bnez	a5,11d90 <uart_send+0x38>
   11dd4:	fd842783          	lw	a5,-40(s0)
   11dd8:	f8079ce3          	bnez	a5,11d70 <uart_send+0x18>
   11ddc:	00000013          	nop
   11de0:	00000013          	nop
   11de4:	02c12403          	lw	s0,44(sp)
   11de8:	03010113          	addi	sp,sp,48
   11dec:	00008067          	ret

00011df0 <uart_getchar>:
   11df0:	ff010113          	addi	sp,sp,-16
   11df4:	00812623          	sw	s0,12(sp)
   11df8:	01010413          	addi	s0,sp,16
   11dfc:	00000013          	nop
   11e00:	1a1007b7          	lui	a5,0x1a100
   11e04:	01478793          	addi	a5,a5,20 # 1a100014 <_stack_start+0x19ffc014>
   11e08:	0007a783          	lw	a5,0(a5)
   11e0c:	0017f713          	andi	a4,a5,1
   11e10:	00100793          	li	a5,1
   11e14:	fef716e3          	bne	a4,a5,11e00 <uart_getchar+0x10>
   11e18:	1a1007b7          	lui	a5,0x1a100
   11e1c:	0007a783          	lw	a5,0(a5) # 1a100000 <_stack_start+0x19ffc000>
   11e20:	0ff7f793          	andi	a5,a5,255
   11e24:	00078513          	mv	a0,a5
   11e28:	00c12403          	lw	s0,12(sp)
   11e2c:	01010113          	addi	sp,sp,16
   11e30:	00008067          	ret

00011e34 <uart_sendchar>:
   11e34:	fe010113          	addi	sp,sp,-32
   11e38:	00812e23          	sw	s0,28(sp)
   11e3c:	02010413          	addi	s0,sp,32
   11e40:	00050793          	mv	a5,a0
   11e44:	fef407a3          	sb	a5,-17(s0)
   11e48:	00000013          	nop
   11e4c:	1a1007b7          	lui	a5,0x1a100
   11e50:	01478793          	addi	a5,a5,20 # 1a100014 <_stack_start+0x19ffc014>
   11e54:	0007a783          	lw	a5,0(a5)
   11e58:	0207f793          	andi	a5,a5,32
   11e5c:	fe0788e3          	beqz	a5,11e4c <uart_sendchar+0x18>
   11e60:	1a1007b7          	lui	a5,0x1a100
   11e64:	fef44703          	lbu	a4,-17(s0)
   11e68:	00e7a023          	sw	a4,0(a5) # 1a100000 <_stack_start+0x19ffc000>
   11e6c:	00000013          	nop
   11e70:	01c12403          	lw	s0,28(sp)
   11e74:	02010113          	addi	sp,sp,32
   11e78:	00008067          	ret

00011e7c <uart_wait_tx_done>:
   11e7c:	ff010113          	addi	sp,sp,-16
   11e80:	00812623          	sw	s0,12(sp)
   11e84:	01010413          	addi	s0,sp,16
   11e88:	00000013          	nop
   11e8c:	1a1007b7          	lui	a5,0x1a100
   11e90:	01478793          	addi	a5,a5,20 # 1a100014 <_stack_start+0x19ffc014>
   11e94:	0007a783          	lw	a5,0(a5)
   11e98:	0407f793          	andi	a5,a5,64
   11e9c:	fe0788e3          	beqz	a5,11e8c <uart_wait_tx_done+0x10>
   11ea0:	00000013          	nop
   11ea4:	00000013          	nop
   11ea8:	00c12403          	lw	s0,12(sp)
   11eac:	01010113          	addi	sp,sp,16
   11eb0:	00008067          	ret

00011eb4 <exit>:
   11eb4:	fe010113          	addi	sp,sp,-32
   11eb8:	00112e23          	sw	ra,28(sp)
   11ebc:	00812c23          	sw	s0,24(sp)
   11ec0:	02010413          	addi	s0,sp,32
   11ec4:	fea42623          	sw	a0,-20(s0)
   11ec8:	fec42503          	lw	a0,-20(s0)
   11ecc:	008000ef          	jal	ra,11ed4 <eoc>
   11ed0:	0000006f          	j	11ed0 <exit+0x1c>

00011ed4 <eoc>:
   11ed4:	fe010113          	addi	sp,sp,-32
   11ed8:	00812e23          	sw	s0,28(sp)
   11edc:	02010413          	addi	s0,sp,32
   11ee0:	fea42623          	sw	a0,-20(s0)
   11ee4:	fec42783          	lw	a5,-20(s0)
   11ee8:	00078c63          	beqz	a5,11f00 <eoc+0x2c>
   11eec:	1a1077b7          	lui	a5,0x1a107
   11ef0:	01478793          	addi	a5,a5,20 # 1a107014 <_stack_start+0x1a003014>
   11ef4:	00100713          	li	a4,1
   11ef8:	00e7a023          	sw	a4,0(a5)
   11efc:	0100006f          	j	11f0c <eoc+0x38>
   11f00:	1a1077b7          	lui	a5,0x1a107
   11f04:	01478793          	addi	a5,a5,20 # 1a107014 <_stack_start+0x1a003014>
   11f08:	0007a023          	sw	zero,0(a5)
   11f0c:	1a1077b7          	lui	a5,0x1a107
   11f10:	00478793          	addi	a5,a5,4 # 1a107004 <_stack_start+0x1a003004>
   11f14:	0007a703          	lw	a4,0(a5)
   11f18:	1a1077b7          	lui	a5,0x1a107
   11f1c:	00478793          	addi	a5,a5,4 # 1a107004 <_stack_start+0x1a003004>
   11f20:	00476713          	ori	a4,a4,4
   11f24:	00e7a023          	sw	a4,0(a5)
   11f28:	00000013          	nop
   11f2c:	01c12403          	lw	s0,28(sp)
   11f30:	02010113          	addi	sp,sp,32
   11f34:	00008067          	ret

00011f38 <sleep_busy>:
   11f38:	fd010113          	addi	sp,sp,-48
   11f3c:	02812623          	sw	s0,44(sp)
   11f40:	03010413          	addi	s0,sp,48
   11f44:	fca42e23          	sw	a0,-36(s0)
   11f48:	fe042623          	sw	zero,-20(s0)
   11f4c:	0140006f          	j	11f60 <sleep_busy+0x28>
   11f50:	00000013          	nop
   11f54:	fec42783          	lw	a5,-20(s0)
   11f58:	00178793          	addi	a5,a5,1
   11f5c:	fef42623          	sw	a5,-20(s0)
   11f60:	fdc42783          	lw	a5,-36(s0)
   11f64:	fec42703          	lw	a4,-20(s0)
   11f68:	fef744e3          	blt	a4,a5,11f50 <sleep_busy+0x18>
   11f6c:	00000013          	nop
   11f70:	00000013          	nop
   11f74:	02c12403          	lw	s0,44(sp)
   11f78:	03010113          	addi	sp,sp,48
   11f7c:	00008067          	ret

00011f80 <cpu_perf_set>:
   11f80:	fe010113          	addi	sp,sp,-32
   11f84:	00112e23          	sw	ra,28(sp)
   11f88:	00812c23          	sw	s0,24(sp)
   11f8c:	02010413          	addi	s0,sp,32
   11f90:	fea42623          	sw	a0,-20(s0)
   11f94:	feb42423          	sw	a1,-24(s0)
   11f98:	000127b7          	lui	a5,0x12
   11f9c:	19078513          	addi	a0,a5,400 # 12190 <__DTOR_END__+0x9c>
   11fa0:	d60ff0ef          	jal	ra,11500 <puts>
   11fa4:	00000013          	nop
   11fa8:	01c12083          	lw	ra,28(sp)
   11fac:	01812403          	lw	s0,24(sp)
   11fb0:	02010113          	addi	sp,sp,32
   11fb4:	00008067          	ret

00011fb8 <cpu_perf_get>:
   11fb8:	fd010113          	addi	sp,sp,-48
   11fbc:	02112623          	sw	ra,44(sp)
   11fc0:	02812423          	sw	s0,40(sp)
   11fc4:	03010413          	addi	s0,sp,48
   11fc8:	fca42e23          	sw	a0,-36(s0)
   11fcc:	fe042623          	sw	zero,-20(s0)
   11fd0:	fdc42703          	lw	a4,-36(s0)
   11fd4:	00f00793          	li	a5,15
   11fd8:	0ee7e063          	bltu	a5,a4,120b8 <cpu_perf_get+0x100>
   11fdc:	fdc42783          	lw	a5,-36(s0)
   11fe0:	00279713          	slli	a4,a5,0x2
   11fe4:	000127b7          	lui	a5,0x12
   11fe8:	1d078793          	addi	a5,a5,464 # 121d0 <__DTOR_END__+0xdc>
   11fec:	00f707b3          	add	a5,a4,a5
   11ff0:	0007a783          	lw	a5,0(a5)
   11ff4:	00078067          	jr	a5
   11ff8:	780027f3          	csrr	a5,0x780
   11ffc:	fef42623          	sw	a5,-20(s0)
   12000:	0cc0006f          	j	120cc <cpu_perf_get+0x114>
   12004:	781027f3          	csrr	a5,0x781
   12008:	fef42623          	sw	a5,-20(s0)
   1200c:	0c00006f          	j	120cc <cpu_perf_get+0x114>
   12010:	782027f3          	csrr	a5,0x782
   12014:	fef42623          	sw	a5,-20(s0)
   12018:	0b40006f          	j	120cc <cpu_perf_get+0x114>
   1201c:	783027f3          	csrr	a5,0x783
   12020:	fef42623          	sw	a5,-20(s0)
   12024:	0a80006f          	j	120cc <cpu_perf_get+0x114>
   12028:	784027f3          	csrr	a5,0x784
   1202c:	fef42623          	sw	a5,-20(s0)
   12030:	09c0006f          	j	120cc <cpu_perf_get+0x114>
   12034:	785027f3          	csrr	a5,0x785
   12038:	fef42623          	sw	a5,-20(s0)
   1203c:	0900006f          	j	120cc <cpu_perf_get+0x114>
   12040:	786027f3          	csrr	a5,0x786
   12044:	fef42623          	sw	a5,-20(s0)
   12048:	0840006f          	j	120cc <cpu_perf_get+0x114>
   1204c:	787027f3          	csrr	a5,0x787
   12050:	fef42623          	sw	a5,-20(s0)
   12054:	0780006f          	j	120cc <cpu_perf_get+0x114>
   12058:	788027f3          	csrr	a5,0x788
   1205c:	fef42623          	sw	a5,-20(s0)
   12060:	06c0006f          	j	120cc <cpu_perf_get+0x114>
   12064:	789027f3          	csrr	a5,0x789
   12068:	fef42623          	sw	a5,-20(s0)
   1206c:	0600006f          	j	120cc <cpu_perf_get+0x114>
   12070:	78a027f3          	csrr	a5,0x78a
   12074:	fef42623          	sw	a5,-20(s0)
   12078:	0540006f          	j	120cc <cpu_perf_get+0x114>
   1207c:	78b027f3          	csrr	a5,0x78b
   12080:	fef42623          	sw	a5,-20(s0)
   12084:	0480006f          	j	120cc <cpu_perf_get+0x114>
   12088:	78c027f3          	csrr	a5,0x78c
   1208c:	fef42623          	sw	a5,-20(s0)
   12090:	03c0006f          	j	120cc <cpu_perf_get+0x114>
   12094:	78d027f3          	csrr	a5,0x78d
   12098:	fef42623          	sw	a5,-20(s0)
   1209c:	0300006f          	j	120cc <cpu_perf_get+0x114>
   120a0:	78e027f3          	csrr	a5,0x78e
   120a4:	fef42623          	sw	a5,-20(s0)
   120a8:	0240006f          	j	120cc <cpu_perf_get+0x114>
   120ac:	78f027f3          	csrr	a5,0x78f
   120b0:	fef42623          	sw	a5,-20(s0)
   120b4:	0180006f          	j	120cc <cpu_perf_get+0x114>
   120b8:	fdc42583          	lw	a1,-36(s0)
   120bc:	000127b7          	lui	a5,0x12
   120c0:	1b478513          	addi	a0,a5,436 # 121b4 <__DTOR_END__+0xc0>
   120c4:	bc8ff0ef          	jal	ra,1148c <printf>
   120c8:	00000013          	nop
   120cc:	fec42783          	lw	a5,-20(s0)
   120d0:	00078513          	mv	a0,a5
   120d4:	02c12083          	lw	ra,44(sp)
   120d8:	02812403          	lw	s0,40(sp)
   120dc:	03010113          	addi	sp,sp,48
   120e0:	00008067          	ret

000120e4 <__CTOR_LIST__>:
	...

000120ec <__CTOR_END__>:
	...

Disassembly of section .rodata:

000120f4 <.rodata>:
   120f4:	6568                	flw	fa0,76(a0)
   120f6:	6c6c                	flw	fa1,92(s0)
   120f8:	6f77206f          	j	84fee <_bss_end+0x72dce>
   120fc:	6c72                	flw	fs8,28(sp)
   120fe:	2164                	fld	fs1,192(a0)
   12100:	0000                	unimp
   12102:	0000                	unimp
   12104:	74696177          	0x74696177
   12108:	6e69                	lui	t3,0x1a
   1210a:	6f662067          	0x6f662067
   1210e:	2072                	fld	ft0,280(sp)
   12110:	6175                	addi	sp,sp,368
   12112:	7472                	flw	fs0,60(sp)
   12114:	7320                	flw	fs0,96(a4)
   12116:	6769                	lui	a4,0x1a
   12118:	616e                	flw	ft2,216(sp)
   1211a:	736c                	flw	fa1,100(a4)
   1211c:	7420                	flw	fs0,104(s0)
   1211e:	7277206f          	j	85044 <_bss_end+0x72e24>
   12122:	7469                	lui	s0,0xffffa
   12124:	2065                	jal	121cc <__DTOR_END__+0xd8>
   12126:	6f74                	flw	fa3,92(a4)
   12128:	7220                	flw	fs0,96(a2)
   1212a:	6d61                	lui	s10,0x18
   1212c:	2e2e                	fld	ft8,200(sp)
   1212e:	002e                	c.slli	zero,0xb
   12130:	6f44                	flw	fs1,28(a4)
   12132:	656e                	flw	fa0,216(sp)
   12134:	202c                	fld	fa1,64(s0)
   12136:	756a                	flw	fa0,184(sp)
   12138:	706d                	c.lui	zero,0xffffb
   1213a:	6e69                	lui	t3,0x1a
   1213c:	6f742067          	0x6f742067
   12140:	4920                	lw	s0,80(a0)
   12142:	736e                	flw	ft6,248(sp)
   12144:	7274                	flw	fa3,100(a2)
   12146:	6375                	lui	t1,0x1d
   12148:	6974                	flw	fa3,84(a0)
   1214a:	52206e6f          	jal	t3,1866c <_bss_end+0x644c>
   1214e:	4d41                	li	s10,16
   12150:	0a2e                	slli	s4,s4,0xb
   12152:	0000                	unimp
   12154:	6854                	flw	fa3,20(s0)
   12156:	7369                	lui	t1,0xffffa
   12158:	6920                	flw	fs0,80(a0)
   1215a:	74276e73          	csrrsi	t3,0x742,14
   1215e:	7320                	flw	fs0,96(a4)
   12160:	7075                	c.lui	zero,0xffffd
   12162:	6f70                	flw	fa2,92(a4)
   12164:	20646573          	csrrsi	a0,0x206,8
   12168:	6f74                	flw	fa3,92(a4)
   1216a:	6220                	flw	fs0,64(a2)
   1216c:	2065                	jal	12214 <remu10_table+0x4>
   1216e:	776f6873          	csrrsi	a6,0x776,30
   12172:	2e6e                	fld	ft8,216(sp)
   12174:	0020                	addi	s0,sp,8
   12176:	0000                	unimp
   12178:	3130                	fld	fa2,96(a0)
   1217a:	3332                	fld	ft6,296(sp)
   1217c:	3534                	fld	fa3,104(a0)
   1217e:	3736                	fld	fa4,360(sp)
   12180:	3938                	fld	fa4,112(a0)
   12182:	4241                	li	tp,16
   12184:	46454443          	fmadd.q	fs0,fa0,ft4,fs0,rmm
   12188:	6e28                	flw	fa0,88(a2)
   1218a:	6c75                	lui	s8,0x1d
   1218c:	296c                	fld	fa1,208(a0)
   1218e:	0000                	unimp
   12190:	5f757063          	bgeu	a0,s7,12770 <_bss_end+0x550>
   12194:	6570                	flw	fa2,76(a0)
   12196:	6672                	flw	fa2,28(sp)
   12198:	735f 7465 203a      	0x203a7465735f
   1219e:	6f6e                	flw	ft10,216(sp)
   121a0:	2074                	fld	fa3,192(s0)
   121a2:	6d69                	lui	s10,0x1a
   121a4:	6c70                	flw	fa2,92(s0)
   121a6:	6d65                	lui	s10,0x19
   121a8:	6e65                	lui	t3,0x19
   121aa:	6574                	flw	fa3,76(a0)
   121ac:	2064                	fld	fs1,192(s0)
   121ae:	6579                	lui	a0,0x1e
   121b0:	0074                	addi	a3,sp,12
   121b2:	0000                	unimp
   121b4:	20525343          	fmadd.s	ft6,ft4,ft5,ft4,unknown
   121b8:	6425                	lui	s0,0x9
   121ba:	6e20                	flw	fs0,88(a2)
   121bc:	7920746f          	jal	s0,1994e <_bss_end+0x772e>
   121c0:	7465                	lui	s0,0xffff9
   121c2:	7320                	flw	fs0,96(a4)
   121c4:	7075                	c.lui	zero,0xffffd
   121c6:	6f70                	flw	fa2,92(a4)
   121c8:	7472                	flw	fs0,60(sp)
   121ca:	6465                	lui	s0,0x19
   121cc:	000a                	c.slli	zero,0x2
   121ce:	0000                	unimp
   121d0:	1ff8                	addi	a4,sp,1020
   121d2:	0001                	nop
   121d4:	2004                	fld	fs1,0(s0)
   121d6:	0001                	nop
   121d8:	2010                	fld	fa2,0(s0)
   121da:	0001                	nop
   121dc:	201c                	fld	fa5,0(s0)
   121de:	0001                	nop
   121e0:	2028                	fld	fa0,64(s0)
   121e2:	0001                	nop
   121e4:	2034                	fld	fa3,64(s0)
   121e6:	0001                	nop
   121e8:	2040                	fld	fs0,128(s0)
   121ea:	0001                	nop
   121ec:	204c                	fld	fa1,128(s0)
   121ee:	0001                	nop
   121f0:	2058                	fld	fa4,128(s0)
   121f2:	0001                	nop
   121f4:	2064                	fld	fs1,192(s0)
   121f6:	0001                	nop
   121f8:	2070                	fld	fa2,192(s0)
   121fa:	0001                	nop
   121fc:	207c                	fld	fa5,192(s0)
   121fe:	0001                	nop
   12200:	2088                	fld	fa0,0(s1)
   12202:	0001                	nop
   12204:	2094                	fld	fa3,0(s1)
   12206:	0001                	nop
   12208:	20a0                	fld	fs0,64(s1)
   1220a:	0001                	nop
   1220c:	20ac                	fld	fa1,64(s1)
   1220e:	0001                	nop

Disassembly of section .data:

00012210 <remu10_table>:
   12210:	0100                	addi	s0,sp,128
   12212:	0202                	c.slli64	tp
   12214:	05040303          	lb	t1,80(s0) # 19050 <_edata+0x6e30>
   12218:	0605                	addi	a2,a2,1
   1221a:	08080707          	0x8080707
   1221e:	0009                	c.nop	2

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
