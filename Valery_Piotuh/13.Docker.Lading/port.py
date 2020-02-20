'''
    Simple socket server using threads
'''

import socket
import sys
from thread import *

HOST = ''    # Symbolic name meaning all available interfaces
PORT = 8888    # Arbitrary non-privileged port

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
print ('Socket created')

#Bind socket to local host and port
try:
    s.bind((HOST, PORT))
except socket.error as msg:
    print ('Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1])
    sys.exit()

print ('Socket bind complete')

#Start listening on socket
s.listen(10)
print ('Socket now listening')

#Function for handling connections. This will be used to create threads
def clientthread(conn):
    #Sending message to connected client
    conn.send('Welcome to the server. Type something and hit enter\n') #send only takes string

    #infinite loop so that function do not terminate and thread do not end.
    while True:

        #Receiving from client
        data = conn.recv(1024)
        reply = 'You wrote me...' + data + '...:)'
        if not data:
            break

        conn.sendall(reply)

    #came out of loop
    conn.close()
