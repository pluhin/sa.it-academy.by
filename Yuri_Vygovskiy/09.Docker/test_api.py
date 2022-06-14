import socket

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server.bind(('', 8080))
server.listen()
while True:
        client_socket, addr = server.accept()
        request = client_socket.recv(1024)
        print ('Connected ' + addr[0] + ':' + str(addr[1]))
        client_socket.sendall(b'Connection Works')
        client_socket.close()
