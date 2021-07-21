import socket

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host = 'localhost'
port = 1247
s.bind((host,port))
s.listen(5)
mesg = "Server approved connection".encode()
while True:
    c, addr = s.accept()
    print("Connection accepted from " + repr(addr[1]))
    c.send(mesg)
    print (repr(addr[1]) + ": " + c.recv(1026).decode())
    c.close()
