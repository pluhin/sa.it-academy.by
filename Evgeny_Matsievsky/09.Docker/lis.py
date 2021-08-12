import socket

web = socket.socket()
web.bind(('localhost', 7788))
web.listen(1)
fd, addr = web.accept()

print(f'Connected: {addr}')

while True:
    data = fd.recv(1024)
    if not data:
        break
    fd.send(data.upper())

fd.close()


