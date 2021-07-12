import socket
import requests
serv_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM, proto=0)
serv_sock.bind(('localhost', 2021))
serv_sock.listen(10)

while True:
    # Wait connection
    client_sock, client_addr = serv_sock.accept()
    print('Currency exchange rate on today. Please enter you city in Russian')

    while True:
        # While client connected, read receive city and responce rate from bank
        data = client_sock.recv(1024)
        URL = 'https://belarusbank.by/api/kursExchange?city=' + data.decode('utf-8').strip()
        r = requests.get(URL).text.encode('utf-8')
        if not data:
            # Client disabled
            break
        client_sock.sendall(r)

    client_sock.close()
