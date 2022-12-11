# 07.Docker

## Docker images
 
 ```bash
REPOSITORY          TAG               IMAGE ID       CREATED          SIZE
python-docker       homework          4ad5eaea6150   22 minutes ago   79.4MB
python              3.8-alpine        13f1e3678aa9   3 days ago       48.2MB
python              3.8-slim-buster   241ddc060a49   3 days ago       117MB
 ```

 ## Files

 ### app.py

 ```python
 from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    str1='Hi from Minsk,Belarus.'
    str2='\nThis is homework 07.Docker\n'
    return str1+str2

if __name__ == "__main__":
    app.run(host='0.0.0.0')
 ```

 ### python.Dockerfile

 ```Dockerfile
 FROM python:3.8-alpine
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
 ```

 ### testing script test.sh

 ```bash
 ip=('192.168.1.103:8000' 'localhost:8000' '127.0.0.1:8000')

for t in ${ip[@]}; do
echo ' '
echo '____________________'
echo $t
echo ' '
    curl -i $t
echo ' '

done
 ```

 ## Testing

 ### Run

 ```bash
 docker run --rm -p 8000:5000 --name hm  python-docker:homework
 ```

 ### Test (run test.sh)

 ```bash
____________________
192.168.1.103:8000

HTTP/1.1 200 OK
Server: Werkzeug/2.2.2 Python/3.8.16
Date: Sun, 11 Dec 2022 08:57:05 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 50
Connection: close

Hi from Minsk,Belarus.
This is homework 07.Docker


____________________
localhost:8000

HTTP/1.1 200 OK
Server: Werkzeug/2.2.2 Python/3.8.16
Date: Sun, 11 Dec 2022 08:57:05 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 50
Connection: close

Hi from Minsk,Belarus.
This is homework 07.Docker


____________________
127.0.0.1:8000

HTTP/1.1 200 OK
Server: Werkzeug/2.2.2 Python/3.8.16
Date: Sun, 11 Dec 2022 08:57:05 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 50
Connection: close

Hi from Minsk,Belarus.
This is homework 07.Docker
 ```

 ### Test from main OS

 ```bash
  ~/ curl -i 192.168.1.103:8000
HTTP/1.1 200 OK
Server: Werkzeug/2.2.2 Python/3.8.16
Date: Sun, 11 Dec 2022 08:58:30 GMT
Content-Type: text/html; charset=utf-8
Content-Length: 50
Connection: close

Hi from Minsk,Belarus.
This is homework 07.Docker
 ```

 ### Logs

 ```bash
 192.168.1.103 - - [11/Dec/2022 08:57:05] "GET / HTTP/1.1" 200 -
172.17.0.1 - - [11/Dec/2022 08:57:05] "GET / HTTP/1.1" 200 -
172.17.0.1 - - [11/Dec/2022 08:57:05] "GET / HTTP/1.1" 200 -
192.168.1.102 - - [11/Dec/2022 08:58:30] "GET / HTTP/1.1" 200 -
```