#!/usr/bin/env python
# -*- coding: utf-8 -*-

import socket

sock = socket.socket()
srv_addr = ('', 9090)
sock.bind(srv_addr)
sock.listen(1)
conn, addr = sock.accept()

print('connected:', addr)

while True:
    data = conn.recv(1024)
    if not data:
        break
    conn.send(data.upper())

conn.close()