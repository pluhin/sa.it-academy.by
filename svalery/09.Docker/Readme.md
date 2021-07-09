##Python script
```bash
import socket


class SocketLineReader:
    def __init__(self, socket):
        self.socket = socket
        self._buffer = b''

    def readline(self):
        pre, separator, post = self._buffer.partition(b'\n')
        if separator:
            self._buffer = post
            return pre + separator

        while True:
            data = self.socket.recv(1024)
            if not data:
                return None

            pre, separator, post = data.partition(b'\n')
            if not separator:
                self._buffer += data
            else:
                data = self._buffer + pre + separator
                self._buffer = post
                return data

sock = socket.socket()
sock.bind(('', 9090))
sock.listen(1)

while True:
    conn, addr = sock.accept()
    print('connected:', addr)
    reader = SocketLineReader(conn)
    # The other code goes here
```
##Commands
```bash
docker build -t kartvalery/py_list:v1.0.0 .
docker push kartvalery/py_list:v1.0.0
docker run -d -p 9090:9090  py_list:v1.0.0
```
##
[Docker_hub](https://hub.docker.com/repository/docker/kartvalery/py_list)