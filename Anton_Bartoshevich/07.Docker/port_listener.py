import socket
import sys
HOST = ''   # Symbolic name, meaning all available interfaces
PORT = 1234 # Arbitrary non-privileged port
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
try:
    s.bind((HOST, PORT))
except socket.error as msg:
    sys.exit()
s.listen(10)
while 1:
    conn, addr = s.accept()
s.close()
