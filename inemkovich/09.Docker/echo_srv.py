import socket

with socket.socket() as s:
    host = ''
    port = 8001
    s.bind((host, port))
    print(f'socket binded to {port}')
    s.listen()
    con, addr = s.accept()
    print(f'{con} {addr}')
    with con:
        while True:
            data = con.recv(1024)
            con.sendall(b"Echo server reply: ")
            con.sendall(data)
            print(data)
            if not data:
                continue
    
