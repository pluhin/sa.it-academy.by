import socket

s = socket.socket()
host = '0.0.0.0'
port = 1247
s.bind((host,port))
s.listen(5)
while True:
    c, addr = s.accept()
    print("Connection accepted from " + repr(addr[1]))

    c.send("Server approved connection\n")
    print (repr(addr[1]) + ": " + c.recv(1026))
    c.close()