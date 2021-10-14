#!/usr/bin/env python3

# Echo server
import socket

HOST = ''    # all available interfaces
PORT = 5005  # any port > 1023
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
print ('| Echo server for 09.Docker |')
print (f'===== Port listen: {PORT} =====')
s.listen(1)  # 1 means the number of accepted connections
conn, addr = s.accept()  # waits for a new connection
print (f'Client connected: {addr}\n')
while True:
  data = conn.recv(1024)
  if not data:
      break
  conn.sendall(b"Echo reply: ")
  conn.sendall(data)
  print ('Data from client:', data.decode('utf-8'))
conn.close()
