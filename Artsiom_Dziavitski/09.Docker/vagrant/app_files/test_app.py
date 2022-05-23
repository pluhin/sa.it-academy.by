import time
import socket

# creating a socket object
s = socket.socket(socket.AF_INET,
                  socket.SOCK_STREAM)

# get local Host machine name
#host = socket.gethostname() # or just use (host == '')
host = ''
port = 80 
hostname = socket.gethostname() + "\r\n"

# bind to pot
s.bind((host, port))

# Que up to 5 requests
s.listen(5)

while True:
    # establish connection
    clientSocket, addr = s.accept()
    print("Server: %s" % str(hostname))
    print("Got a connection from %s" % str(addr))
    currentTime = time.ctime(time.time()) + "\r\n"
    clientSocket.send(str.encode(hostname)) 
    clientSocket.send(currentTime.encode('ascii'))
    clientSocket.close()
