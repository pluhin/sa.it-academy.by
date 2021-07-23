import socket

s = socket.socket()
host = 'localhost'
port = 1247
s.connect((host, port))
print (s.recv(1024))
inpt = input('type anything and click enter... ')
s.send(inpt.encode())
print ("the message has been sent")
