# -*- coding: utf-8 -*-
"""
Created on Sat Apr 17 08:00:13 2021

@author: 10128
"""

import serial
import time
import os
import sys

if(sys.platform[0] == 'w'):
    clrstr = "cls"
    sername = "COM1"
    filelocation = "G:/flash_read_write/ext_mem.dat"
else:
    clrstr = "clear"
    sername = "/dev/ttyUSB0"
    filelocation = "/media/barneyzhu/570A48D089F2FF71/flash_read_write/ext_mem.dat"
    os.system("sudo chmod 777 " + sername)
ser = serial.Serial(sername, 115200, timeout = 0.001)

# First read the number of lines in the file
f = open(filelocation, "r")
line_cnt = 0
for line in f.readlines():
    line_cnt = line_cnt + 1
f.close()
f = open(filelocation, "r")

current_line = 0
while 1:
    instr = ser.readline()
    while instr:
        # print((instr.decode() + "\r"))
        if instr[0:4].decode() == 'Done':
            sys.stdout.write((instr.decode() + "\r"))
            ser.close()
            while 1:
                exit()
        instr = ser.readline()
    outstr = f.readline()
    if outstr:
        sys.stdout.write(outstr[0:8] + " {:.2%}\r".format((current_line + 1) / line_cnt))
        ser.write(outstr.encode())
        current_line = current_line + 1
    else:
        ser.write('q'.encode())
        sys.stdout.write('\n')
    # time.sleep(0.001)
    #os.system(clrstr)
ser.close()