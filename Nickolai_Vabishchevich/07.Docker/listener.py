import socket

ip = ""
port = 8484

print("Listener started on %s:%s" % (ip, port))

def listener():
    listener_socket = socket.socket()
    listener_socket.bind((ip, port))
    listener_socket.listen(2)
    conn, address = listener_socket.accept()
    conn.send(b'SUCCESS! WELCOME TO THE SERVER!\n')
    print("Connection from: " + str(address))
    conn.close()

if __name__ == '__main__':
    listener()
