
import socket

sock = socket.socket()
sock.connect(('127.0.0.1', 9090))
sock.send(b'hello, world!')

data = sock.recv(512)
sock.close()

print(data)