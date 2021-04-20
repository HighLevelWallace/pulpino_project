# -*- coding: utf-8 -*-
"""
Created on Wed Mar 17 21:22:37 2021

@author: 10128
"""
#import _io
f1 = open("ext_mem.dat", "r")
line = str()
#f = range(16)
f = [open("ext_mem_" + str(i) +".mif", "w") for i in range(16)]
flag = 0

for fi in f:
    fi.write("DEPTH = 256;                    --The size of data in bits\n")
    fi.write("WIDTH = 32;                     --The size of memory in words\n")
    fi.write("ADDRESS_RADIX = HEX;            --The radix for address values\n")
    fi.write("DATA_RADIX = HEX;\n")
    fi.write("\n")
    fi.write("CONTENT\t")
    fi.write("BEGIN\n")

    j = 0
    while 1 :
        if flag == 1 and j == 0:
            pass#print("start of the file")
        else:
            line = f1.readline()
            if line and line[0] == '@':  #Avoid the problems temporarily
                line = f1.readline()
        flag = 1
        if (not line or j >= 256) :
            break
        fi.write(hex(j)[2:] + " : " + line[0:len(line) - 1] + ";\n")
        j = j + 1
    fi.write("END;\n")
    fi.close()
f1.close()