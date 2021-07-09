#!/usr/bin/env python

import socket
MY_PORT = 7777
MY_IP = '127.0.0.1'
#BUF_SIZE = 300
MY_SOCKET = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
MY_SOCKET.bind((MY_IP, MY_PORT))
MY_SOCKET.listen(1)
con, addr = MY_SOCKET.accept()
print ('Connection Address is: ' , addr)
while True :
    data = con.recv(1024)
    if not data:
        break
    print ("Received data", data)
    con.send(data)
con.close()

