
#!/usr/bin/env python3

import socket

HOST = ''
PORT = 5150
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
print ('| Echo server for 09.Docker |')
print (f' Port listen: {PORT} ')
s.listen(1)
conn, addr = s.accept()
print (f'Connected: {addr}\n')
while True:
  data = conn.recv(1024)
  if not data:
      break
  conn.sendall(b"Reply: ")
  conn.sendall(data)
  print ('Data from client:', data.decode('utf-8'))
conn.close()


