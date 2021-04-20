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
    filelocation = "../flash_read_write/ext_mem.dat"
ser = serial.Serial(sername, 115200, timeout = 0.01)

print(ser.isOpen())

f = open(filelocation, "r")

while 1:
    instr = ser.readline()
    while instr:
        print((instr.decode() + "\r"))
        if instr[0:4].decode() == 'Done':
            ser.close()
            while 1:
                pass
        instr = ser.readline()
    outstr = f.readline()
    if outstr:
        print(outstr)
        ser.write(outstr.encode())
    else:
        ser.write('q'.encode())
    time.sleep(0.001)
    #os.system(clrstr)
ser.close()