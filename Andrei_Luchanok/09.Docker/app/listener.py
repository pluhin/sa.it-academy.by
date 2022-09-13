from cgi import print_arguments
import socket

# Define socket host and port
SERVER_HOST = '0.0.0.0'
SERVER_PORT = 8090

# Create socket
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server_socket.bind((SERVER_HOST, SERVER_PORT))
server_socket.listen(1)
print('Listening on port %s ...' % SERVER_PORT)

while True:
    # Wait for client connections
    client_connection, client_address = server_socket.accept()

    # Get the client request
    try:
        request = client_connection.recv(1024).decode()
        print(request)
        request = request.split('\n')[7]
        if request == "hello":
            response = 'HTTP/1.0 200 OK\n\nHello Andrei Luchanok\n'

        else:
            response = 'HTTP/1.0 200 OK\n\nunknown command\n'
    except:
        response = 'HTTP/1.0 200 OK\n\nerror\n'

    # Send HTTP response

    client_connection.sendall(response.encode())
    client_connection.close()

# Close socket
server_socket.close()
