# HA1
1. I installed docker as an application for macos
2. 
```
docker --version                                      ✔
Docker version 29.1.3, build f52814d
```
3.
``` bash
docker pull hello-world
docker run hello-world
```
4. `docker ps -a`

# HA2
2. `vim Dockerfile`
4. `docker build -t flask-app:1.0 .`
5. 
```bash
docker images flask-app                       
                                                                                            
IMAGE           ID             DISK USAGE   CONTENT SIZE   EXTRA
flask-app:1.0   90e2b5ab318e        149MB             0B
```
6.
```bash
docker run -d --name flask-app -p 8083:5000 flask-app:1.0

d2cf167bc467714fbb144f2c338f2eb392591e169f5ff1d227068b31401ee5be
```
```bash
curl http://localhost:8083/health                     ✔
{"hostname":"d2cf167bc467","status":"ok"}
```
