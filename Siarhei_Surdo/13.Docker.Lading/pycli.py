import socket, select, string, sys
serverAddressPort   = ("127.0.0.1", 20001)
bufferSize          = 1024
# Create a UDP socket at client side
UDPClientSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)

while 1:
	# Send to server using created UDP socket
	print 'Enter message: '
	msgFromClient       = sys.stdin.readline()
	bytesToSend         = str.encode(msgFromClient)

	UDPClientSocket.sendto(bytesToSend, serverAddressPort)
	msgFromServer = UDPClientSocket.recvfrom(bufferSize)
	msg = "Message from Server {}".format(msgFromServer[0])
	print(msg)
