import socket
import sys


# specify Host and Port
HOST = ''
PORT = 5000

soc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

try:
	# With the help of bind() function
	# binding host and port
	soc.bind((HOST, PORT))
	
except socket.error as message:
	
	# if any error occurs then with the
	# help of sys.exit() exit from the program
	print('Bind failed. Error Code : '
		+ str(message[0]) + ' Message '
		+ message[1])
	sys.exit()
	
# print if Socket binding operation completed
print('Socket binding operation completed')

# With the help of listening () function
# starts listening
soc.listen(9)

conn, address = soc.accept()
# print the address of connection
print('Connected with ' + address[0] + ':'
	+ str(address[1]))

