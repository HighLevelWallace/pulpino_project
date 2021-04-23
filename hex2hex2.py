
def h2d(hex) :
	change = {"0":0 , "1":1 , "2":2 , "3":3 , "4":4 , "5":5 , "6":6 , "7":7 , "8":8 , "9":9 , "A":10 , "B":11 , "C":12 , \
		"D":13 , "E":14 , "F":15 }
	return 16*change[hex[0]] + change[hex[1]]

with open("helloworld.hex", "r") as f1 :
	with open("ext_mem.dat", "w") as f2 :
		code = [None, None, None, None]
		byte_i = 0
		while 1 :
			line = f1.readline()
			if not line :
				break
			num_byte = h2d(line[1:3])
			if line[7:9] == "02" :
				f2.write("@" + line[9:(9 + num_byte*2)] + "00\n")
			if line[7:9]=="04":
				f2.write("@" + line[9:(9 + num_byte*2)] + "0000\n")
			elif line[7:9] == "00" :
				for i in range(num_byte) :
					if  byte_i == 3 :
						byte_i = 0
						code[0] = line[(9 + 2*i) : (11 + 2*i)]
						for each_byte in code :
							f2.write(each_byte)
						f2.write("\n")
					else :
						code[3 - byte_i] = line[(9 + 2*i) : (11 + 2*i)]
						byte_i += 1
			elif line[7:9] == "01" :
				break
			else :
				continue
