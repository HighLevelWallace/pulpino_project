更新内容：内核调整到24MHz，串口波特率调整至115200.  
可以通过uart_to_mem文件夹中的serialout.py脚本装载dat文件到指令RAM.(使用前修改路径和端口号)  

注意：在编译用户程序时请使用本仓库主目录下的link.ld脚本进行链接。
