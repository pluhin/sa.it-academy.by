##Python script
```bash
import socket

web = socket.socket()
web.bind(('localhost', 7788))
web.listen(1)
fd, addr = web.accept()

print(f'Connected: {addr}')

while True:
    data = fd.recv(1024)
    if not data:
        break
    fd.send(data.upper())

fd.close()



```
##Commands
```bash
docker build -t lis:v1.0.0  -f 09.Dockerfile .
docker run -p 5544:7788 -t lis:v1.0.0
```