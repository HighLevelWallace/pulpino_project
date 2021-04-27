
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
   10058:	0960006f          	j	100ee <ISR_SRAM_ASM>
   1005c:	0a60006f          	j	10102 <ISR_I2C_ASM>
   10060:	0b60006f          	j	10116 <ISR_UART_ASM>
   10064:	0c60006f          	j	1012a <ISR_GPIO_ASM>
   10068:	0d60006f          	j	1013e <ISR_SPIM0_ASM>
   1006c:	0e60006f          	j	10152 <ISR_SPIM1_ASM>
   10070:	10a0006f          	j	1017a <ISR_TA_OVF_ASM>
   10074:	0f20006f          	j	10166 <ISR_TA_CMP_ASM>
   10078:	12a0006f          	j	101a2 <ISR_TB_OVF_ASM>
   1007c:	1120006f          	j	1018e <ISR_TB_CMP_ASM>
   10080:	00c0006f          	j	1008c <_stext>
   10084:	1320006f          	j	101b6 <illegal_insn_handler>
   10088:	1420006f          	j	101ca <ecall_insn_handler>

Disassembly of section .text:

0001008c <_stext>:
   1008c:	30501073          	csrw	mtvec,zero
   10090:	00000093          	li	ra,0
   10094:	8106                	mv	sp,ra
   10096:	8186                	mv	gp,ra
   10098:	8206                	mv	tp,ra
   1009a:	8286                	mv	t0,ra
   1009c:	8306                	mv	t1,ra
   1009e:	8386                	mv	t2,ra
   100a0:	8406                	mv	s0,ra
   100a2:	8486                	mv	s1,ra
   100a4:	8506                	mv	a0,ra
   100a6:	8586                	mv	a1,ra
   100a8:	8606                	mv	a2,ra
   100aa:	8686                	mv	a3,ra
   100ac:	8706                	mv	a4,ra
   100ae:	8786                	mv	a5,ra
   100b0:	000f4117          	auipc	sp,0xf4
   100b4:	f5010113          	addi	sp,sp,-176 # 104000 <_stack_start>

000100b8 <_start>:
   100b8:	00002717          	auipc	a4,0x2
   100bc:	8c870713          	addi	a4,a4,-1848 # 11980 <_bss_end>
   100c0:	00002797          	auipc	a5,0x2
   100c4:	8c078793          	addi	a5,a5,-1856 # 11980 <_bss_end>
   100c8:	00f75763          	bge	a4,a5,100d6 <main_entry>

000100cc <zero_loop>:
   100cc:	00072023          	sw	zero,0(a4)
   100d0:	0711                	addi	a4,a4,4
   100d2:	fee7dde3          	bge	a5,a4,100cc <zero_loop>

000100d6 <main_entry>:
   100d6:	4501                	li	a0,0
   100d8:	4585                	li	a1,1
   100da:	45a010ef          	jal	ra,11534 <uart_set_cfg>
   100de:	4501                	li	a0,0
   100e0:	4581                	li	a1,0
   100e2:	544000ef          	jal	ra,10626 <main>
   100e6:	842a                	mv	s0,a0
   100e8:	5a4010ef          	jal	ra,1168c <uart_wait_tx_done>
   100ec:	8522                	mv	a0,s0

000100ee <ISR_SRAM_ASM>:
   100ee:	711d                	addi	sp,sp,-96
   100f0:	ce86                	sw	ra,92(sp)
   100f2:	0ec000ef          	jal	ra,101de <store_regs>
   100f6:	00000097          	auipc	ra,0x0
   100fa:	10208093          	addi	ra,ra,258 # 101f8 <end_except>
   100fe:	40e0006f          	j	1050c <ISR_SRAM>

00010102 <ISR_I2C_ASM>:
   10102:	711d                	addi	sp,sp,-96
   10104:	ce86                	sw	ra,92(sp)
   10106:	0d8000ef          	jal	ra,101de <store_regs>
   1010a:	00000097          	auipc	ra,0x0
   1010e:	0ee08093          	addi	ra,ra,238 # 101f8 <end_except>
   10112:	4020006f          	j	10514 <ISR_I2C>

00010116 <ISR_UART_ASM>:
   10116:	711d                	addi	sp,sp,-96
   10118:	ce86                	sw	ra,92(sp)
   1011a:	0c4000ef          	jal	ra,101de <store_regs>
   1011e:	00000097          	auipc	ra,0x0
   10122:	0da08093          	addi	ra,ra,218 # 101f8 <end_except>
   10126:	3f60006f          	j	1051c <ISR_UART>

0001012a <ISR_GPIO_ASM>:
   1012a:	711d                	addi	sp,sp,-96
   1012c:	ce86                	sw	ra,92(sp)
   1012e:	0b0000ef          	jal	ra,101de <store_regs>
   10132:	00000097          	auipc	ra,0x0
   10136:	0c608093          	addi	ra,ra,198 # 101f8 <end_except>
   1013a:	3ea0006f          	j	10524 <ISR_GPIO>

0001013e <ISR_SPIM0_ASM>:
   1013e:	711d                	addi	sp,sp,-96
   10140:	ce86                	sw	ra,92(sp)
   10142:	09c000ef          	jal	ra,101de <store_regs>
   10146:	00000097          	auipc	ra,0x0
   1014a:	0b208093          	addi	ra,ra,178 # 101f8 <end_except>
   1014e:	3de0006f          	j	1052c <ISR_SPIM0>

00010152 <ISR_SPIM1_ASM>:
   10152:	711d                	addi	sp,sp,-96
   10154:	ce86                	sw	ra,92(sp)
   10156:	088000ef          	jal	ra,101de <store_regs>
   1015a:	00000097          	auipc	ra,0x0
   1015e:	09e08093          	addi	ra,ra,158 # 101f8 <end_except>
   10162:	3d20006f          	j	10534 <ISR_SPIM1>

00010166 <ISR_TA_CMP_ASM>:
   10166:	711d                	addi	sp,sp,-96
   10168:	ce86                	sw	ra,92(sp)
   1016a:	074000ef          	jal	ra,101de <store_regs>
   1016e:	00000097          	auipc	ra,0x0
   10172:	08a08093          	addi	ra,ra,138 # 101f8 <end_except>
   10176:	3ce0006f          	j	10544 <ISR_TA_CMP>

0001017a <ISR_TA_OVF_ASM>:
   1017a:	711d                	addi	sp,sp,-96
   1017c:	ce86                	sw	ra,92(sp)
   1017e:	060000ef          	jal	ra,101de <store_regs>
   10182:	00000097          	auipc	ra,0x0
   10186:	07608093          	addi	ra,ra,118 # 101f8 <end_except>
   1018a:	3b20006f          	j	1053c <ISR_TA_OVF>

0001018e <ISR_TB_CMP_ASM>:
   1018e:	711d                	addi	sp,sp,-96
   10190:	ce86                	sw	ra,92(sp)
   10192:	04c000ef          	jal	ra,101de <store_regs>
   10196:	00000097          	auipc	ra,0x0
   1019a:	06208093          	addi	ra,ra,98 # 101f8 <end_except>
   1019e:	3b60006f          	j	10554 <ISR_TB_CMP>

000101a2 <ISR_TB_OVF_ASM>:
   101a2:	711d                	addi	sp,sp,-96
   101a4:	ce86                	sw	ra,92(sp)
   101a6:	038000ef          	jal	ra,101de <store_regs>
   101aa:	00000097          	auipc	ra,0x0
   101ae:	04e08093          	addi	ra,ra,78 # 101f8 <end_except>
   101b2:	39a0006f          	j	1054c <ISR_TB_OVF>

000101b6 <illegal_insn_handler>:
   101b6:	711d                	addi	sp,sp,-96
   101b8:	ce86                	sw	ra,92(sp)
   101ba:	024000ef          	jal	ra,101de <store_regs>
   101be:	00000097          	auipc	ra,0x0
   101c2:	03a08093          	addi	ra,ra,58 # 101f8 <end_except>
   101c6:	05a0006f          	j	10220 <illegal_insn_handler_c>

000101ca <ecall_insn_handler>:
   101ca:	711d                	addi	sp,sp,-96
   101cc:	ce86                	sw	ra,92(sp)
   101ce:	010000ef          	jal	ra,101de <store_regs>
   101d2:	00000097          	auipc	ra,0x0
   101d6:	02608093          	addi	ra,ra,38 # 101f8 <end_except>
   101da:	04e0006f          	j	10228 <ecall_insn_handler_c>

000101de <store_regs>:
   101de:	c00e                	sw	gp,0(sp)
   101e0:	c212                	sw	tp,4(sp)
   101e2:	c416                	sw	t0,8(sp)
   101e4:	c61a                	sw	t1,12(sp)
   101e6:	c81e                	sw	t2,16(sp)
   101e8:	ca2a                	sw	a0,20(sp)
   101ea:	cc2e                	sw	a1,24(sp)
   101ec:	ce32                	sw	a2,28(sp)
   101ee:	d036                	sw	a3,32(sp)
   101f0:	d23a                	sw	a4,36(sp)
   101f2:	d43e                	sw	a5,40(sp)
   101f4:	00008067          	ret

000101f8 <end_except>:
   101f8:	4182                	lw	gp,0(sp)
   101fa:	4212                	lw	tp,4(sp)
   101fc:	42a2                	lw	t0,8(sp)
   101fe:	4332                	lw	t1,12(sp)
   10200:	43c2                	lw	t2,16(sp)
   10202:	4552                	lw	a0,20(sp)
   10204:	45e2                	lw	a1,24(sp)
   10206:	4672                	lw	a2,28(sp)
   10208:	5682                	lw	a3,32(sp)
   1020a:	5712                	lw	a4,36(sp)
   1020c:	57a2                	lw	a5,40(sp)
   1020e:	40f6                	lw	ra,92(sp)
   10210:	6125                	addi	sp,sp,96
   10212:	30200073          	mret

00010216 <_fini>:
   10216:	8082                	ret

00010218 <default_exception_handler_c>:
   10218:	1141                	addi	sp,sp,-16
   1021a:	c622                	sw	s0,12(sp)
   1021c:	0800                	addi	s0,sp,16
   1021e:	a001                	j	1021e <default_exception_handler_c+0x6>

00010220 <illegal_insn_handler_c>:
   10220:	1141                	addi	sp,sp,-16
   10222:	c622                	sw	s0,12(sp)
   10224:	0800                	addi	s0,sp,16
   10226:	a001                	j	10226 <illegal_insn_handler_c+0x6>

00010228 <ecall_insn_handler_c>:
   10228:	1141                	addi	sp,sp,-16
   1022a:	c622                	sw	s0,12(sp)
   1022c:	0800                	addi	s0,sp,16
   1022e:	a001                	j	1022e <ecall_insn_handler_c+0x6>

00010230 <set_pin_function>:
   10230:	7179                	addi	sp,sp,-48
   10232:	d622                	sw	s0,44(sp)
   10234:	1800                	addi	s0,sp,48
   10236:	fca42e23          	sw	a0,-36(s0)
   1023a:	fcb42c23          	sw	a1,-40(s0)
   1023e:	1a1077b7          	lui	a5,0x1a107
   10242:	439c                	lw	a5,0(a5)
   10244:	fef42623          	sw	a5,-20(s0)
   10248:	fdc42783          	lw	a5,-36(s0)
   1024c:	4705                	li	a4,1
   1024e:	00f717b3          	sll	a5,a4,a5
   10252:	fff7c713          	not	a4,a5
   10256:	fec42783          	lw	a5,-20(s0)
   1025a:	8ff9                	and	a5,a5,a4
   1025c:	fef42623          	sw	a5,-20(s0)
   10260:	fdc42783          	lw	a5,-36(s0)
   10264:	fd842703          	lw	a4,-40(s0)
   10268:	00f71733          	sll	a4,a4,a5
   1026c:	fec42783          	lw	a5,-20(s0)
   10270:	8fd9                	or	a5,a5,a4
   10272:	fef42623          	sw	a5,-20(s0)
   10276:	1a1077b7          	lui	a5,0x1a107
   1027a:	fec42703          	lw	a4,-20(s0)
   1027e:	c398                	sw	a4,0(a5)
   10280:	0001                	nop
   10282:	5432                	lw	s0,44(sp)
   10284:	6145                	addi	sp,sp,48
   10286:	8082                	ret

00010288 <get_pin_function>:
   10288:	7179                	addi	sp,sp,-48
   1028a:	d622                	sw	s0,44(sp)
   1028c:	1800                	addi	s0,sp,48
   1028e:	fca42e23          	sw	a0,-36(s0)
   10292:	1a1077b7          	lui	a5,0x1a107
   10296:	439c                	lw	a5,0(a5)
   10298:	fef42623          	sw	a5,-20(s0)
   1029c:	fec42703          	lw	a4,-20(s0)
   102a0:	fdc42783          	lw	a5,-36(s0)
   102a4:	40f757b3          	sra	a5,a4,a5
   102a8:	8b85                	andi	a5,a5,1
   102aa:	fef42623          	sw	a5,-20(s0)
   102ae:	fec42783          	lw	a5,-20(s0)
   102b2:	853e                	mv	a0,a5
   102b4:	5432                	lw	s0,44(sp)
   102b6:	6145                	addi	sp,sp,48
   102b8:	8082                	ret

000102ba <set_gpio_pin_direction>:
   102ba:	7179                	addi	sp,sp,-48
   102bc:	d622                	sw	s0,44(sp)
   102be:	1800                	addi	s0,sp,48
   102c0:	fca42e23          	sw	a0,-36(s0)
   102c4:	fcb42c23          	sw	a1,-40(s0)
   102c8:	1a1017b7          	lui	a5,0x1a101
   102cc:	439c                	lw	a5,0(a5)
   102ce:	fef42623          	sw	a5,-20(s0)
   102d2:	fd842783          	lw	a5,-40(s0)
   102d6:	ef91                	bnez	a5,102f2 <set_gpio_pin_direction+0x38>
   102d8:	fdc42783          	lw	a5,-36(s0)
   102dc:	4705                	li	a4,1
   102de:	00f717b3          	sll	a5,a4,a5
   102e2:	fff7c713          	not	a4,a5
   102e6:	fec42783          	lw	a5,-20(s0)
   102ea:	8ff9                	and	a5,a5,a4
   102ec:	fef42623          	sw	a5,-20(s0)
   102f0:	a819                	j	10306 <set_gpio_pin_direction+0x4c>
   102f2:	fdc42783          	lw	a5,-36(s0)
   102f6:	4705                	li	a4,1
   102f8:	00f71733          	sll	a4,a4,a5
   102fc:	fec42783          	lw	a5,-20(s0)
   10300:	8fd9                	or	a5,a5,a4
   10302:	fef42623          	sw	a5,-20(s0)
   10306:	1a1017b7          	lui	a5,0x1a101
   1030a:	fec42703          	lw	a4,-20(s0)
   1030e:	c398                	sw	a4,0(a5)
   10310:	0001                	nop
   10312:	5432                	lw	s0,44(sp)
   10314:	6145                	addi	sp,sp,48
   10316:	8082                	ret

00010318 <get_gpio_pin_direction>:
   10318:	7179                	addi	sp,sp,-48
   1031a:	d622                	sw	s0,44(sp)
   1031c:	1800                	addi	s0,sp,48
   1031e:	fca42e23          	sw	a0,-36(s0)
   10322:	1a1017b7          	lui	a5,0x1a101
   10326:	439c                	lw	a5,0(a5)
   10328:	fef42623          	sw	a5,-20(s0)
   1032c:	fec42703          	lw	a4,-20(s0)
   10330:	fdc42783          	lw	a5,-36(s0)
   10334:	0786                	slli	a5,a5,0x1
   10336:	40f757b3          	sra	a5,a4,a5
   1033a:	8b85                	andi	a5,a5,1
   1033c:	fef42623          	sw	a5,-20(s0)
   10340:	fec42783          	lw	a5,-20(s0)
   10344:	853e                	mv	a0,a5
   10346:	5432                	lw	s0,44(sp)
   10348:	6145                	addi	sp,sp,48
   1034a:	8082                	ret

0001034c <set_gpio_pin_value>:
   1034c:	7179                	addi	sp,sp,-48
   1034e:	d622                	sw	s0,44(sp)
   10350:	1800                	addi	s0,sp,48
   10352:	fca42e23          	sw	a0,-36(s0)
   10356:	fcb42c23          	sw	a1,-40(s0)
   1035a:	1a1017b7          	lui	a5,0x1a101
   1035e:	07a1                	addi	a5,a5,8
   10360:	439c                	lw	a5,0(a5)
   10362:	fef42623          	sw	a5,-20(s0)
   10366:	fd842783          	lw	a5,-40(s0)
   1036a:	ef91                	bnez	a5,10386 <set_gpio_pin_value+0x3a>
   1036c:	fdc42783          	lw	a5,-36(s0)
   10370:	4705                	li	a4,1
   10372:	00f717b3          	sll	a5,a4,a5
   10376:	fff7c713          	not	a4,a5
   1037a:	fec42783          	lw	a5,-20(s0)
   1037e:	8ff9                	and	a5,a5,a4
   10380:	fef42623          	sw	a5,-20(s0)
   10384:	a819                	j	1039a <set_gpio_pin_value+0x4e>
   10386:	fdc42783          	lw	a5,-36(s0)
   1038a:	4705                	li	a4,1
   1038c:	00f71733          	sll	a4,a4,a5
   10390:	fec42783          	lw	a5,-20(s0)
   10394:	8fd9                	or	a5,a5,a4
   10396:	fef42623          	sw	a5,-20(s0)
   1039a:	1a1017b7          	lui	a5,0x1a101
   1039e:	07a1                	addi	a5,a5,8
   103a0:	fec42703          	lw	a4,-20(s0)
   103a4:	c398                	sw	a4,0(a5)
   103a6:	0001                	nop
   103a8:	5432                	lw	s0,44(sp)
   103aa:	6145                	addi	sp,sp,48
   103ac:	8082                	ret

000103ae <get_gpio_pin_value>:
   103ae:	7179                	addi	sp,sp,-48
   103b0:	d622                	sw	s0,44(sp)
   103b2:	1800                	addi	s0,sp,48
   103b4:	fca42e23          	sw	a0,-36(s0)
   103b8:	1a1017b7          	lui	a5,0x1a101
   103bc:	0791                	addi	a5,a5,4
   103be:	439c                	lw	a5,0(a5)
   103c0:	fef42623          	sw	a5,-20(s0)
   103c4:	fec42703          	lw	a4,-20(s0)
   103c8:	fdc42783          	lw	a5,-36(s0)
   103cc:	40f757b3          	sra	a5,a4,a5
   103d0:	8b85                	andi	a5,a5,1
   103d2:	fef42623          	sw	a5,-20(s0)
   103d6:	fec42783          	lw	a5,-20(s0)
   103da:	853e                	mv	a0,a5
   103dc:	5432                	lw	s0,44(sp)
   103de:	6145                	addi	sp,sp,48
   103e0:	8082                	ret

000103e2 <set_gpio_pin_irq_en>:
   103e2:	7179                	addi	sp,sp,-48
   103e4:	d622                	sw	s0,44(sp)
   103e6:	1800                	addi	s0,sp,48
   103e8:	fca42e23          	sw	a0,-36(s0)
   103ec:	fcb42c23          	sw	a1,-40(s0)
   103f0:	1a1017b7          	lui	a5,0x1a101
   103f4:	07b1                	addi	a5,a5,12
   103f6:	439c                	lw	a5,0(a5)
   103f8:	fef42623          	sw	a5,-20(s0)
   103fc:	fd842783          	lw	a5,-40(s0)
   10400:	ef91                	bnez	a5,1041c <set_gpio_pin_irq_en+0x3a>
   10402:	fdc42783          	lw	a5,-36(s0)
   10406:	4705                	li	a4,1
   10408:	00f717b3          	sll	a5,a4,a5
   1040c:	fff7c793          	not	a5,a5
   10410:	fec42703          	lw	a4,-20(s0)
   10414:	8ff9                	and	a5,a5,a4
   10416:	fef42623          	sw	a5,-20(s0)
   1041a:	a819                	j	10430 <set_gpio_pin_irq_en+0x4e>
   1041c:	fdc42783          	lw	a5,-36(s0)
   10420:	4705                	li	a4,1
   10422:	00f717b3          	sll	a5,a4,a5
   10426:	fec42703          	lw	a4,-20(s0)
   1042a:	8fd9                	or	a5,a5,a4
   1042c:	fef42623          	sw	a5,-20(s0)
   10430:	1a1017b7          	lui	a5,0x1a101
   10434:	07b1                	addi	a5,a5,12
   10436:	fec42703          	lw	a4,-20(s0)
   1043a:	c398                	sw	a4,0(a5)
   1043c:	0001                	nop
   1043e:	5432                	lw	s0,44(sp)
   10440:	6145                	addi	sp,sp,48
   10442:	8082                	ret

00010444 <set_gpio_pin_irq_type>:
   10444:	7179                	addi	sp,sp,-48
   10446:	d622                	sw	s0,44(sp)
   10448:	1800                	addi	s0,sp,48
   1044a:	fca42e23          	sw	a0,-36(s0)
   1044e:	fcb42c23          	sw	a1,-40(s0)
   10452:	1a1017b7          	lui	a5,0x1a101
   10456:	07c1                	addi	a5,a5,16
   10458:	439c                	lw	a5,0(a5)
   1045a:	fef42623          	sw	a5,-20(s0)
   1045e:	1a1017b7          	lui	a5,0x1a101
   10462:	07d1                	addi	a5,a5,20
   10464:	439c                	lw	a5,0(a5)
   10466:	fef42423          	sw	a5,-24(s0)
   1046a:	fd842783          	lw	a5,-40(s0)
   1046e:	8b85                	andi	a5,a5,1
   10470:	ef91                	bnez	a5,1048c <set_gpio_pin_irq_type+0x48>
   10472:	fdc42783          	lw	a5,-36(s0)
   10476:	4705                	li	a4,1
   10478:	00f717b3          	sll	a5,a4,a5
   1047c:	fff7c793          	not	a5,a5
   10480:	fec42703          	lw	a4,-20(s0)
   10484:	8ff9                	and	a5,a5,a4
   10486:	fef42623          	sw	a5,-20(s0)
   1048a:	a819                	j	104a0 <set_gpio_pin_irq_type+0x5c>
   1048c:	fdc42783          	lw	a5,-36(s0)
   10490:	4705                	li	a4,1
   10492:	00f717b3          	sll	a5,a4,a5
   10496:	fec42703          	lw	a4,-20(s0)
   1049a:	8fd9                	or	a5,a5,a4
   1049c:	fef42623          	sw	a5,-20(s0)
   104a0:	fd842783          	lw	a5,-40(s0)
   104a4:	8b89                	andi	a5,a5,2
   104a6:	ef91                	bnez	a5,104c2 <set_gpio_pin_irq_type+0x7e>
   104a8:	fdc42783          	lw	a5,-36(s0)
   104ac:	4705                	li	a4,1
   104ae:	00f717b3          	sll	a5,a4,a5
   104b2:	fff7c793          	not	a5,a5
   104b6:	fe842703          	lw	a4,-24(s0)
   104ba:	8ff9                	and	a5,a5,a4
   104bc:	fef42423          	sw	a5,-24(s0)
   104c0:	a819                	j	104d6 <set_gpio_pin_irq_type+0x92>
   104c2:	fdc42783          	lw	a5,-36(s0)
   104c6:	4705                	li	a4,1
   104c8:	00f717b3          	sll	a5,a4,a5
   104cc:	fe842703          	lw	a4,-24(s0)
   104d0:	8fd9                	or	a5,a5,a4
   104d2:	fef42423          	sw	a5,-24(s0)
   104d6:	1a1017b7          	lui	a5,0x1a101
   104da:	07c1                	addi	a5,a5,16
   104dc:	fec42703          	lw	a4,-20(s0)
   104e0:	c398                	sw	a4,0(a5)
   104e2:	1a1017b7          	lui	a5,0x1a101
   104e6:	07d1                	addi	a5,a5,20
   104e8:	fe842703          	lw	a4,-24(s0)
   104ec:	c398                	sw	a4,0(a5)
   104ee:	0001                	nop
   104f0:	5432                	lw	s0,44(sp)
   104f2:	6145                	addi	sp,sp,48
   104f4:	8082                	ret

000104f6 <get_gpio_irq_status>:
   104f6:	1141                	addi	sp,sp,-16
   104f8:	c622                	sw	s0,12(sp)
   104fa:	0800                	addi	s0,sp,16
   104fc:	1a1017b7          	lui	a5,0x1a101
   10500:	07e1                	addi	a5,a5,24
   10502:	439c                	lw	a5,0(a5)
   10504:	853e                	mv	a0,a5
   10506:	4432                	lw	s0,12(sp)
   10508:	0141                	addi	sp,sp,16
   1050a:	8082                	ret

0001050c <ISR_SRAM>:
   1050c:	1141                	addi	sp,sp,-16
   1050e:	c622                	sw	s0,12(sp)
   10510:	0800                	addi	s0,sp,16
   10512:	a001                	j	10512 <ISR_SRAM+0x6>

00010514 <ISR_I2C>:
   10514:	1141                	addi	sp,sp,-16
   10516:	c622                	sw	s0,12(sp)
   10518:	0800                	addi	s0,sp,16
   1051a:	a001                	j	1051a <ISR_I2C+0x6>

0001051c <ISR_UART>:
   1051c:	1141                	addi	sp,sp,-16
   1051e:	c622                	sw	s0,12(sp)
   10520:	0800                	addi	s0,sp,16
   10522:	a001                	j	10522 <ISR_UART+0x6>

00010524 <ISR_GPIO>:
   10524:	1141                	addi	sp,sp,-16
   10526:	c622                	sw	s0,12(sp)
   10528:	0800                	addi	s0,sp,16
   1052a:	a001                	j	1052a <ISR_GPIO+0x6>

0001052c <ISR_SPIM0>:
   1052c:	1141                	addi	sp,sp,-16
   1052e:	c622                	sw	s0,12(sp)
   10530:	0800                	addi	s0,sp,16
   10532:	a001                	j	10532 <ISR_SPIM0+0x6>

00010534 <ISR_SPIM1>:
   10534:	1141                	addi	sp,sp,-16
   10536:	c622                	sw	s0,12(sp)
   10538:	0800                	addi	s0,sp,16
   1053a:	a001                	j	1053a <ISR_SPIM1+0x6>

0001053c <ISR_TA_OVF>:
   1053c:	1141                	addi	sp,sp,-16
   1053e:	c622                	sw	s0,12(sp)
   10540:	0800                	addi	s0,sp,16
   10542:	a001                	j	10542 <ISR_TA_OVF+0x6>

00010544 <ISR_TA_CMP>:
   10544:	1141                	addi	sp,sp,-16
   10546:	c622                	sw	s0,12(sp)
   10548:	0800                	addi	s0,sp,16
   1054a:	a001                	j	1054a <ISR_TA_CMP+0x6>

0001054c <ISR_TB_OVF>:
   1054c:	1141                	addi	sp,sp,-16
   1054e:	c622                	sw	s0,12(sp)
   10550:	0800                	addi	s0,sp,16
   10552:	a001                	j	10552 <ISR_TB_OVF+0x6>

00010554 <ISR_TB_CMP>:
   10554:	1141                	addi	sp,sp,-16
   10556:	c622                	sw	s0,12(sp)
   10558:	0800                	addi	s0,sp,16
   1055a:	a001                	j	1055a <ISR_TB_CMP+0x6>

0001055c <is_hex>:
   1055c:	1101                	addi	sp,sp,-32
   1055e:	ce22                	sw	s0,28(sp)
   10560:	1000                	addi	s0,sp,32
   10562:	87aa                	mv	a5,a0
   10564:	fef407a3          	sb	a5,-17(s0)
   10568:	fef44703          	lbu	a4,-17(s0)
   1056c:	04800793          	li	a5,72
   10570:	00e7e863          	bltu	a5,a4,10580 <is_hex+0x24>
   10574:	fef44703          	lbu	a4,-17(s0)
   10578:	04000793          	li	a5,64
   1057c:	02e7ea63          	bltu	a5,a4,105b0 <is_hex+0x54>
   10580:	fef44703          	lbu	a4,-17(s0)
   10584:	06800793          	li	a5,104
   10588:	00e7e863          	bltu	a5,a4,10598 <is_hex+0x3c>
   1058c:	fef44703          	lbu	a4,-17(s0)
   10590:	06000793          	li	a5,96
   10594:	00e7ee63          	bltu	a5,a4,105b0 <is_hex+0x54>
   10598:	fef44703          	lbu	a4,-17(s0)
   1059c:	03900793          	li	a5,57
   105a0:	00e7ea63          	bltu	a5,a4,105b4 <is_hex+0x58>
   105a4:	fef44703          	lbu	a4,-17(s0)
   105a8:	02f00793          	li	a5,47
   105ac:	00e7f463          	bgeu	a5,a4,105b4 <is_hex+0x58>
   105b0:	4785                	li	a5,1
   105b2:	a011                	j	105b6 <is_hex+0x5a>
   105b4:	4781                	li	a5,0
   105b6:	853e                	mv	a0,a5
   105b8:	4472                	lw	s0,28(sp)
   105ba:	6105                	addi	sp,sp,32
   105bc:	8082                	ret

000105be <one_count>:
   105be:	7179                	addi	sp,sp,-48
   105c0:	d622                	sw	s0,44(sp)
   105c2:	1800                	addi	s0,sp,48
   105c4:	fca42e23          	sw	a0,-36(s0)
   105c8:	fe0407a3          	sb	zero,-17(s0)
   105cc:	fe042423          	sw	zero,-24(s0)
   105d0:	a015                	j	105f4 <one_count+0x36>
   105d2:	fdc42783          	lw	a5,-36(s0)
   105d6:	0ff7f793          	andi	a5,a5,255
   105da:	8b85                	andi	a5,a5,1
   105dc:	0ff7f713          	andi	a4,a5,255
   105e0:	fef44783          	lbu	a5,-17(s0)
   105e4:	97ba                	add	a5,a5,a4
   105e6:	fef407a3          	sb	a5,-17(s0)
   105ea:	fdc42783          	lw	a5,-36(s0)
   105ee:	8385                	srli	a5,a5,0x1
   105f0:	fcf42e23          	sw	a5,-36(s0)
   105f4:	fdc42783          	lw	a5,-36(s0)
   105f8:	ffe9                	bnez	a5,105d2 <one_count+0x14>
   105fa:	fef44783          	lbu	a5,-17(s0)
   105fe:	853e                	mv	a0,a5
   10600:	5432                	lw	s0,44(sp)
   10602:	6145                	addi	sp,sp,48
   10604:	8082                	ret

00010606 <jump_and_start>:
   10606:	1101                	addi	sp,sp,-32
   10608:	ce22                	sw	s0,28(sp)
   1060a:	1000                	addi	s0,sp,32
   1060c:	fea42623          	sw	a0,-20(s0)
   10610:	fec42783          	lw	a5,-20(s0)
   10614:	00078067          	jr	a5 # 1a101000 <_stack_start+0x19ffd000>
   10618:	0001                	nop
   1061a:	0001                	nop
   1061c:	0001                	nop
   1061e:	0001                	nop
   10620:	4472                	lw	s0,28(sp)
   10622:	6105                	addi	sp,sp,32
   10624:	8082                	ret

00010626 <main>:
   10626:	7139                	addi	sp,sp,-64
   10628:	de06                	sw	ra,60(sp)
   1062a:	dc22                	sw	s0,56(sp)
   1062c:	da26                	sw	s1,52(sp)
   1062e:	0080                	addi	s0,sp,64
   10630:	45b1                	li	a1,12
   10632:	4501                	li	a0,0
   10634:	701000ef          	jal	ra,11534 <uart_set_cfg>
   10638:	fe042623          	sw	zero,-20(s0)
   1063c:	fe042423          	sw	zero,-24(s0)
   10640:	fe042223          	sw	zero,-28(s0)
   10644:	a831                	j	10660 <main+0x3a>
   10646:	4585                	li	a1,1
   10648:	fe442503          	lw	a0,-28(s0)
   1064c:	31bd                	jal	102ba <set_gpio_pin_direction>
   1064e:	4585                	li	a1,1
   10650:	fe442503          	lw	a0,-28(s0)
   10654:	39e5                	jal	1034c <set_gpio_pin_value>
   10656:	fe442783          	lw	a5,-28(s0)
   1065a:	0785                	addi	a5,a5,1
   1065c:	fef42223          	sw	a5,-28(s0)
   10660:	fe442703          	lw	a4,-28(s0)
   10664:	479d                	li	a5,7
   10666:	fee7d0e3          	bge	a5,a4,10646 <main+0x20>
   1066a:	67c9                	lui	a5,0x12
   1066c:	85478513          	addi	a0,a5,-1964 # 11854 <__DTOR_END__>
   10670:	157000ef          	jal	ra,10fc6 <puts>
   10674:	67c9                	lui	a5,0x12
   10676:	86478513          	addi	a0,a5,-1948 # 11864 <__DTOR_END__+0x10>
   1067a:	14d000ef          	jal	ra,10fc6 <puts>
   1067e:	00e010ef          	jal	ra,1168c <uart_wait_tx_done>
   10682:	fe042023          	sw	zero,-32(s0)
   10686:	fe042483          	lw	s1,-32(s0)
   1068a:	00148793          	addi	a5,s1,1
   1068e:	fef42023          	sw	a5,-32(s0)
   10692:	7a1000ef          	jal	ra,11632 <uart_getchar>
   10696:	87aa                	mv	a5,a0
   10698:	873e                	mv	a4,a5
   1069a:	ff040793          	addi	a5,s0,-16
   1069e:	97a6                	add	a5,a5,s1
   106a0:	fee78023          	sb	a4,-32(a5)
   106a4:	ff040793          	addi	a5,s0,-16
   106a8:	97a6                	add	a5,a5,s1
   106aa:	fe07c783          	lbu	a5,-32(a5)
   106ae:	853e                	mv	a0,a5
   106b0:	3575                	jal	1055c <is_hex>
   106b2:	87aa                	mv	a5,a0
   106b4:	e795                	bnez	a5,106e0 <main+0xba>
   106b6:	fe042783          	lw	a5,-32(s0)
   106ba:	17fd                	addi	a5,a5,-1
   106bc:	ff040713          	addi	a4,s0,-16
   106c0:	97ba                	add	a5,a5,a4
   106c2:	fe07c703          	lbu	a4,-32(a5)
   106c6:	04000793          	li	a5,64
   106ca:	02f71163          	bne	a4,a5,106ec <main+0xc6>
   106ce:	4785                	li	a5,1
   106d0:	fef42423          	sw	a5,-24(s0)
   106d4:	fe042783          	lw	a5,-32(s0)
   106d8:	17fd                	addi	a5,a5,-1
   106da:	fef42023          	sw	a5,-32(s0)
   106de:	a031                	j	106ea <main+0xc4>
   106e0:	fe042703          	lw	a4,-32(s0)
   106e4:	47cd                	li	a5,19
   106e6:	00e7c563          	blt	a5,a4,106f0 <main+0xca>
   106ea:	bf71                	j	10686 <main+0x60>
   106ec:	0001                	nop
   106ee:	a011                	j	106f2 <main+0xcc>
   106f0:	0001                	nop
   106f2:	fe842783          	lw	a5,-24(s0)
   106f6:	cb99                	beqz	a5,1070c <main+0xe6>
   106f8:	fd040793          	addi	a5,s0,-48
   106fc:	853e                	mv	a0,a5
   106fe:	2a09                	jal	10810 <str_to_int>
   10700:	87aa                	mv	a5,a0
   10702:	fef42623          	sw	a5,-20(s0)
   10706:	fe042423          	sw	zero,-24(s0)
   1070a:	a0b1                	j	10756 <main+0x130>
   1070c:	fc040c23          	sb	zero,-40(s0)
   10710:	fe042783          	lw	a5,-32(s0)
   10714:	17fd                	addi	a5,a5,-1
   10716:	ff040713          	addi	a4,s0,-16
   1071a:	97ba                	add	a5,a5,a4
   1071c:	fe07c703          	lbu	a4,-32(a5)
   10720:	07100793          	li	a5,113
   10724:	02f70a63          	beq	a4,a5,10758 <main+0x132>
   10728:	fd040793          	addi	a5,s0,-48
   1072c:	853e                	mv	a0,a5
   1072e:	20cd                	jal	10810 <str_to_int>
   10730:	87aa                	mv	a5,a0
   10732:	fcf42e23          	sw	a5,-36(s0)
   10736:	fec42783          	lw	a5,-20(s0)
   1073a:	00478713          	addi	a4,a5,4
   1073e:	fee42623          	sw	a4,-20(s0)
   10742:	fdc42703          	lw	a4,-36(s0)
   10746:	c398                	sw	a4,0(a5)
   10748:	fdc42503          	lw	a0,-36(s0)
   1074c:	3d8d                	jal	105be <one_count>
   1074e:	87aa                	mv	a5,a0
   10750:	853e                	mv	a0,a5
   10752:	70d000ef          	jal	ra,1165e <uart_sendchar>
   10756:	b735                	j	10682 <main+0x5c>
   10758:	0001                	nop
   1075a:	02200593          	li	a1,34
   1075e:	67c9                	lui	a5,0x12
   10760:	89078513          	addi	a0,a5,-1904 # 11890 <__DTOR_END__+0x3c>
   10764:	65d000ef          	jal	ra,115c0 <uart_send>
   10768:	725000ef          	jal	ra,1168c <uart_wait_tx_done>
   1076c:	1a1077b7          	lui	a5,0x1a107
   10770:	07a1                	addi	a5,a5,8
   10772:	0007a023          	sw	zero,0(a5) # 1a107000 <_stack_start+0x1a003000>
   10776:	08000513          	li	a0,128
   1077a:	3571                	jal	10606 <jump_and_start>
   1077c:	67c9                	lui	a5,0x12
   1077e:	8b478513          	addi	a0,a5,-1868 # 118b4 <__DTOR_END__+0x60>
   10782:	045000ef          	jal	ra,10fc6 <puts>
   10786:	bfdd                	j	1077c <main+0x156>

00010788 <hex_to_string>:
   10788:	7139                	addi	sp,sp,-64
   1078a:	de22                	sw	s0,60(sp)
   1078c:	0080                	addi	s0,sp,64
   1078e:	fca42623          	sw	a0,-52(s0)
   10792:	fcb42423          	sw	a1,-56(s0)
   10796:	67c9                	lui	a5,0x12
   10798:	8d878793          	addi	a5,a5,-1832 # 118d8 <__DTOR_END__+0x84>
   1079c:	4390                	lw	a2,0(a5)
   1079e:	43d4                	lw	a3,4(a5)
   107a0:	4798                	lw	a4,8(a5)
   107a2:	47dc                	lw	a5,12(a5)
   107a4:	fcc42e23          	sw	a2,-36(s0)
   107a8:	fed42023          	sw	a3,-32(s0)
   107ac:	fee42223          	sw	a4,-28(s0)
   107b0:	fef42423          	sw	a5,-24(s0)
   107b4:	fe042623          	sw	zero,-20(s0)
   107b8:	a835                	j	107f4 <hex_to_string+0x6c>
   107ba:	471d                	li	a4,7
   107bc:	fec42783          	lw	a5,-20(s0)
   107c0:	40f707b3          	sub	a5,a4,a5
   107c4:	078a                	slli	a5,a5,0x2
   107c6:	fc842703          	lw	a4,-56(s0)
   107ca:	00f757b3          	srl	a5,a4,a5
   107ce:	00f7f713          	andi	a4,a5,15
   107d2:	fec42783          	lw	a5,-20(s0)
   107d6:	fcc42683          	lw	a3,-52(s0)
   107da:	97b6                	add	a5,a5,a3
   107dc:	ff040693          	addi	a3,s0,-16
   107e0:	9736                	add	a4,a4,a3
   107e2:	fec74703          	lbu	a4,-20(a4)
   107e6:	00e78023          	sb	a4,0(a5)
   107ea:	fec42783          	lw	a5,-20(s0)
   107ee:	0785                	addi	a5,a5,1
   107f0:	fef42623          	sw	a5,-20(s0)
   107f4:	fec42703          	lw	a4,-20(s0)
   107f8:	479d                	li	a5,7
   107fa:	fce7d0e3          	bge	a5,a4,107ba <hex_to_string+0x32>
   107fe:	fcc42783          	lw	a5,-52(s0)
   10802:	07a1                	addi	a5,a5,8
   10804:	00078023          	sb	zero,0(a5)
   10808:	0001                	nop
   1080a:	5472                	lw	s0,60(sp)
   1080c:	6121                	addi	sp,sp,64
   1080e:	8082                	ret

00010810 <str_to_int>:
   10810:	7179                	addi	sp,sp,-48
   10812:	d622                	sw	s0,44(sp)
   10814:	1800                	addi	s0,sp,48
   10816:	fca42e23          	sw	a0,-36(s0)
   1081a:	fe042623          	sw	zero,-20(s0)
   1081e:	fe042423          	sw	zero,-24(s0)
   10822:	aa21                	j	1093a <str_to_int+0x12a>
   10824:	fe842783          	lw	a5,-24(s0)
   10828:	fdc42703          	lw	a4,-36(s0)
   1082c:	97ba                	add	a5,a5,a4
   1082e:	0007c703          	lbu	a4,0(a5)
   10832:	03900793          	li	a5,57
   10836:	04e7e463          	bltu	a5,a4,1087e <str_to_int+0x6e>
   1083a:	fe842783          	lw	a5,-24(s0)
   1083e:	fdc42703          	lw	a4,-36(s0)
   10842:	97ba                	add	a5,a5,a4
   10844:	0007c703          	lbu	a4,0(a5)
   10848:	02f00793          	li	a5,47
   1084c:	02e7f963          	bgeu	a5,a4,1087e <str_to_int+0x6e>
   10850:	fe842783          	lw	a5,-24(s0)
   10854:	fdc42703          	lw	a4,-36(s0)
   10858:	97ba                	add	a5,a5,a4
   1085a:	0007c783          	lbu	a5,0(a5)
   1085e:	fd078713          	addi	a4,a5,-48
   10862:	469d                	li	a3,7
   10864:	fe842783          	lw	a5,-24(s0)
   10868:	40f687b3          	sub	a5,a3,a5
   1086c:	078a                	slli	a5,a5,0x2
   1086e:	00f717b3          	sll	a5,a4,a5
   10872:	fec42703          	lw	a4,-20(s0)
   10876:	8fd9                	or	a5,a5,a4
   10878:	fef42623          	sw	a5,-20(s0)
   1087c:	a855                	j	10930 <str_to_int+0x120>
   1087e:	fe842783          	lw	a5,-24(s0)
   10882:	fdc42703          	lw	a4,-36(s0)
   10886:	97ba                	add	a5,a5,a4
   10888:	0007c703          	lbu	a4,0(a5)
   1088c:	04600793          	li	a5,70
   10890:	04e7e463          	bltu	a5,a4,108d8 <str_to_int+0xc8>
   10894:	fe842783          	lw	a5,-24(s0)
   10898:	fdc42703          	lw	a4,-36(s0)
   1089c:	97ba                	add	a5,a5,a4
   1089e:	0007c703          	lbu	a4,0(a5)
   108a2:	04000793          	li	a5,64
   108a6:	02e7f963          	bgeu	a5,a4,108d8 <str_to_int+0xc8>
   108aa:	fe842783          	lw	a5,-24(s0)
   108ae:	fdc42703          	lw	a4,-36(s0)
   108b2:	97ba                	add	a5,a5,a4
   108b4:	0007c783          	lbu	a5,0(a5)
   108b8:	fc978713          	addi	a4,a5,-55
   108bc:	469d                	li	a3,7
   108be:	fe842783          	lw	a5,-24(s0)
   108c2:	40f687b3          	sub	a5,a3,a5
   108c6:	078a                	slli	a5,a5,0x2
   108c8:	00f717b3          	sll	a5,a4,a5
   108cc:	fec42703          	lw	a4,-20(s0)
   108d0:	8fd9                	or	a5,a5,a4
   108d2:	fef42623          	sw	a5,-20(s0)
   108d6:	a8a9                	j	10930 <str_to_int+0x120>
   108d8:	fe842783          	lw	a5,-24(s0)
   108dc:	fdc42703          	lw	a4,-36(s0)
   108e0:	97ba                	add	a5,a5,a4
   108e2:	0007c703          	lbu	a4,0(a5)
   108e6:	06600793          	li	a5,102
   108ea:	04e7e363          	bltu	a5,a4,10930 <str_to_int+0x120>
   108ee:	fe842783          	lw	a5,-24(s0)
   108f2:	fdc42703          	lw	a4,-36(s0)
   108f6:	97ba                	add	a5,a5,a4
   108f8:	0007c703          	lbu	a4,0(a5)
   108fc:	06000793          	li	a5,96
   10900:	02e7f863          	bgeu	a5,a4,10930 <str_to_int+0x120>
   10904:	fe842783          	lw	a5,-24(s0)
   10908:	fdc42703          	lw	a4,-36(s0)
   1090c:	97ba                	add	a5,a5,a4
   1090e:	0007c783          	lbu	a5,0(a5)
   10912:	fa978713          	addi	a4,a5,-87
   10916:	469d                	li	a3,7
   10918:	fe842783          	lw	a5,-24(s0)
   1091c:	40f687b3          	sub	a5,a3,a5
   10920:	078a                	slli	a5,a5,0x2
   10922:	00f717b3          	sll	a5,a4,a5
   10926:	fec42703          	lw	a4,-20(s0)
   1092a:	8fd9                	or	a5,a5,a4
   1092c:	fef42623          	sw	a5,-20(s0)
   10930:	fe842783          	lw	a5,-24(s0)
   10934:	0785                	addi	a5,a5,1
   10936:	fef42423          	sw	a5,-24(s0)
   1093a:	fe842703          	lw	a4,-24(s0)
   1093e:	479d                	li	a5,7
   10940:	eee7d2e3          	bge	a5,a4,10824 <str_to_int+0x14>
   10944:	fec42783          	lw	a5,-20(s0)
   10948:	853e                	mv	a0,a5
   1094a:	5432                	lw	s0,44(sp)
   1094c:	6145                	addi	sp,sp,48
   1094e:	8082                	ret

00010950 <divu10>:
   10950:	7179                	addi	sp,sp,-48
   10952:	d622                	sw	s0,44(sp)
   10954:	1800                	addi	s0,sp,48
   10956:	fca42e23          	sw	a0,-36(s0)
   1095a:	fdc42783          	lw	a5,-36(s0)
   1095e:	0017d713          	srli	a4,a5,0x1
   10962:	fdc42783          	lw	a5,-36(s0)
   10966:	8389                	srli	a5,a5,0x2
   10968:	97ba                	add	a5,a5,a4
   1096a:	fef42623          	sw	a5,-20(s0)
   1096e:	fec42783          	lw	a5,-20(s0)
   10972:	8391                	srli	a5,a5,0x4
   10974:	fec42703          	lw	a4,-20(s0)
   10978:	97ba                	add	a5,a5,a4
   1097a:	fef42623          	sw	a5,-20(s0)
   1097e:	fec42783          	lw	a5,-20(s0)
   10982:	83a1                	srli	a5,a5,0x8
   10984:	fec42703          	lw	a4,-20(s0)
   10988:	97ba                	add	a5,a5,a4
   1098a:	fef42623          	sw	a5,-20(s0)
   1098e:	fec42783          	lw	a5,-20(s0)
   10992:	83c1                	srli	a5,a5,0x10
   10994:	fec42703          	lw	a4,-20(s0)
   10998:	97ba                	add	a5,a5,a4
   1099a:	fef42623          	sw	a5,-20(s0)
   1099e:	fec42783          	lw	a5,-20(s0)
   109a2:	838d                	srli	a5,a5,0x3
   109a4:	fef42623          	sw	a5,-20(s0)
   109a8:	fec42703          	lw	a4,-20(s0)
   109ac:	87ba                	mv	a5,a4
   109ae:	078a                	slli	a5,a5,0x2
   109b0:	97ba                	add	a5,a5,a4
   109b2:	0786                	slli	a5,a5,0x1
   109b4:	873e                	mv	a4,a5
   109b6:	fdc42783          	lw	a5,-36(s0)
   109ba:	8f99                	sub	a5,a5,a4
   109bc:	fef42423          	sw	a5,-24(s0)
   109c0:	fe842783          	lw	a5,-24(s0)
   109c4:	0799                	addi	a5,a5,6
   109c6:	0047d713          	srli	a4,a5,0x4
   109ca:	fec42783          	lw	a5,-20(s0)
   109ce:	97ba                	add	a5,a5,a4
   109d0:	853e                	mv	a0,a5
   109d2:	5432                	lw	s0,44(sp)
   109d4:	6145                	addi	sp,sp,48
   109d6:	8082                	ret

000109d8 <remu10>:
   109d8:	1101                	addi	sp,sp,-32
   109da:	ce22                	sw	s0,28(sp)
   109dc:	1000                	addi	s0,sp,32
   109de:	fea42623          	sw	a0,-20(s0)
   109e2:	fec42703          	lw	a4,-20(s0)
   109e6:	1999a7b7          	lui	a5,0x1999a
   109ea:	99978793          	addi	a5,a5,-1639 # 19999999 <_stack_start+0x19895999>
   109ee:	02f70733          	mul	a4,a4,a5
   109f2:	fec42783          	lw	a5,-20(s0)
   109f6:	8385                	srli	a5,a5,0x1
   109f8:	973e                	add	a4,a4,a5
   109fa:	fec42783          	lw	a5,-20(s0)
   109fe:	838d                	srli	a5,a5,0x3
   10a00:	97ba                	add	a5,a5,a4
   10a02:	83f1                	srli	a5,a5,0x1c
   10a04:	fef42623          	sw	a5,-20(s0)
   10a08:	67c9                	lui	a5,0x12
   10a0a:	97078713          	addi	a4,a5,-1680 # 11970 <remu10_table>
   10a0e:	fec42783          	lw	a5,-20(s0)
   10a12:	97ba                	add	a5,a5,a4
   10a14:	0007c783          	lbu	a5,0(a5)
   10a18:	853e                	mv	a0,a5
   10a1a:	4472                	lw	s0,28(sp)
   10a1c:	6105                	addi	sp,sp,32
   10a1e:	8082                	ret

00010a20 <putchar>:
   10a20:	1101                	addi	sp,sp,-32
   10a22:	ce06                	sw	ra,28(sp)
   10a24:	cc22                	sw	s0,24(sp)
   10a26:	1000                	addi	s0,sp,32
   10a28:	fea42623          	sw	a0,-20(s0)
   10a2c:	fec42783          	lw	a5,-20(s0)
   10a30:	0ff7f793          	andi	a5,a5,255
   10a34:	853e                	mv	a0,a5
   10a36:	429000ef          	jal	ra,1165e <uart_sendchar>
   10a3a:	fec42783          	lw	a5,-20(s0)
   10a3e:	853e                	mv	a0,a5
   10a40:	40f2                	lw	ra,28(sp)
   10a42:	4462                	lw	s0,24(sp)
   10a44:	6105                	addi	sp,sp,32
   10a46:	8082                	ret

00010a48 <qprintchar>:
   10a48:	1101                	addi	sp,sp,-32
   10a4a:	ce06                	sw	ra,28(sp)
   10a4c:	cc22                	sw	s0,24(sp)
   10a4e:	1000                	addi	s0,sp,32
   10a50:	fea42623          	sw	a0,-20(s0)
   10a54:	feb42423          	sw	a1,-24(s0)
   10a58:	fec42783          	lw	a5,-20(s0)
   10a5c:	c39d                	beqz	a5,10a82 <qprintchar+0x3a>
   10a5e:	fec42783          	lw	a5,-20(s0)
   10a62:	439c                	lw	a5,0(a5)
   10a64:	fe842703          	lw	a4,-24(s0)
   10a68:	0ff77713          	andi	a4,a4,255
   10a6c:	00e78023          	sb	a4,0(a5)
   10a70:	fec42783          	lw	a5,-20(s0)
   10a74:	439c                	lw	a5,0(a5)
   10a76:	00178713          	addi	a4,a5,1
   10a7a:	fec42783          	lw	a5,-20(s0)
   10a7e:	c398                	sw	a4,0(a5)
   10a80:	a039                	j	10a8e <qprintchar+0x46>
   10a82:	fe842783          	lw	a5,-24(s0)
   10a86:	0ff7f793          	andi	a5,a5,255
   10a8a:	853e                	mv	a0,a5
   10a8c:	3f51                	jal	10a20 <putchar>
   10a8e:	0001                	nop
   10a90:	40f2                	lw	ra,28(sp)
   10a92:	4462                	lw	s0,24(sp)
   10a94:	6105                	addi	sp,sp,32
   10a96:	8082                	ret

00010a98 <qprints>:
   10a98:	7179                	addi	sp,sp,-48
   10a9a:	d606                	sw	ra,44(sp)
   10a9c:	d422                	sw	s0,40(sp)
   10a9e:	d226                	sw	s1,36(sp)
   10aa0:	d04a                	sw	s2,32(sp)
   10aa2:	ce4e                	sw	s3,28(sp)
   10aa4:	cc52                	sw	s4,24(sp)
   10aa6:	1800                	addi	s0,sp,48
   10aa8:	fca42e23          	sw	a0,-36(s0)
   10aac:	fcb42c23          	sw	a1,-40(s0)
   10ab0:	fcc42a23          	sw	a2,-44(s0)
   10ab4:	fcd42823          	sw	a3,-48(s0)
   10ab8:	4481                	li	s1,0
   10aba:	02000a13          	li	s4,32
   10abe:	fd442783          	lw	a5,-44(s0)
   10ac2:	02f05e63          	blez	a5,10afe <qprints+0x66>
   10ac6:	4901                	li	s2,0
   10ac8:	fd842983          	lw	s3,-40(s0)
   10acc:	a019                	j	10ad2 <qprints+0x3a>
   10ace:	0905                	addi	s2,s2,1
   10ad0:	0985                	addi	s3,s3,1
   10ad2:	0009c783          	lbu	a5,0(s3)
   10ad6:	ffe5                	bnez	a5,10ace <qprints+0x36>
   10ad8:	fd442783          	lw	a5,-44(s0)
   10adc:	00f94563          	blt	s2,a5,10ae6 <qprints+0x4e>
   10ae0:	fc042a23          	sw	zero,-44(s0)
   10ae4:	a039                	j	10af2 <qprints+0x5a>
   10ae6:	fd442783          	lw	a5,-44(s0)
   10aea:	412787b3          	sub	a5,a5,s2
   10aee:	fcf42a23          	sw	a5,-44(s0)
   10af2:	fd042783          	lw	a5,-48(s0)
   10af6:	8b89                	andi	a5,a5,2
   10af8:	c399                	beqz	a5,10afe <qprints+0x66>
   10afa:	03000a13          	li	s4,48
   10afe:	fd042783          	lw	a5,-48(s0)
   10b02:	8b85                	andi	a5,a5,1
   10b04:	ef9d                	bnez	a5,10b42 <qprints+0xaa>
   10b06:	a819                	j	10b1c <qprints+0x84>
   10b08:	85d2                	mv	a1,s4
   10b0a:	fdc42503          	lw	a0,-36(s0)
   10b0e:	3f2d                	jal	10a48 <qprintchar>
   10b10:	0485                	addi	s1,s1,1
   10b12:	fd442783          	lw	a5,-44(s0)
   10b16:	17fd                	addi	a5,a5,-1
   10b18:	fcf42a23          	sw	a5,-44(s0)
   10b1c:	fd442783          	lw	a5,-44(s0)
   10b20:	fef044e3          	bgtz	a5,10b08 <qprints+0x70>
   10b24:	a839                	j	10b42 <qprints+0xaa>
   10b26:	fd842783          	lw	a5,-40(s0)
   10b2a:	0007c783          	lbu	a5,0(a5)
   10b2e:	85be                	mv	a1,a5
   10b30:	fdc42503          	lw	a0,-36(s0)
   10b34:	3f11                	jal	10a48 <qprintchar>
   10b36:	0485                	addi	s1,s1,1
   10b38:	fd842783          	lw	a5,-40(s0)
   10b3c:	0785                	addi	a5,a5,1
   10b3e:	fcf42c23          	sw	a5,-40(s0)
   10b42:	fd842783          	lw	a5,-40(s0)
   10b46:	0007c783          	lbu	a5,0(a5)
   10b4a:	fff1                	bnez	a5,10b26 <qprints+0x8e>
   10b4c:	a819                	j	10b62 <qprints+0xca>
   10b4e:	85d2                	mv	a1,s4
   10b50:	fdc42503          	lw	a0,-36(s0)
   10b54:	3dd5                	jal	10a48 <qprintchar>
   10b56:	0485                	addi	s1,s1,1
   10b58:	fd442783          	lw	a5,-44(s0)
   10b5c:	17fd                	addi	a5,a5,-1
   10b5e:	fcf42a23          	sw	a5,-44(s0)
   10b62:	fd442783          	lw	a5,-44(s0)
   10b66:	fef044e3          	bgtz	a5,10b4e <qprints+0xb6>
   10b6a:	87a6                	mv	a5,s1
   10b6c:	853e                	mv	a0,a5
   10b6e:	50b2                	lw	ra,44(sp)
   10b70:	5422                	lw	s0,40(sp)
   10b72:	5492                	lw	s1,36(sp)
   10b74:	5902                	lw	s2,32(sp)
   10b76:	49f2                	lw	s3,28(sp)
   10b78:	4a62                	lw	s4,24(sp)
   10b7a:	6145                	addi	sp,sp,48
   10b7c:	8082                	ret

00010b7e <qprinti>:
   10b7e:	7159                	addi	sp,sp,-112
   10b80:	d686                	sw	ra,108(sp)
   10b82:	d4a2                	sw	s0,104(sp)
   10b84:	d2a6                	sw	s1,100(sp)
   10b86:	d0ca                	sw	s2,96(sp)
   10b88:	cece                	sw	s3,92(sp)
   10b8a:	1880                	addi	s0,sp,112
   10b8c:	faa42623          	sw	a0,-84(s0)
   10b90:	fab42423          	sw	a1,-88(s0)
   10b94:	fac42223          	sw	a2,-92(s0)
   10b98:	fad42023          	sw	a3,-96(s0)
   10b9c:	f8e42e23          	sw	a4,-100(s0)
   10ba0:	f8f42c23          	sw	a5,-104(s0)
   10ba4:	87c2                	mv	a5,a6
   10ba6:	f8f40ba3          	sb	a5,-105(s0)
   10baa:	4981                	li	s3,0
   10bac:	4901                	li	s2,0
   10bae:	fa842783          	lw	a5,-88(s0)
   10bb2:	fcf42e23          	sw	a5,-36(s0)
   10bb6:	fa842783          	lw	a5,-88(s0)
   10bba:	e39d                	bnez	a5,10be0 <qprinti+0x62>
   10bbc:	03000793          	li	a5,48
   10bc0:	faf40c23          	sb	a5,-72(s0)
   10bc4:	fa040ca3          	sb	zero,-71(s0)
   10bc8:	fb840793          	addi	a5,s0,-72
   10bcc:	f9842683          	lw	a3,-104(s0)
   10bd0:	f9c42603          	lw	a2,-100(s0)
   10bd4:	85be                	mv	a1,a5
   10bd6:	fac42503          	lw	a0,-84(s0)
   10bda:	3d7d                	jal	10a98 <qprints>
   10bdc:	87aa                	mv	a5,a0
   10bde:	a8fd                	j	10cdc <qprinti+0x15e>
   10be0:	fa042783          	lw	a5,-96(s0)
   10be4:	c38d                	beqz	a5,10c06 <qprinti+0x88>
   10be6:	fa442703          	lw	a4,-92(s0)
   10bea:	47a9                	li	a5,10
   10bec:	00f71d63          	bne	a4,a5,10c06 <qprinti+0x88>
   10bf0:	fa842783          	lw	a5,-88(s0)
   10bf4:	0007d963          	bgez	a5,10c06 <qprinti+0x88>
   10bf8:	4985                	li	s3,1
   10bfa:	fa842783          	lw	a5,-88(s0)
   10bfe:	40f007b3          	neg	a5,a5
   10c02:	fcf42e23          	sw	a5,-36(s0)
   10c06:	fb840493          	addi	s1,s0,-72
   10c0a:	04fd                	addi	s1,s1,31
   10c0c:	00048023          	sb	zero,0(s1)
   10c10:	fa442703          	lw	a4,-92(s0)
   10c14:	47c1                	li	a5,16
   10c16:	06f71c63          	bne	a4,a5,10c8e <qprinti+0x110>
   10c1a:	a0a1                	j	10c62 <qprinti+0xe4>
   10c1c:	fdc42783          	lw	a5,-36(s0)
   10c20:	8bbd                	andi	a5,a5,15
   10c22:	fcf42c23          	sw	a5,-40(s0)
   10c26:	fd842703          	lw	a4,-40(s0)
   10c2a:	47a5                	li	a5,9
   10c2c:	00e7db63          	bge	a5,a4,10c42 <qprinti+0xc4>
   10c30:	f9744783          	lbu	a5,-105(s0)
   10c34:	fc678793          	addi	a5,a5,-58
   10c38:	fd842703          	lw	a4,-40(s0)
   10c3c:	97ba                	add	a5,a5,a4
   10c3e:	fcf42c23          	sw	a5,-40(s0)
   10c42:	fd842783          	lw	a5,-40(s0)
   10c46:	0ff7f793          	andi	a5,a5,255
   10c4a:	14fd                	addi	s1,s1,-1
   10c4c:	03078793          	addi	a5,a5,48
   10c50:	0ff7f793          	andi	a5,a5,255
   10c54:	00f48023          	sb	a5,0(s1)
   10c58:	fdc42783          	lw	a5,-36(s0)
   10c5c:	8391                	srli	a5,a5,0x4
   10c5e:	fcf42e23          	sw	a5,-36(s0)
   10c62:	fdc42783          	lw	a5,-36(s0)
   10c66:	fbdd                	bnez	a5,10c1c <qprinti+0x9e>
   10c68:	a035                	j	10c94 <qprinti+0x116>
   10c6a:	fdc42503          	lw	a0,-36(s0)
   10c6e:	33ad                	jal	109d8 <remu10>
   10c70:	87aa                	mv	a5,a0
   10c72:	0ff7f793          	andi	a5,a5,255
   10c76:	14fd                	addi	s1,s1,-1
   10c78:	03078793          	addi	a5,a5,48
   10c7c:	0ff7f793          	andi	a5,a5,255
   10c80:	00f48023          	sb	a5,0(s1)
   10c84:	fdc42503          	lw	a0,-36(s0)
   10c88:	31e1                	jal	10950 <divu10>
   10c8a:	fca42e23          	sw	a0,-36(s0)
   10c8e:	fdc42783          	lw	a5,-36(s0)
   10c92:	ffe1                	bnez	a5,10c6a <qprinti+0xec>
   10c94:	02098a63          	beqz	s3,10cc8 <qprinti+0x14a>
   10c98:	f9c42783          	lw	a5,-100(s0)
   10c9c:	c38d                	beqz	a5,10cbe <qprinti+0x140>
   10c9e:	f9842783          	lw	a5,-104(s0)
   10ca2:	8b89                	andi	a5,a5,2
   10ca4:	cf89                	beqz	a5,10cbe <qprinti+0x140>
   10ca6:	02d00593          	li	a1,45
   10caa:	fac42503          	lw	a0,-84(s0)
   10cae:	3b69                	jal	10a48 <qprintchar>
   10cb0:	0905                	addi	s2,s2,1
   10cb2:	f9c42783          	lw	a5,-100(s0)
   10cb6:	17fd                	addi	a5,a5,-1
   10cb8:	f8f42e23          	sw	a5,-100(s0)
   10cbc:	a031                	j	10cc8 <qprinti+0x14a>
   10cbe:	14fd                	addi	s1,s1,-1
   10cc0:	02d00793          	li	a5,45
   10cc4:	00f48023          	sb	a5,0(s1)
   10cc8:	f9842683          	lw	a3,-104(s0)
   10ccc:	f9c42603          	lw	a2,-100(s0)
   10cd0:	85a6                	mv	a1,s1
   10cd2:	fac42503          	lw	a0,-84(s0)
   10cd6:	33c9                	jal	10a98 <qprints>
   10cd8:	87aa                	mv	a5,a0
   10cda:	97ca                	add	a5,a5,s2
   10cdc:	853e                	mv	a0,a5
   10cde:	50b6                	lw	ra,108(sp)
   10ce0:	5426                	lw	s0,104(sp)
   10ce2:	5496                	lw	s1,100(sp)
   10ce4:	5906                	lw	s2,96(sp)
   10ce6:	49f6                	lw	s3,92(sp)
   10ce8:	6165                	addi	sp,sp,112
   10cea:	8082                	ret

00010cec <qprint>:
   10cec:	7139                	addi	sp,sp,-64
   10cee:	de06                	sw	ra,60(sp)
   10cf0:	dc22                	sw	s0,56(sp)
   10cf2:	da26                	sw	s1,52(sp)
   10cf4:	d84a                	sw	s2,48(sp)
   10cf6:	d64e                	sw	s3,44(sp)
   10cf8:	0080                	addi	s0,sp,64
   10cfa:	fca42623          	sw	a0,-52(s0)
   10cfe:	fcb42423          	sw	a1,-56(s0)
   10d02:	fcc42223          	sw	a2,-60(s0)
   10d06:	4481                	li	s1,0
   10d08:	ac35                	j	10f44 <qprint+0x258>
   10d0a:	fc842783          	lw	a5,-56(s0)
   10d0e:	0007c703          	lbu	a4,0(a5)
   10d12:	02500793          	li	a5,37
   10d16:	20f71663          	bne	a4,a5,10f22 <qprint+0x236>
   10d1a:	fc842783          	lw	a5,-56(s0)
   10d1e:	0785                	addi	a5,a5,1
   10d20:	fcf42423          	sw	a5,-56(s0)
   10d24:	4981                	li	s3,0
   10d26:	894e                	mv	s2,s3
   10d28:	fc842783          	lw	a5,-56(s0)
   10d2c:	0007c783          	lbu	a5,0(a5)
   10d30:	22078163          	beqz	a5,10f52 <qprint+0x266>
   10d34:	fc842783          	lw	a5,-56(s0)
   10d38:	0007c703          	lbu	a4,0(a5)
   10d3c:	02500793          	li	a5,37
   10d40:	1ef70363          	beq	a4,a5,10f26 <qprint+0x23a>
   10d44:	fc842783          	lw	a5,-56(s0)
   10d48:	0007c703          	lbu	a4,0(a5)
   10d4c:	02d00793          	li	a5,45
   10d50:	02f71063          	bne	a4,a5,10d70 <qprint+0x84>
   10d54:	fc842783          	lw	a5,-56(s0)
   10d58:	0785                	addi	a5,a5,1
   10d5a:	fcf42423          	sw	a5,-56(s0)
   10d5e:	4985                	li	s3,1
   10d60:	a801                	j	10d70 <qprint+0x84>
   10d62:	fc842783          	lw	a5,-56(s0)
   10d66:	0785                	addi	a5,a5,1
   10d68:	fcf42423          	sw	a5,-56(s0)
   10d6c:	0029e993          	ori	s3,s3,2
   10d70:	fc842783          	lw	a5,-56(s0)
   10d74:	0007c703          	lbu	a4,0(a5)
   10d78:	03000793          	li	a5,48
   10d7c:	fef703e3          	beq	a4,a5,10d62 <qprint+0x76>
   10d80:	a015                	j	10da4 <qprint+0xb8>
   10d82:	87ca                	mv	a5,s2
   10d84:	078a                	slli	a5,a5,0x2
   10d86:	97ca                	add	a5,a5,s2
   10d88:	0786                	slli	a5,a5,0x1
   10d8a:	893e                	mv	s2,a5
   10d8c:	fc842783          	lw	a5,-56(s0)
   10d90:	0007c783          	lbu	a5,0(a5)
   10d94:	fd078793          	addi	a5,a5,-48
   10d98:	993e                	add	s2,s2,a5
   10d9a:	fc842783          	lw	a5,-56(s0)
   10d9e:	0785                	addi	a5,a5,1
   10da0:	fcf42423          	sw	a5,-56(s0)
   10da4:	fc842783          	lw	a5,-56(s0)
   10da8:	0007c703          	lbu	a4,0(a5)
   10dac:	02f00793          	li	a5,47
   10db0:	00e7fa63          	bgeu	a5,a4,10dc4 <qprint+0xd8>
   10db4:	fc842783          	lw	a5,-56(s0)
   10db8:	0007c703          	lbu	a4,0(a5)
   10dbc:	03900793          	li	a5,57
   10dc0:	fce7f1e3          	bgeu	a5,a4,10d82 <qprint+0x96>
   10dc4:	fc842783          	lw	a5,-56(s0)
   10dc8:	0007c703          	lbu	a4,0(a5)
   10dcc:	07300793          	li	a5,115
   10dd0:	02f71a63          	bne	a4,a5,10e04 <qprint+0x118>
   10dd4:	fc442783          	lw	a5,-60(s0)
   10dd8:	00478713          	addi	a4,a5,4
   10ddc:	fce42223          	sw	a4,-60(s0)
   10de0:	0007a083          	lw	ra,0(a5)
   10de4:	00008463          	beqz	ra,10dec <qprint+0x100>
   10de8:	8786                	mv	a5,ra
   10dea:	a021                	j	10df2 <qprint+0x106>
   10dec:	67c9                	lui	a5,0x12
   10dee:	8e878793          	addi	a5,a5,-1816 # 118e8 <__DTOR_END__+0x94>
   10df2:	86ce                	mv	a3,s3
   10df4:	864a                	mv	a2,s2
   10df6:	85be                	mv	a1,a5
   10df8:	fcc42503          	lw	a0,-52(s0)
   10dfc:	3971                	jal	10a98 <qprints>
   10dfe:	87aa                	mv	a5,a0
   10e00:	94be                	add	s1,s1,a5
   10e02:	aa25                	j	10f3a <qprint+0x24e>
   10e04:	fc842783          	lw	a5,-56(s0)
   10e08:	0007c703          	lbu	a4,0(a5)
   10e0c:	06400793          	li	a5,100
   10e10:	02f71563          	bne	a4,a5,10e3a <qprint+0x14e>
   10e14:	fc442783          	lw	a5,-60(s0)
   10e18:	00478713          	addi	a4,a5,4
   10e1c:	fce42223          	sw	a4,-60(s0)
   10e20:	438c                	lw	a1,0(a5)
   10e22:	06100813          	li	a6,97
   10e26:	87ce                	mv	a5,s3
   10e28:	874a                	mv	a4,s2
   10e2a:	4685                	li	a3,1
   10e2c:	4629                	li	a2,10
   10e2e:	fcc42503          	lw	a0,-52(s0)
   10e32:	33b1                	jal	10b7e <qprinti>
   10e34:	87aa                	mv	a5,a0
   10e36:	94be                	add	s1,s1,a5
   10e38:	a209                	j	10f3a <qprint+0x24e>
   10e3a:	fc842783          	lw	a5,-56(s0)
   10e3e:	0007c703          	lbu	a4,0(a5)
   10e42:	07500793          	li	a5,117
   10e46:	02f71663          	bne	a4,a5,10e72 <qprint+0x186>
   10e4a:	fc442783          	lw	a5,-60(s0)
   10e4e:	00478713          	addi	a4,a5,4
   10e52:	fce42223          	sw	a4,-60(s0)
   10e56:	439c                	lw	a5,0(a5)
   10e58:	85be                	mv	a1,a5
   10e5a:	06100813          	li	a6,97
   10e5e:	87ce                	mv	a5,s3
   10e60:	874a                	mv	a4,s2
   10e62:	4681                	li	a3,0
   10e64:	4629                	li	a2,10
   10e66:	fcc42503          	lw	a0,-52(s0)
   10e6a:	3b11                	jal	10b7e <qprinti>
   10e6c:	87aa                	mv	a5,a0
   10e6e:	94be                	add	s1,s1,a5
   10e70:	a0e9                	j	10f3a <qprint+0x24e>
   10e72:	fc842783          	lw	a5,-56(s0)
   10e76:	0007c703          	lbu	a4,0(a5)
   10e7a:	07800793          	li	a5,120
   10e7e:	02f71663          	bne	a4,a5,10eaa <qprint+0x1be>
   10e82:	fc442783          	lw	a5,-60(s0)
   10e86:	00478713          	addi	a4,a5,4
   10e8a:	fce42223          	sw	a4,-60(s0)
   10e8e:	439c                	lw	a5,0(a5)
   10e90:	85be                	mv	a1,a5
   10e92:	06100813          	li	a6,97
   10e96:	87ce                	mv	a5,s3
   10e98:	874a                	mv	a4,s2
   10e9a:	4681                	li	a3,0
   10e9c:	4641                	li	a2,16
   10e9e:	fcc42503          	lw	a0,-52(s0)
   10ea2:	39f1                	jal	10b7e <qprinti>
   10ea4:	87aa                	mv	a5,a0
   10ea6:	94be                	add	s1,s1,a5
   10ea8:	a849                	j	10f3a <qprint+0x24e>
   10eaa:	fc842783          	lw	a5,-56(s0)
   10eae:	0007c703          	lbu	a4,0(a5)
   10eb2:	05800793          	li	a5,88
   10eb6:	02f71663          	bne	a4,a5,10ee2 <qprint+0x1f6>
   10eba:	fc442783          	lw	a5,-60(s0)
   10ebe:	00478713          	addi	a4,a5,4
   10ec2:	fce42223          	sw	a4,-60(s0)
   10ec6:	439c                	lw	a5,0(a5)
   10ec8:	85be                	mv	a1,a5
   10eca:	04100813          	li	a6,65
   10ece:	87ce                	mv	a5,s3
   10ed0:	874a                	mv	a4,s2
   10ed2:	4681                	li	a3,0
   10ed4:	4641                	li	a2,16
   10ed6:	fcc42503          	lw	a0,-52(s0)
   10eda:	3155                	jal	10b7e <qprinti>
   10edc:	87aa                	mv	a5,a0
   10ede:	94be                	add	s1,s1,a5
   10ee0:	a8a9                	j	10f3a <qprint+0x24e>
   10ee2:	fc842783          	lw	a5,-56(s0)
   10ee6:	0007c703          	lbu	a4,0(a5)
   10eea:	06300793          	li	a5,99
   10eee:	04f71663          	bne	a4,a5,10f3a <qprint+0x24e>
   10ef2:	fc442783          	lw	a5,-60(s0)
   10ef6:	00478713          	addi	a4,a5,4
   10efa:	fce42223          	sw	a4,-60(s0)
   10efe:	439c                	lw	a5,0(a5)
   10f00:	0ff7f793          	andi	a5,a5,255
   10f04:	fcf40e23          	sb	a5,-36(s0)
   10f08:	fc040ea3          	sb	zero,-35(s0)
   10f0c:	fdc40793          	addi	a5,s0,-36
   10f10:	86ce                	mv	a3,s3
   10f12:	864a                	mv	a2,s2
   10f14:	85be                	mv	a1,a5
   10f16:	fcc42503          	lw	a0,-52(s0)
   10f1a:	3ebd                	jal	10a98 <qprints>
   10f1c:	87aa                	mv	a5,a0
   10f1e:	94be                	add	s1,s1,a5
   10f20:	a829                	j	10f3a <qprint+0x24e>
   10f22:	0001                	nop
   10f24:	a011                	j	10f28 <qprint+0x23c>
   10f26:	0001                	nop
   10f28:	fc842783          	lw	a5,-56(s0)
   10f2c:	0007c783          	lbu	a5,0(a5)
   10f30:	85be                	mv	a1,a5
   10f32:	fcc42503          	lw	a0,-52(s0)
   10f36:	3e09                	jal	10a48 <qprintchar>
   10f38:	0485                	addi	s1,s1,1
   10f3a:	fc842783          	lw	a5,-56(s0)
   10f3e:	0785                	addi	a5,a5,1
   10f40:	fcf42423          	sw	a5,-56(s0)
   10f44:	fc842783          	lw	a5,-56(s0)
   10f48:	0007c783          	lbu	a5,0(a5)
   10f4c:	da079fe3          	bnez	a5,10d0a <qprint+0x1e>
   10f50:	a011                	j	10f54 <qprint+0x268>
   10f52:	0001                	nop
   10f54:	fcc42783          	lw	a5,-52(s0)
   10f58:	c791                	beqz	a5,10f64 <qprint+0x278>
   10f5a:	fcc42783          	lw	a5,-52(s0)
   10f5e:	439c                	lw	a5,0(a5)
   10f60:	00078023          	sb	zero,0(a5)
   10f64:	87a6                	mv	a5,s1
   10f66:	853e                	mv	a0,a5
   10f68:	50f2                	lw	ra,60(sp)
   10f6a:	5462                	lw	s0,56(sp)
   10f6c:	54d2                	lw	s1,52(sp)
   10f6e:	5942                	lw	s2,48(sp)
   10f70:	59b2                	lw	s3,44(sp)
   10f72:	6121                	addi	sp,sp,64
   10f74:	8082                	ret

00010f76 <printf>:
   10f76:	715d                	addi	sp,sp,-80
   10f78:	d606                	sw	ra,44(sp)
   10f7a:	d422                	sw	s0,40(sp)
   10f7c:	1800                	addi	s0,sp,48
   10f7e:	fca42e23          	sw	a0,-36(s0)
   10f82:	c04c                	sw	a1,4(s0)
   10f84:	c410                	sw	a2,8(s0)
   10f86:	c454                	sw	a3,12(s0)
   10f88:	c818                	sw	a4,16(s0)
   10f8a:	c85c                	sw	a5,20(s0)
   10f8c:	01042c23          	sw	a6,24(s0)
   10f90:	01142e23          	sw	a7,28(s0)
   10f94:	02040793          	addi	a5,s0,32
   10f98:	fcf42c23          	sw	a5,-40(s0)
   10f9c:	fd842783          	lw	a5,-40(s0)
   10fa0:	1791                	addi	a5,a5,-28
   10fa2:	fef42423          	sw	a5,-24(s0)
   10fa6:	fe842783          	lw	a5,-24(s0)
   10faa:	863e                	mv	a2,a5
   10fac:	fdc42583          	lw	a1,-36(s0)
   10fb0:	4501                	li	a0,0
   10fb2:	3b2d                	jal	10cec <qprint>
   10fb4:	fea42623          	sw	a0,-20(s0)
   10fb8:	fec42783          	lw	a5,-20(s0)
   10fbc:	853e                	mv	a0,a5
   10fbe:	50b2                	lw	ra,44(sp)
   10fc0:	5422                	lw	s0,40(sp)
   10fc2:	6161                	addi	sp,sp,80
   10fc4:	8082                	ret

00010fc6 <puts>:
   10fc6:	7179                	addi	sp,sp,-48
   10fc8:	d606                	sw	ra,44(sp)
   10fca:	d422                	sw	s0,40(sp)
   10fcc:	1800                	addi	s0,sp,48
   10fce:	fca42e23          	sw	a0,-36(s0)
   10fd2:	fe042623          	sw	zero,-20(s0)
   10fd6:	a839                	j	10ff4 <puts+0x2e>
   10fd8:	fec42783          	lw	a5,-20(s0)
   10fdc:	00178713          	addi	a4,a5,1
   10fe0:	fee42623          	sw	a4,-20(s0)
   10fe4:	873e                	mv	a4,a5
   10fe6:	fdc42783          	lw	a5,-36(s0)
   10fea:	97ba                	add	a5,a5,a4
   10fec:	0007c783          	lbu	a5,0(a5)
   10ff0:	853e                	mv	a0,a5
   10ff2:	343d                	jal	10a20 <putchar>
   10ff4:	fec42783          	lw	a5,-20(s0)
   10ff8:	fdc42703          	lw	a4,-36(s0)
   10ffc:	97ba                	add	a5,a5,a4
   10ffe:	0007c783          	lbu	a5,0(a5)
   11002:	fbf9                	bnez	a5,10fd8 <puts+0x12>
   11004:	4529                	li	a0,10
   11006:	3c29                	jal	10a20 <putchar>
   11008:	fec42783          	lw	a5,-20(s0)
   1100c:	853e                	mv	a0,a5
   1100e:	50b2                	lw	ra,44(sp)
   11010:	5422                	lw	s0,40(sp)
   11012:	6145                	addi	sp,sp,48
   11014:	8082                	ret

00011016 <strcmp>:
   11016:	7179                	addi	sp,sp,-48
   11018:	d622                	sw	s0,44(sp)
   1101a:	1800                	addi	s0,sp,48
   1101c:	fca42e23          	sw	a0,-36(s0)
   11020:	fcb42c23          	sw	a1,-40(s0)
   11024:	fdc42703          	lw	a4,-36(s0)
   11028:	fd842783          	lw	a5,-40(s0)
   1102c:	8fd9                	or	a5,a5,a4
   1102e:	8b8d                	andi	a5,a5,3
   11030:	e7c9                	bnez	a5,110ba <strcmp+0xa4>
   11032:	fdc42783          	lw	a5,-36(s0)
   11036:	fef42623          	sw	a5,-20(s0)
   1103a:	fd842783          	lw	a5,-40(s0)
   1103e:	fef42423          	sw	a5,-24(s0)
   11042:	a089                	j	11084 <strcmp+0x6e>
   11044:	fec42783          	lw	a5,-20(s0)
   11048:	4398                	lw	a4,0(a5)
   1104a:	feff07b7          	lui	a5,0xfeff0
   1104e:	eff78793          	addi	a5,a5,-257 # fefefeff <_stack_start+0xfeeebeff>
   11052:	973e                	add	a4,a4,a5
   11054:	fec42783          	lw	a5,-20(s0)
   11058:	439c                	lw	a5,0(a5)
   1105a:	fff7c793          	not	a5,a5
   1105e:	8f7d                	and	a4,a4,a5
   11060:	808087b7          	lui	a5,0x80808
   11064:	08078793          	addi	a5,a5,128 # 80808080 <_stack_start+0x80704080>
   11068:	8ff9                	and	a5,a5,a4
   1106a:	c399                	beqz	a5,11070 <strcmp+0x5a>
   1106c:	4781                	li	a5,0
   1106e:	a041                	j	110ee <strcmp+0xd8>
   11070:	fec42783          	lw	a5,-20(s0)
   11074:	0791                	addi	a5,a5,4
   11076:	fef42623          	sw	a5,-20(s0)
   1107a:	fe842783          	lw	a5,-24(s0)
   1107e:	0791                	addi	a5,a5,4
   11080:	fef42423          	sw	a5,-24(s0)
   11084:	fec42783          	lw	a5,-20(s0)
   11088:	4398                	lw	a4,0(a5)
   1108a:	fe842783          	lw	a5,-24(s0)
   1108e:	439c                	lw	a5,0(a5)
   11090:	faf70ae3          	beq	a4,a5,11044 <strcmp+0x2e>
   11094:	fec42783          	lw	a5,-20(s0)
   11098:	fcf42e23          	sw	a5,-36(s0)
   1109c:	fe842783          	lw	a5,-24(s0)
   110a0:	fcf42c23          	sw	a5,-40(s0)
   110a4:	a819                	j	110ba <strcmp+0xa4>
   110a6:	fdc42783          	lw	a5,-36(s0)
   110aa:	0785                	addi	a5,a5,1
   110ac:	fcf42e23          	sw	a5,-36(s0)
   110b0:	fd842783          	lw	a5,-40(s0)
   110b4:	0785                	addi	a5,a5,1
   110b6:	fcf42c23          	sw	a5,-40(s0)
   110ba:	fdc42783          	lw	a5,-36(s0)
   110be:	0007c783          	lbu	a5,0(a5)
   110c2:	cb99                	beqz	a5,110d8 <strcmp+0xc2>
   110c4:	fdc42783          	lw	a5,-36(s0)
   110c8:	0007c703          	lbu	a4,0(a5)
   110cc:	fd842783          	lw	a5,-40(s0)
   110d0:	0007c783          	lbu	a5,0(a5)
   110d4:	fcf709e3          	beq	a4,a5,110a6 <strcmp+0x90>
   110d8:	fdc42783          	lw	a5,-36(s0)
   110dc:	0007c783          	lbu	a5,0(a5)
   110e0:	873e                	mv	a4,a5
   110e2:	fd842783          	lw	a5,-40(s0)
   110e6:	0007c783          	lbu	a5,0(a5)
   110ea:	40f707b3          	sub	a5,a4,a5
   110ee:	853e                	mv	a0,a5
   110f0:	5432                	lw	s0,44(sp)
   110f2:	6145                	addi	sp,sp,48
   110f4:	8082                	ret

000110f6 <memset>:
   110f6:	7179                	addi	sp,sp,-48
   110f8:	d622                	sw	s0,44(sp)
   110fa:	1800                	addi	s0,sp,48
   110fc:	fca42e23          	sw	a0,-36(s0)
   11100:	fcb42c23          	sw	a1,-40(s0)
   11104:	fcc42a23          	sw	a2,-44(s0)
   11108:	fdc42783          	lw	a5,-36(s0)
   1110c:	fef42623          	sw	a5,-20(s0)
   11110:	a015                	j	11134 <memset+0x3e>
   11112:	fec42783          	lw	a5,-20(s0)
   11116:	00178713          	addi	a4,a5,1
   1111a:	fee42623          	sw	a4,-20(s0)
   1111e:	fd842703          	lw	a4,-40(s0)
   11122:	0ff77713          	andi	a4,a4,255
   11126:	00e78023          	sb	a4,0(a5)
   1112a:	fd442783          	lw	a5,-44(s0)
   1112e:	17fd                	addi	a5,a5,-1
   11130:	fcf42a23          	sw	a5,-44(s0)
   11134:	fd442783          	lw	a5,-44(s0)
   11138:	ffe9                	bnez	a5,11112 <memset+0x1c>
   1113a:	fdc42783          	lw	a5,-36(s0)
   1113e:	853e                	mv	a0,a5
   11140:	5432                	lw	s0,44(sp)
   11142:	6145                	addi	sp,sp,48
   11144:	8082                	ret

00011146 <strcpy>:
   11146:	7179                	addi	sp,sp,-48
   11148:	d622                	sw	s0,44(sp)
   1114a:	1800                	addi	s0,sp,48
   1114c:	fca42e23          	sw	a0,-36(s0)
   11150:	fcb42c23          	sw	a1,-40(s0)
   11154:	fdc42783          	lw	a5,-36(s0)
   11158:	fef42623          	sw	a5,-20(s0)
   1115c:	fd842783          	lw	a5,-40(s0)
   11160:	fef42423          	sw	a5,-24(s0)
   11164:	a01d                	j	1118a <strcpy+0x44>
   11166:	fe842783          	lw	a5,-24(s0)
   1116a:	0007c703          	lbu	a4,0(a5)
   1116e:	fec42783          	lw	a5,-20(s0)
   11172:	00e78023          	sb	a4,0(a5)
   11176:	fec42783          	lw	a5,-20(s0)
   1117a:	0785                	addi	a5,a5,1
   1117c:	fef42623          	sw	a5,-20(s0)
   11180:	fe842783          	lw	a5,-24(s0)
   11184:	0785                	addi	a5,a5,1
   11186:	fef42423          	sw	a5,-24(s0)
   1118a:	fe842783          	lw	a5,-24(s0)
   1118e:	0007c783          	lbu	a5,0(a5)
   11192:	fbf1                	bnez	a5,11166 <strcpy+0x20>
   11194:	fdc42783          	lw	a5,-36(s0)
   11198:	853e                	mv	a0,a5
   1119a:	5432                	lw	s0,44(sp)
   1119c:	6145                	addi	sp,sp,48
   1119e:	8082                	ret

000111a0 <strlen>:
   111a0:	7179                	addi	sp,sp,-48
   111a2:	d622                	sw	s0,44(sp)
   111a4:	1800                	addi	s0,sp,48
   111a6:	fca42e23          	sw	a0,-36(s0)
   111aa:	fdc42783          	lw	a5,-36(s0)
   111ae:	fef42623          	sw	a5,-20(s0)
   111b2:	fe042423          	sw	zero,-24(s0)
   111b6:	fec42783          	lw	a5,-20(s0)
   111ba:	eb81                	bnez	a5,111ca <strlen+0x2a>
   111bc:	4781                	li	a5,0
   111be:	a00d                	j	111e0 <strlen+0x40>
   111c0:	fe842783          	lw	a5,-24(s0)
   111c4:	0785                	addi	a5,a5,1
   111c6:	fef42423          	sw	a5,-24(s0)
   111ca:	fec42783          	lw	a5,-20(s0)
   111ce:	00178713          	addi	a4,a5,1
   111d2:	fee42623          	sw	a4,-20(s0)
   111d6:	0007c783          	lbu	a5,0(a5)
   111da:	f3fd                	bnez	a5,111c0 <strlen+0x20>
   111dc:	fe842783          	lw	a5,-24(s0)
   111e0:	853e                	mv	a0,a5
   111e2:	5432                	lw	s0,44(sp)
   111e4:	6145                	addi	sp,sp,48
   111e6:	8082                	ret

000111e8 <spi_setup_slave>:
   111e8:	1141                	addi	sp,sp,-16
   111ea:	c606                	sw	ra,12(sp)
   111ec:	c422                	sw	s0,8(sp)
   111ee:	0800                	addi	s0,sp,16
   111f0:	4581                	li	a1,0
   111f2:	4511                	li	a0,4
   111f4:	83cff0ef          	jal	ra,10230 <set_pin_function>
   111f8:	4581                	li	a1,0
   111fa:	4515                	li	a0,5
   111fc:	834ff0ef          	jal	ra,10230 <set_pin_function>
   11200:	4581                	li	a1,0
   11202:	4519                	li	a0,6
   11204:	82cff0ef          	jal	ra,10230 <set_pin_function>
   11208:	4581                	li	a1,0
   1120a:	451d                	li	a0,7
   1120c:	824ff0ef          	jal	ra,10230 <set_pin_function>
   11210:	4581                	li	a1,0
   11212:	450d                	li	a0,3
   11214:	81cff0ef          	jal	ra,10230 <set_pin_function>
   11218:	0001                	nop
   1121a:	40b2                	lw	ra,12(sp)
   1121c:	4422                	lw	s0,8(sp)
   1121e:	0141                	addi	sp,sp,16
   11220:	8082                	ret

00011222 <spi_setup_master>:
   11222:	1101                	addi	sp,sp,-32
   11224:	ce06                	sw	ra,28(sp)
   11226:	cc22                	sw	s0,24(sp)
   11228:	1000                	addi	s0,sp,32
   1122a:	fea42623          	sw	a0,-20(s0)
   1122e:	4581                	li	a1,0
   11230:	453d                	li	a0,15
   11232:	ffffe0ef          	jal	ra,10230 <set_pin_function>
   11236:	4581                	li	a1,0
   11238:	4539                	li	a0,14
   1123a:	ff7fe0ef          	jal	ra,10230 <set_pin_function>
   1123e:	4581                	li	a1,0
   11240:	4535                	li	a0,13
   11242:	feffe0ef          	jal	ra,10230 <set_pin_function>
   11246:	4581                	li	a1,0
   11248:	4531                	li	a0,12
   1124a:	fe7fe0ef          	jal	ra,10230 <set_pin_function>
   1124e:	fec42783          	lw	a5,-20(s0)
   11252:	00f05663          	blez	a5,1125e <spi_setup_master+0x3c>
   11256:	4581                	li	a1,0
   11258:	4541                	li	a0,16
   1125a:	fd7fe0ef          	jal	ra,10230 <set_pin_function>
   1125e:	fec42703          	lw	a4,-20(s0)
   11262:	4785                	li	a5,1
   11264:	00e7d663          	bge	a5,a4,11270 <spi_setup_master+0x4e>
   11268:	4581                	li	a1,0
   1126a:	452d                	li	a0,11
   1126c:	fc5fe0ef          	jal	ra,10230 <set_pin_function>
   11270:	fec42703          	lw	a4,-20(s0)
   11274:	4789                	li	a5,2
   11276:	00e7d663          	bge	a5,a4,11282 <spi_setup_master+0x60>
   1127a:	4581                	li	a1,0
   1127c:	4501                	li	a0,0
   1127e:	fb3fe0ef          	jal	ra,10230 <set_pin_function>
   11282:	fec42703          	lw	a4,-20(s0)
   11286:	478d                	li	a5,3
   11288:	00e7d663          	bge	a5,a4,11294 <spi_setup_master+0x72>
   1128c:	4581                	li	a1,0
   1128e:	4505                	li	a0,1
   11290:	fa1fe0ef          	jal	ra,10230 <set_pin_function>
   11294:	0001                	nop
   11296:	40f2                	lw	ra,28(sp)
   11298:	4462                	lw	s0,24(sp)
   1129a:	6105                	addi	sp,sp,32
   1129c:	8082                	ret

0001129e <spi_setup_cmd_addr>:
   1129e:	7179                	addi	sp,sp,-48
   112a0:	d622                	sw	s0,44(sp)
   112a2:	1800                	addi	s0,sp,48
   112a4:	fca42e23          	sw	a0,-36(s0)
   112a8:	fcb42c23          	sw	a1,-40(s0)
   112ac:	fcc42a23          	sw	a2,-44(s0)
   112b0:	fcd42823          	sw	a3,-48(s0)
   112b4:	02000713          	li	a4,32
   112b8:	fd842783          	lw	a5,-40(s0)
   112bc:	40f707b3          	sub	a5,a4,a5
   112c0:	fdc42703          	lw	a4,-36(s0)
   112c4:	00f717b3          	sll	a5,a4,a5
   112c8:	fef42623          	sw	a5,-20(s0)
   112cc:	1a1027b7          	lui	a5,0x1a102
   112d0:	07a1                	addi	a5,a5,8
   112d2:	fec42703          	lw	a4,-20(s0)
   112d6:	c398                	sw	a4,0(a5)
   112d8:	1a1027b7          	lui	a5,0x1a102
   112dc:	07b1                	addi	a5,a5,12
   112de:	fd442703          	lw	a4,-44(s0)
   112e2:	c398                	sw	a4,0(a5)
   112e4:	fd842783          	lw	a5,-40(s0)
   112e8:	03f7f693          	andi	a3,a5,63
   112ec:	fd042783          	lw	a5,-48(s0)
   112f0:	00879713          	slli	a4,a5,0x8
   112f4:	6791                	lui	a5,0x4
   112f6:	f0078793          	addi	a5,a5,-256 # 3f00 <_stack_len+0x2f00>
   112fa:	8f7d                	and	a4,a4,a5
   112fc:	1a1027b7          	lui	a5,0x1a102
   11300:	07c1                	addi	a5,a5,16
   11302:	8f55                	or	a4,a4,a3
   11304:	c398                	sw	a4,0(a5)
   11306:	0001                	nop
   11308:	5432                	lw	s0,44(sp)
   1130a:	6145                	addi	sp,sp,48
   1130c:	8082                	ret

0001130e <spi_setup_dummy>:
   1130e:	1101                	addi	sp,sp,-32
   11310:	ce22                	sw	s0,28(sp)
   11312:	1000                	addi	s0,sp,32
   11314:	fea42623          	sw	a0,-20(s0)
   11318:	feb42423          	sw	a1,-24(s0)
   1131c:	fe842783          	lw	a5,-24(s0)
   11320:	07c2                	slli	a5,a5,0x10
   11322:	86be                	mv	a3,a5
   11324:	fec42703          	lw	a4,-20(s0)
   11328:	67c1                	lui	a5,0x10
   1132a:	17fd                	addi	a5,a5,-1
   1132c:	8ff9                	and	a5,a5,a4
   1132e:	00f6e733          	or	a4,a3,a5
   11332:	1a1027b7          	lui	a5,0x1a102
   11336:	07d1                	addi	a5,a5,20
   11338:	c398                	sw	a4,0(a5)
   1133a:	0001                	nop
   1133c:	4472                	lw	s0,28(sp)
   1133e:	6105                	addi	sp,sp,32
   11340:	8082                	ret

00011342 <spi_set_datalen>:
   11342:	7179                	addi	sp,sp,-48
   11344:	d622                	sw	s0,44(sp)
   11346:	1800                	addi	s0,sp,48
   11348:	fca42e23          	sw	a0,-36(s0)
   1134c:	1a1027b7          	lui	a5,0x1a102
   11350:	07c1                	addi	a5,a5,16
   11352:	439c                	lw	a5,0(a5)
   11354:	fef42623          	sw	a5,-20(s0)
   11358:	fdc42783          	lw	a5,-36(s0)
   1135c:	07c2                	slli	a5,a5,0x10
   1135e:	873e                	mv	a4,a5
   11360:	fec42783          	lw	a5,-20(s0)
   11364:	86be                	mv	a3,a5
   11366:	67c1                	lui	a5,0x10
   11368:	17fd                	addi	a5,a5,-1
   1136a:	8ff5                	and	a5,a5,a3
   1136c:	8fd9                	or	a5,a5,a4
   1136e:	fef42623          	sw	a5,-20(s0)
   11372:	1a1027b7          	lui	a5,0x1a102
   11376:	07c1                	addi	a5,a5,16
   11378:	fec42703          	lw	a4,-20(s0)
   1137c:	c398                	sw	a4,0(a5)
   1137e:	0001                	nop
   11380:	5432                	lw	s0,44(sp)
   11382:	6145                	addi	sp,sp,48
   11384:	8082                	ret

00011386 <spi_start_transaction>:
   11386:	1101                	addi	sp,sp,-32
   11388:	ce22                	sw	s0,28(sp)
   1138a:	1000                	addi	s0,sp,32
   1138c:	fea42623          	sw	a0,-20(s0)
   11390:	feb42423          	sw	a1,-24(s0)
   11394:	fe842783          	lw	a5,-24(s0)
   11398:	07a1                	addi	a5,a5,8
   1139a:	4705                	li	a4,1
   1139c:	00f71733          	sll	a4,a4,a5
   113a0:	6785                	lui	a5,0x1
   113a2:	f0078793          	addi	a5,a5,-256 # f00 <_min_stack+0x700>
   113a6:	00f776b3          	and	a3,a4,a5
   113aa:	fec42783          	lw	a5,-20(s0)
   113ae:	4705                	li	a4,1
   113b0:	00f717b3          	sll	a5,a4,a5
   113b4:	0ff7f713          	andi	a4,a5,255
   113b8:	1a1027b7          	lui	a5,0x1a102
   113bc:	8f55                	or	a4,a4,a3
   113be:	c398                	sw	a4,0(a5)
   113c0:	0001                	nop
   113c2:	4472                	lw	s0,28(sp)
   113c4:	6105                	addi	sp,sp,32
   113c6:	8082                	ret

000113c8 <spi_get_status>:
   113c8:	1101                	addi	sp,sp,-32
   113ca:	ce22                	sw	s0,28(sp)
   113cc:	1000                	addi	s0,sp,32
   113ce:	1a1027b7          	lui	a5,0x1a102
   113d2:	439c                	lw	a5,0(a5)
   113d4:	fef42623          	sw	a5,-20(s0)
   113d8:	fec42783          	lw	a5,-20(s0)
   113dc:	853e                	mv	a0,a5
   113de:	4472                	lw	s0,28(sp)
   113e0:	6105                	addi	sp,sp,32
   113e2:	8082                	ret

000113e4 <spi_write_fifo>:
   113e4:	7179                	addi	sp,sp,-48
   113e6:	d622                	sw	s0,44(sp)
   113e8:	1800                	addi	s0,sp,48
   113ea:	fca42e23          	sw	a0,-36(s0)
   113ee:	fcb42c23          	sw	a1,-40(s0)
   113f2:	fd842783          	lw	a5,-40(s0)
   113f6:	8795                	srai	a5,a5,0x5
   113f8:	7ff7f793          	andi	a5,a5,2047
   113fc:	fef42623          	sw	a5,-20(s0)
   11400:	fd842783          	lw	a5,-40(s0)
   11404:	8bfd                	andi	a5,a5,31
   11406:	c791                	beqz	a5,11412 <spi_write_fifo+0x2e>
   11408:	fec42783          	lw	a5,-20(s0)
   1140c:	0785                	addi	a5,a5,1
   1140e:	fef42623          	sw	a5,-20(s0)
   11412:	fe042423          	sw	zero,-24(s0)
   11416:	a80d                	j	11448 <spi_write_fifo+0x64>
   11418:	0001                	nop
   1141a:	1a1027b7          	lui	a5,0x1a102
   1141e:	439c                	lw	a5,0(a5)
   11420:	87e1                	srai	a5,a5,0x18
   11422:	0f87f793          	andi	a5,a5,248
   11426:	fbf5                	bnez	a5,1141a <spi_write_fifo+0x36>
   11428:	fe842783          	lw	a5,-24(s0)
   1142c:	078a                	slli	a5,a5,0x2
   1142e:	fdc42703          	lw	a4,-36(s0)
   11432:	973e                	add	a4,a4,a5
   11434:	1a1027b7          	lui	a5,0x1a102
   11438:	07e1                	addi	a5,a5,24
   1143a:	4318                	lw	a4,0(a4)
   1143c:	c398                	sw	a4,0(a5)
   1143e:	fe842783          	lw	a5,-24(s0)
   11442:	0785                	addi	a5,a5,1
   11444:	fef42423          	sw	a5,-24(s0)
   11448:	fe842703          	lw	a4,-24(s0)
   1144c:	fec42783          	lw	a5,-20(s0)
   11450:	fcf744e3          	blt	a4,a5,11418 <spi_write_fifo+0x34>
   11454:	0001                	nop
   11456:	0001                	nop
   11458:	5432                	lw	s0,44(sp)
   1145a:	6145                	addi	sp,sp,48
   1145c:	8082                	ret

0001145e <spi_read_fifo>:
   1145e:	7179                	addi	sp,sp,-48
   11460:	d622                	sw	s0,44(sp)
   11462:	1800                	addi	s0,sp,48
   11464:	fca42e23          	sw	a0,-36(s0)
   11468:	fcb42c23          	sw	a1,-40(s0)
   1146c:	fd842783          	lw	a5,-40(s0)
   11470:	8795                	srai	a5,a5,0x5
   11472:	7ff7f793          	andi	a5,a5,2047
   11476:	fef42623          	sw	a5,-20(s0)
   1147a:	fd842783          	lw	a5,-40(s0)
   1147e:	8bfd                	andi	a5,a5,31
   11480:	c791                	beqz	a5,1148c <spi_read_fifo+0x2e>
   11482:	fec42783          	lw	a5,-20(s0)
   11486:	0785                	addi	a5,a5,1
   11488:	fef42623          	sw	a5,-20(s0)
   1148c:	fe042423          	sw	zero,-24(s0)
   11490:	a815                	j	114c4 <spi_read_fifo+0x66>
   11492:	0001                	nop
   11494:	1a1027b7          	lui	a5,0x1a102
   11498:	439c                	lw	a5,0(a5)
   1149a:	87c1                	srai	a5,a5,0x10
   1149c:	0ff7f793          	andi	a5,a5,255
   114a0:	dbf5                	beqz	a5,11494 <spi_read_fifo+0x36>
   114a2:	1a1027b7          	lui	a5,0x1a102
   114a6:	02078713          	addi	a4,a5,32 # 1a102020 <_stack_start+0x19ffe020>
   114aa:	fe842783          	lw	a5,-24(s0)
   114ae:	078a                	slli	a5,a5,0x2
   114b0:	fdc42683          	lw	a3,-36(s0)
   114b4:	97b6                	add	a5,a5,a3
   114b6:	4318                	lw	a4,0(a4)
   114b8:	c398                	sw	a4,0(a5)
   114ba:	fe842783          	lw	a5,-24(s0)
   114be:	0785                	addi	a5,a5,1
   114c0:	fef42423          	sw	a5,-24(s0)
   114c4:	fe842703          	lw	a4,-24(s0)
   114c8:	fec42783          	lw	a5,-20(s0)
   114cc:	fcf743e3          	blt	a4,a5,11492 <spi_read_fifo+0x34>
   114d0:	0001                	nop
   114d2:	0001                	nop
   114d4:	5432                	lw	s0,44(sp)
   114d6:	6145                	addi	sp,sp,48
   114d8:	8082                	ret

000114da <reset_timer>:
   114da:	1141                	addi	sp,sp,-16
   114dc:	c622                	sw	s0,12(sp)
   114de:	0800                	addi	s0,sp,16
   114e0:	1a1037b7          	lui	a5,0x1a103
   114e4:	0007a023          	sw	zero,0(a5) # 1a103000 <_stack_start+0x19fff000>
   114e8:	0001                	nop
   114ea:	4432                	lw	s0,12(sp)
   114ec:	0141                	addi	sp,sp,16
   114ee:	8082                	ret

000114f0 <start_timer>:
   114f0:	1141                	addi	sp,sp,-16
   114f2:	c622                	sw	s0,12(sp)
   114f4:	0800                	addi	s0,sp,16
   114f6:	1a1037b7          	lui	a5,0x1a103
   114fa:	0791                	addi	a5,a5,4
   114fc:	4705                	li	a4,1
   114fe:	c398                	sw	a4,0(a5)
   11500:	0001                	nop
   11502:	4432                	lw	s0,12(sp)
   11504:	0141                	addi	sp,sp,16
   11506:	8082                	ret

00011508 <stop_timer>:
   11508:	1141                	addi	sp,sp,-16
   1150a:	c622                	sw	s0,12(sp)
   1150c:	0800                	addi	s0,sp,16
   1150e:	1a1037b7          	lui	a5,0x1a103
   11512:	0791                	addi	a5,a5,4
   11514:	0007a023          	sw	zero,0(a5) # 1a103000 <_stack_start+0x19fff000>
   11518:	0001                	nop
   1151a:	4432                	lw	s0,12(sp)
   1151c:	0141                	addi	sp,sp,16
   1151e:	8082                	ret

00011520 <get_time>:
   11520:	1141                	addi	sp,sp,-16
   11522:	c622                	sw	s0,12(sp)
   11524:	0800                	addi	s0,sp,16
   11526:	1a1037b7          	lui	a5,0x1a103
   1152a:	439c                	lw	a5,0(a5)
   1152c:	853e                	mv	a0,a5
   1152e:	4432                	lw	s0,12(sp)
   11530:	0141                	addi	sp,sp,16
   11532:	8082                	ret

00011534 <uart_set_cfg>:
   11534:	1101                	addi	sp,sp,-32
   11536:	ce22                	sw	s0,28(sp)
   11538:	1000                	addi	s0,sp,32
   1153a:	fea42623          	sw	a0,-20(s0)
   1153e:	87ae                	mv	a5,a1
   11540:	fef41523          	sh	a5,-22(s0)
   11544:	1a1077b7          	lui	a5,0x1a107
   11548:	0791                	addi	a5,a5,4
   1154a:	4398                	lw	a4,0(a5)
   1154c:	1a1077b7          	lui	a5,0x1a107
   11550:	0791                	addi	a5,a5,4
   11552:	00276713          	ori	a4,a4,2
   11556:	c398                	sw	a4,0(a5)
   11558:	1a1007b7          	lui	a5,0x1a100
   1155c:	07b1                	addi	a5,a5,12
   1155e:	08300713          	li	a4,131
   11562:	c398                	sw	a4,0(a5)
   11564:	fea45783          	lhu	a5,-22(s0)
   11568:	83a1                	srli	a5,a5,0x8
   1156a:	07c2                	slli	a5,a5,0x10
   1156c:	83c1                	srli	a5,a5,0x10
   1156e:	873e                	mv	a4,a5
   11570:	1a1007b7          	lui	a5,0x1a100
   11574:	0791                	addi	a5,a5,4
   11576:	0ff77713          	andi	a4,a4,255
   1157a:	c398                	sw	a4,0(a5)
   1157c:	fea45703          	lhu	a4,-22(s0)
   11580:	1a1007b7          	lui	a5,0x1a100
   11584:	0ff77713          	andi	a4,a4,255
   11588:	c398                	sw	a4,0(a5)
   1158a:	1a1007b7          	lui	a5,0x1a100
   1158e:	07a1                	addi	a5,a5,8
   11590:	0a700713          	li	a4,167
   11594:	c398                	sw	a4,0(a5)
   11596:	1a1007b7          	lui	a5,0x1a100
   1159a:	07b1                	addi	a5,a5,12
   1159c:	470d                	li	a4,3
   1159e:	c398                	sw	a4,0(a5)
   115a0:	1a1007b7          	lui	a5,0x1a100
   115a4:	0791                	addi	a5,a5,4
   115a6:	439c                	lw	a5,0(a5)
   115a8:	0f07f713          	andi	a4,a5,240
   115ac:	1a1007b7          	lui	a5,0x1a100
   115b0:	0791                	addi	a5,a5,4
   115b2:	00276713          	ori	a4,a4,2
   115b6:	c398                	sw	a4,0(a5)
   115b8:	0001                	nop
   115ba:	4472                	lw	s0,28(sp)
   115bc:	6105                	addi	sp,sp,32
   115be:	8082                	ret

000115c0 <uart_send>:
   115c0:	7179                	addi	sp,sp,-48
   115c2:	d622                	sw	s0,44(sp)
   115c4:	1800                	addi	s0,sp,48
   115c6:	fca42e23          	sw	a0,-36(s0)
   115ca:	fcb42c23          	sw	a1,-40(s0)
   115ce:	a891                	j	11622 <uart_send+0x62>
   115d0:	0001                	nop
   115d2:	1a1007b7          	lui	a5,0x1a100
   115d6:	07d1                	addi	a5,a5,20
   115d8:	439c                	lw	a5,0(a5)
   115da:	0207f793          	andi	a5,a5,32
   115de:	dbf5                	beqz	a5,115d2 <uart_send+0x12>
   115e0:	fe042623          	sw	zero,-20(s0)
   115e4:	a035                	j	11610 <uart_send+0x50>
   115e6:	fdc42783          	lw	a5,-36(s0)
   115ea:	00178713          	addi	a4,a5,1 # 1a100001 <_stack_start+0x19ffc001>
   115ee:	fce42e23          	sw	a4,-36(s0)
   115f2:	0007c703          	lbu	a4,0(a5)
   115f6:	1a1007b7          	lui	a5,0x1a100
   115fa:	c398                	sw	a4,0(a5)
   115fc:	fd842783          	lw	a5,-40(s0)
   11600:	17fd                	addi	a5,a5,-1
   11602:	fcf42c23          	sw	a5,-40(s0)
   11606:	fec42783          	lw	a5,-20(s0)
   1160a:	0785                	addi	a5,a5,1
   1160c:	fef42623          	sw	a5,-20(s0)
   11610:	fec42703          	lw	a4,-20(s0)
   11614:	03f00793          	li	a5,63
   11618:	00e7e563          	bltu	a5,a4,11622 <uart_send+0x62>
   1161c:	fd842783          	lw	a5,-40(s0)
   11620:	f3f9                	bnez	a5,115e6 <uart_send+0x26>
   11622:	fd842783          	lw	a5,-40(s0)
   11626:	f7cd                	bnez	a5,115d0 <uart_send+0x10>
   11628:	0001                	nop
   1162a:	0001                	nop
   1162c:	5432                	lw	s0,44(sp)
   1162e:	6145                	addi	sp,sp,48
   11630:	8082                	ret

00011632 <uart_getchar>:
   11632:	1141                	addi	sp,sp,-16
   11634:	c622                	sw	s0,12(sp)
   11636:	0800                	addi	s0,sp,16
   11638:	0001                	nop
   1163a:	1a1007b7          	lui	a5,0x1a100
   1163e:	07d1                	addi	a5,a5,20
   11640:	439c                	lw	a5,0(a5)
   11642:	0017f713          	andi	a4,a5,1
   11646:	4785                	li	a5,1
   11648:	fef719e3          	bne	a4,a5,1163a <uart_getchar+0x8>
   1164c:	1a1007b7          	lui	a5,0x1a100
   11650:	439c                	lw	a5,0(a5)
   11652:	0ff7f793          	andi	a5,a5,255
   11656:	853e                	mv	a0,a5
   11658:	4432                	lw	s0,12(sp)
   1165a:	0141                	addi	sp,sp,16
   1165c:	8082                	ret

0001165e <uart_sendchar>:
   1165e:	1101                	addi	sp,sp,-32
   11660:	ce22                	sw	s0,28(sp)
   11662:	1000                	addi	s0,sp,32
   11664:	87aa                	mv	a5,a0
   11666:	fef407a3          	sb	a5,-17(s0)
   1166a:	0001                	nop
   1166c:	1a1007b7          	lui	a5,0x1a100
   11670:	07d1                	addi	a5,a5,20
   11672:	439c                	lw	a5,0(a5)
   11674:	0207f793          	andi	a5,a5,32
   11678:	dbf5                	beqz	a5,1166c <uart_sendchar+0xe>
   1167a:	1a1007b7          	lui	a5,0x1a100
   1167e:	fef44703          	lbu	a4,-17(s0)
   11682:	c398                	sw	a4,0(a5)
   11684:	0001                	nop
   11686:	4472                	lw	s0,28(sp)
   11688:	6105                	addi	sp,sp,32
   1168a:	8082                	ret

0001168c <uart_wait_tx_done>:
   1168c:	1141                	addi	sp,sp,-16
   1168e:	c622                	sw	s0,12(sp)
   11690:	0800                	addi	s0,sp,16
   11692:	0001                	nop
   11694:	1a1007b7          	lui	a5,0x1a100
   11698:	07d1                	addi	a5,a5,20
   1169a:	439c                	lw	a5,0(a5)
   1169c:	0407f793          	andi	a5,a5,64
   116a0:	dbf5                	beqz	a5,11694 <uart_wait_tx_done+0x8>
   116a2:	0001                	nop
   116a4:	0001                	nop
   116a6:	4432                	lw	s0,12(sp)
   116a8:	0141                	addi	sp,sp,16
   116aa:	8082                	ret

000116ac <exit>:
   116ac:	1101                	addi	sp,sp,-32
   116ae:	ce06                	sw	ra,28(sp)
   116b0:	cc22                	sw	s0,24(sp)
   116b2:	1000                	addi	s0,sp,32
   116b4:	fea42623          	sw	a0,-20(s0)
   116b8:	fec42503          	lw	a0,-20(s0)
   116bc:	2011                	jal	116c0 <eoc>
   116be:	a001                	j	116be <exit+0x12>

000116c0 <eoc>:
   116c0:	1101                	addi	sp,sp,-32
   116c2:	ce22                	sw	s0,28(sp)
   116c4:	1000                	addi	s0,sp,32
   116c6:	fea42623          	sw	a0,-20(s0)
   116ca:	fec42783          	lw	a5,-20(s0)
   116ce:	c799                	beqz	a5,116dc <eoc+0x1c>
   116d0:	1a1077b7          	lui	a5,0x1a107
   116d4:	07d1                	addi	a5,a5,20
   116d6:	4705                	li	a4,1
   116d8:	c398                	sw	a4,0(a5)
   116da:	a031                	j	116e6 <eoc+0x26>
   116dc:	1a1077b7          	lui	a5,0x1a107
   116e0:	07d1                	addi	a5,a5,20
   116e2:	0007a023          	sw	zero,0(a5) # 1a107000 <_stack_start+0x1a003000>
   116e6:	1a1077b7          	lui	a5,0x1a107
   116ea:	0791                	addi	a5,a5,4
   116ec:	4398                	lw	a4,0(a5)
   116ee:	1a1077b7          	lui	a5,0x1a107
   116f2:	0791                	addi	a5,a5,4
   116f4:	00476713          	ori	a4,a4,4
   116f8:	c398                	sw	a4,0(a5)
   116fa:	0001                	nop
   116fc:	4472                	lw	s0,28(sp)
   116fe:	6105                	addi	sp,sp,32
   11700:	8082                	ret

00011702 <sleep_busy>:
   11702:	7179                	addi	sp,sp,-48
   11704:	d622                	sw	s0,44(sp)
   11706:	1800                	addi	s0,sp,48
   11708:	fca42e23          	sw	a0,-36(s0)
   1170c:	fe042623          	sw	zero,-20(s0)
   11710:	a039                	j	1171e <sleep_busy+0x1c>
   11712:	0001                	nop
   11714:	fec42783          	lw	a5,-20(s0)
   11718:	0785                	addi	a5,a5,1
   1171a:	fef42623          	sw	a5,-20(s0)
   1171e:	fdc42783          	lw	a5,-36(s0)
   11722:	fec42703          	lw	a4,-20(s0)
   11726:	fef746e3          	blt	a4,a5,11712 <sleep_busy+0x10>
   1172a:	0001                	nop
   1172c:	0001                	nop
   1172e:	5432                	lw	s0,44(sp)
   11730:	6145                	addi	sp,sp,48
   11732:	8082                	ret

00011734 <cpu_perf_set>:
   11734:	1101                	addi	sp,sp,-32
   11736:	ce06                	sw	ra,28(sp)
   11738:	cc22                	sw	s0,24(sp)
   1173a:	1000                	addi	s0,sp,32
   1173c:	fea42623          	sw	a0,-20(s0)
   11740:	feb42423          	sw	a1,-24(s0)
   11744:	67c9                	lui	a5,0x12
   11746:	8f078513          	addi	a0,a5,-1808 # 118f0 <__DTOR_END__+0x9c>
   1174a:	87dff0ef          	jal	ra,10fc6 <puts>
   1174e:	0001                	nop
   11750:	40f2                	lw	ra,28(sp)
   11752:	4462                	lw	s0,24(sp)
   11754:	6105                	addi	sp,sp,32
   11756:	8082                	ret

00011758 <cpu_perf_get>:
   11758:	7179                	addi	sp,sp,-48
   1175a:	d606                	sw	ra,44(sp)
   1175c:	d422                	sw	s0,40(sp)
   1175e:	1800                	addi	s0,sp,48
   11760:	fca42e23          	sw	a0,-36(s0)
   11764:	fe042623          	sw	zero,-20(s0)
   11768:	fdc42703          	lw	a4,-36(s0)
   1176c:	47bd                	li	a5,15
   1176e:	0ae7ec63          	bltu	a5,a4,11826 <cpu_perf_get+0xce>
   11772:	fdc42783          	lw	a5,-36(s0)
   11776:	00279713          	slli	a4,a5,0x2
   1177a:	67c9                	lui	a5,0x12
   1177c:	93078793          	addi	a5,a5,-1744 # 11930 <__DTOR_END__+0xdc>
   11780:	97ba                	add	a5,a5,a4
   11782:	439c                	lw	a5,0(a5)
   11784:	8782                	jr	a5
   11786:	780027f3          	csrr	a5,0x780
   1178a:	fef42623          	sw	a5,-20(s0)
   1178e:	a065                	j	11836 <cpu_perf_get+0xde>
   11790:	781027f3          	csrr	a5,0x781
   11794:	fef42623          	sw	a5,-20(s0)
   11798:	a879                	j	11836 <cpu_perf_get+0xde>
   1179a:	782027f3          	csrr	a5,0x782
   1179e:	fef42623          	sw	a5,-20(s0)
   117a2:	a851                	j	11836 <cpu_perf_get+0xde>
   117a4:	783027f3          	csrr	a5,0x783
   117a8:	fef42623          	sw	a5,-20(s0)
   117ac:	a069                	j	11836 <cpu_perf_get+0xde>
   117ae:	784027f3          	csrr	a5,0x784
   117b2:	fef42623          	sw	a5,-20(s0)
   117b6:	a041                	j	11836 <cpu_perf_get+0xde>
   117b8:	785027f3          	csrr	a5,0x785
   117bc:	fef42623          	sw	a5,-20(s0)
   117c0:	a89d                	j	11836 <cpu_perf_get+0xde>
   117c2:	786027f3          	csrr	a5,0x786
   117c6:	fef42623          	sw	a5,-20(s0)
   117ca:	a0b5                	j	11836 <cpu_perf_get+0xde>
   117cc:	787027f3          	csrr	a5,0x787
   117d0:	fef42623          	sw	a5,-20(s0)
   117d4:	a08d                	j	11836 <cpu_perf_get+0xde>
   117d6:	788027f3          	csrr	a5,0x788
   117da:	fef42623          	sw	a5,-20(s0)
   117de:	a8a1                	j	11836 <cpu_perf_get+0xde>
   117e0:	789027f3          	csrr	a5,0x789
   117e4:	fef42623          	sw	a5,-20(s0)
   117e8:	a0b9                	j	11836 <cpu_perf_get+0xde>
   117ea:	78a027f3          	csrr	a5,0x78a
   117ee:	fef42623          	sw	a5,-20(s0)
   117f2:	a091                	j	11836 <cpu_perf_get+0xde>
   117f4:	78b027f3          	csrr	a5,0x78b
   117f8:	fef42623          	sw	a5,-20(s0)
   117fc:	a82d                	j	11836 <cpu_perf_get+0xde>
   117fe:	78c027f3          	csrr	a5,0x78c
   11802:	fef42623          	sw	a5,-20(s0)
   11806:	a805                	j	11836 <cpu_perf_get+0xde>
   11808:	78d027f3          	csrr	a5,0x78d
   1180c:	fef42623          	sw	a5,-20(s0)
   11810:	a01d                	j	11836 <cpu_perf_get+0xde>
   11812:	78e027f3          	csrr	a5,0x78e
   11816:	fef42623          	sw	a5,-20(s0)
   1181a:	a831                	j	11836 <cpu_perf_get+0xde>
   1181c:	78f027f3          	csrr	a5,0x78f
   11820:	fef42623          	sw	a5,-20(s0)
   11824:	a809                	j	11836 <cpu_perf_get+0xde>
   11826:	fdc42583          	lw	a1,-36(s0)
   1182a:	67c9                	lui	a5,0x12
   1182c:	91478513          	addi	a0,a5,-1772 # 11914 <__DTOR_END__+0xc0>
   11830:	f46ff0ef          	jal	ra,10f76 <printf>
   11834:	0001                	nop
   11836:	fec42783          	lw	a5,-20(s0)
   1183a:	853e                	mv	a0,a5
   1183c:	50b2                	lw	ra,44(sp)
   1183e:	5422                	lw	s0,40(sp)
   11840:	6145                	addi	sp,sp,48
   11842:	8082                	ret

00011844 <__CTOR_LIST__>:
	...

0001184c <__CTOR_END__>:
	...

Disassembly of section .rodata:

00011854 <.rodata>:
   11854:	6568                	flw	fa0,76(a0)
   11856:	6c6c                	flw	fa1,92(s0)
   11858:	6f77206f          	j	8474e <_bss_end+0x72dce>
   1185c:	6c72                	flw	fs8,28(sp)
   1185e:	2164                	fld	fs1,192(a0)
   11860:	0000                	unimp
   11862:	0000                	unimp
   11864:	74696177          	0x74696177
   11868:	6e69                	lui	t3,0x1a
   1186a:	6f662067          	0x6f662067
   1186e:	2072                	fld	ft0,280(sp)
   11870:	6175                	addi	sp,sp,368
   11872:	7472                	flw	fs0,60(sp)
   11874:	7320                	flw	fs0,96(a4)
   11876:	6769                	lui	a4,0x1a
   11878:	616e                	flw	ft2,216(sp)
   1187a:	736c                	flw	fa1,100(a4)
   1187c:	7420                	flw	fs0,104(s0)
   1187e:	7277206f          	j	847a4 <_bss_end+0x72e24>
   11882:	7469                	lui	s0,0xffffa
   11884:	2065                	jal	1192c <__DTOR_END__+0xd8>
   11886:	6f74                	flw	fa3,92(a4)
   11888:	7220                	flw	fs0,96(a2)
   1188a:	6d61                	lui	s10,0x18
   1188c:	2e2e                	fld	ft8,200(sp)
   1188e:	002e                	c.slli	zero,0xb
   11890:	6f44                	flw	fs1,28(a4)
   11892:	656e                	flw	fa0,216(sp)
   11894:	202c                	fld	fa1,64(s0)
   11896:	756a                	flw	fa0,184(sp)
   11898:	706d                	c.lui	zero,0xffffb
   1189a:	6e69                	lui	t3,0x1a
   1189c:	6f742067          	0x6f742067
   118a0:	4920                	lw	s0,80(a0)
   118a2:	736e                	flw	ft6,248(sp)
   118a4:	7274                	flw	fa3,100(a2)
   118a6:	6375                	lui	t1,0x1d
   118a8:	6974                	flw	fa3,84(a0)
   118aa:	52206e6f          	jal	t3,17dcc <_bss_end+0x644c>
   118ae:	4d41                	li	s10,16
   118b0:	0a2e                	slli	s4,s4,0xb
   118b2:	0000                	unimp
   118b4:	6854                	flw	fa3,20(s0)
   118b6:	7369                	lui	t1,0xffffa
   118b8:	6920                	flw	fs0,80(a0)
   118ba:	74276e73          	csrrsi	t3,0x742,14
   118be:	7320                	flw	fs0,96(a4)
   118c0:	7075                	c.lui	zero,0xffffd
   118c2:	6f70                	flw	fa2,92(a4)
   118c4:	20646573          	csrrsi	a0,0x206,8
   118c8:	6f74                	flw	fa3,92(a4)
   118ca:	6220                	flw	fs0,64(a2)
   118cc:	2065                	jal	11974 <remu10_table+0x4>
   118ce:	776f6873          	csrrsi	a6,0x776,30
   118d2:	2e6e                	fld	ft8,216(sp)
   118d4:	0020                	addi	s0,sp,8
   118d6:	0000                	unimp
   118d8:	3130                	fld	fa2,96(a0)
   118da:	3332                	fld	ft6,296(sp)
   118dc:	3534                	fld	fa3,104(a0)
   118de:	3736                	fld	fa4,360(sp)
   118e0:	3938                	fld	fa4,112(a0)
   118e2:	4241                	li	tp,16
   118e4:	46454443          	fmadd.q	fs0,fa0,ft4,fs0,rmm
   118e8:	6e28                	flw	fa0,88(a2)
   118ea:	6c75                	lui	s8,0x1d
   118ec:	296c                	fld	fa1,208(a0)
   118ee:	0000                	unimp
   118f0:	5f757063          	bgeu	a0,s7,11ed0 <_bss_end+0x550>
   118f4:	6570                	flw	fa2,76(a0)
   118f6:	6672                	flw	fa2,28(sp)
   118f8:	735f 7465 203a      	0x203a7465735f
   118fe:	6f6e                	flw	ft10,216(sp)
   11900:	2074                	fld	fa3,192(s0)
   11902:	6d69                	lui	s10,0x1a
   11904:	6c70                	flw	fa2,92(s0)
   11906:	6d65                	lui	s10,0x19
   11908:	6e65                	lui	t3,0x19
   1190a:	6574                	flw	fa3,76(a0)
   1190c:	2064                	fld	fs1,192(s0)
   1190e:	6579                	lui	a0,0x1e
   11910:	0074                	addi	a3,sp,12
   11912:	0000                	unimp
   11914:	20525343          	fmadd.s	ft6,ft4,ft5,ft4,unknown
   11918:	6425                	lui	s0,0x9
   1191a:	6e20                	flw	fs0,88(a2)
   1191c:	7920746f          	jal	s0,190ae <_bss_end+0x772e>
   11920:	7465                	lui	s0,0xffff9
   11922:	7320                	flw	fs0,96(a4)
   11924:	7075                	c.lui	zero,0xffffd
   11926:	6f70                	flw	fa2,92(a4)
   11928:	7472                	flw	fs0,60(sp)
   1192a:	6465                	lui	s0,0x19
   1192c:	000a                	c.slli	zero,0x2
   1192e:	0000                	unimp
   11930:	1786                	slli	a5,a5,0x21
   11932:	0001                	nop
   11934:	1790                	addi	a2,sp,992
   11936:	0001                	nop
   11938:	179a                	slli	a5,a5,0x26
   1193a:	0001                	nop
   1193c:	17a4                	addi	s1,sp,1000
   1193e:	0001                	nop
   11940:	17ae                	slli	a5,a5,0x2b
   11942:	0001                	nop
   11944:	17b8                	addi	a4,sp,1000
   11946:	0001                	nop
   11948:	17c2                	slli	a5,a5,0x30
   1194a:	0001                	nop
   1194c:	17cc                	addi	a1,sp,996
   1194e:	0001                	nop
   11950:	17d6                	slli	a5,a5,0x35
   11952:	0001                	nop
   11954:	17e0                	addi	s0,sp,1004
   11956:	0001                	nop
   11958:	17ea                	slli	a5,a5,0x3a
   1195a:	0001                	nop
   1195c:	17f4                	addi	a3,sp,1004
   1195e:	0001                	nop
   11960:	17fe                	slli	a5,a5,0x3f
   11962:	0001                	nop
   11964:	1808                	addi	a0,sp,48
   11966:	0001                	nop
   11968:	1812                	slli	a6,a6,0x24
   1196a:	0001                	nop
   1196c:	181c                	addi	a5,sp,48
   1196e:	0001                	nop

Disassembly of section .data:

00011970 <remu10_table>:
   11970:	0100                	addi	s0,sp,128
   11972:	0202                	c.slli64	tp
   11974:	05040303          	lb	t1,80(s0) # 19050 <_edata+0x76d0>
   11978:	0605                	addi	a2,a2,1
   1197a:	08080707          	0x8080707
   1197e:	0009                	c.nop	2

Disassembly of section .stack:

00103000 <_stack-0x800>:
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	2941                	jal	490 <__DYNAMIC+0x490>
   2:	0000                	unimp
   4:	7200                	flw	fs0,32(a2)
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <__DYNAMIC+0x14>
   c:	001f 0000 1004      	0x10040000001f
  12:	7205                	lui	tp,0xfffe1
  14:	3376                	fld	ft6,376(sp)
  16:	6932                	flw	fs2,12(sp)
  18:	7032                	flw	ft0,44(sp)
  1a:	5f30                	lw	a2,120(a4)
  1c:	326d                	jal	fffff9c6 <_stack_start+0xffefb9c6>
  1e:	3070                	fld	fa2,224(s0)
  20:	635f 7032 0030      	0x307032635f
  26:	0108                	addi	a0,sp,128
  28:	0b0a                	slli	s6,s6,0x2

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3120                	fld	fs0,96(a0)
   c:	2e30                	fld	fa2,88(a2)
   e:	2e32                	fld	ft8,264(sp)
  10:	0030                	addi	a2,sp,8
