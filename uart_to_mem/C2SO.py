import os


dir_C = os.getcwd()
print(dir_C)

def C2I():
	files = os.listdir(dir_C + '/file_c')
	path = './file_i'
	print(path)
	if(os.path.exists(path)):
		pass
	else:
		os.system('mkdir ' + path)

	for file in files:
		tmp = file.split('.')
		if(len(tmp) == 1):
			pass
		elif(tmp[1].lower() == 'c'):
			os.system('riscv32-unknown-elf-gcc -march=rv32imc -mabi=ilp32 -E -o ' './file_i/' + tmp[0] + '.i ' + './file_c/' + file)
			#print('riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -E -o ' + './file_i/' + tmp[0] + '.i ' + tmp[0] + '.c')


def I2S():
	path_files_i = dir_C + '/file_i'
	files = os.listdir(path_files_i)
	path = './file_s'

	if(os.path.exists(path)):
		pass
	else:
		os.system('mkdir ' + path)
	for file in files:
		tmp = file.split('.')
		if(len(tmp) == 1):
			pass
		elif(tmp[1].lower() == 'i'):
			os.system('riscv32-unknown-elf-gcc -march=rv32imc -mabi=ilp32 -S -o ' + './file_s/' + tmp[0] + '.s ' + path_files_i + '/' + file)


def S2O():
	path_files_s = dir_C + '/file_s'
	files = os.listdir(path_files_s)
	path = './file_o'
	if(os.path.exists(path)):
		pass
	else:
		os.system('mkdir ' + path)
	for file in files:
		tmp = file.split('.')
		if(len(tmp) == 1):
			pass
		elif(tmp[1].lower() == 's'):
			os.system('riscv32-unknown-elf-gcc -march=rv32imc -mabi=ilp32 -c -o ' + './file_o/' + tmp[0] + '.o ' + path_files_s  + '/' + file)


def Ld():
	cmd = 'riscv32-unknown-elf-ld -T link.ld '
	files = os.listdir(dir_C + '/file_o')
	path_files_o = dir_C + '/file_o'
	files = os.listdir(path_files_o)
	for file in files:
		tmp = file.split('.')
		if(len(tmp) == 2 and tmp[1] == 'o'):
			cmd = cmd + './file_o/' + file + ' '
		else:
			pass
	cmd = cmd + 'libgcc.a libc.a -o hello'
	#print(cmd)
	os.system(cmd)
	os.system('riscv32-unknown-elf-objcopy -O ihex hello helloworld.hex')


C2I()
I2S()
S2O()
Ld()
os.system('riscv32-unknown-elf-objdump -D hello > obj.s')
os.system('python hex2hex2.py')
