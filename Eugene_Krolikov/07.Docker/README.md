# 07.Docker

## Docker build

```bush
root@05lesson:/home/devops# docker build -t webserver_python:1.0 -f Dockerfile .
[+] Building 2.1s (3/3) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                                                0.0s
 => => transferring dockerfile: 130B                                                                                                                                                                0.0s
 => [internal] load .dockerignore                                                                                                                                                                   0.0s
 => => transferring context: 2B                                                                                                                                                                     0.0s
 => ERROR [internal] load metadata for docker.io/library/python:3.11-slim                                                                                                                           2.1s
------
 > [internal] load metadata for docker.io/library/python:3.11-slim:
------
Dockerfile:1
--------------------
   1 | >>> FROM python:3.11-slim
   2 |     WORKDIR /server
   3 |     COPY checker.py ./
--------------------
ERROR: failed to solve: python:3.11-slim: failed to copy: httpReadSeeker: failed open: failed to do request: Get "https://production.cloudflare.docker.com/registry-v2/docker/registry/v2/blobs/sha256/99/99a362672ed6387582e5c752fe2cb579641074a4f77ac6136559d9c3dad60956/data?verify=1679929588-Xkv7IYiJ9JmssEIVKEcUYx26aIY%3D": x509: certificate signed by unknown authority
root@05lesson:/home/devops# cp /home/devops/docker2.crt /usr/local/share/ca-certificates/corp/
root@05lesson:/home/devops# cd /usr/local/share/ca-certificates
root@05lesson:/usr/local/share/ca-certificates# update-ca-certificates
Updating certificates in /etc/ssl/certs...
rehash: warning: skipping ca-certificates.crt,it does not contain exactly one certificate or CRL
1 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d...
done.
root@05lesson:/usr/local/share/ca-certificates# systemctl restart docker
root@05lesson:/usr/local/share/ca-certificates# cd /home/devops/


root@05lesson:/home/devops# docker build -t webserver_python:1.0 -f Dockerfile .
[+] Building 9.1s (8/8) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                                                0.0s
 => => transferring dockerfile: 130B                                                                                                                                                                0.0s
 => [internal] load .dockerignore                                                                                                                                                                   0.0s
 => => transferring context: 2B                                                                                                                                                                     0.0s
 => [internal] load metadata for docker.io/library/python:3.11-slim                                                                                                                                 1.7s
 => [1/3] FROM docker.io/library/python:3.11-slim@sha256:2f749ef90f54fd4b3c77cde78eec23ab5b8199d9ac84e4ced6ae523ef223ef7b                                                                           7.1s
 => => resolve docker.io/library/python:3.11-slim@sha256:2f749ef90f54fd4b3c77cde78eec23ab5b8199d9ac84e4ced6ae523ef223ef7b                                                                           0.0s
 => => sha256:9ad4ffc502779e5508f7ac1eccab4a22786b80bd53d721d735f6de0840b245a1 1.37kB / 1.37kB                                                                                                      0.0s
 => => sha256:4d2191666712ee49cabf8e353ecb866d05568778d810cdd908a4eed2e024a58c 6.89kB / 6.89kB                                                                                                      0.0s
 => => sha256:f1f26f5702560b7e591bef5c4d840f76a232bf13fd5aefc4e22077a1ae4440c7 31.41MB / 31.41MB                                                                                                    3.8s
 => => sha256:2d2b016608857911079186690549bb03798585a3f2310e34bc878db7fa0fcd80 1.08MB / 1.08MB                                                                                                      0.5s
 => => sha256:e4e8e4c0b0e1ede5d95ec0e486ee183a1982365fa95a2fe2f54e37abce15c874 11.95MB / 11.95MB                                                                                                    1.4s
 => => sha256:2f749ef90f54fd4b3c77cde78eec23ab5b8199d9ac84e4ced6ae523ef223ef7b 1.65kB / 1.65kB                                                                                                      0.0s
 => => sha256:1ba60f086308c4cd4d46287364ec6abfaff8f3b5e480f2ce082ef61a30bbe68d 243B / 243B                                                                                                          1.4s
 => => sha256:3c2fccf90be107c0275e15c5f035c8132a9666f60d443e3a5b83afeab3883b2d 3.37MB / 3.37MB                                                                                                      2.1s
 => => extracting sha256:f1f26f5702560b7e591bef5c4d840f76a232bf13fd5aefc4e22077a1ae4440c7                                                                                                           1.5s
 => => extracting sha256:2d2b016608857911079186690549bb03798585a3f2310e34bc878db7fa0fcd80                                                                                                           0.1s
 => => extracting sha256:e4e8e4c0b0e1ede5d95ec0e486ee183a1982365fa95a2fe2f54e37abce15c874                                                                                                           0.6s
 => => extracting sha256:1ba60f086308c4cd4d46287364ec6abfaff8f3b5e480f2ce082ef61a30bbe68d                                                                                                           0.0s
 => => extracting sha256:3c2fccf90be107c0275e15c5f035c8132a9666f60d443e3a5b83afeab3883b2d                                                                                                           0.3s
 => [internal] load build context                                                                                                                                                                   0.0s
 => => transferring context: 994B                                                                                                                                                                   0.0s
 => [2/3] WORKDIR /server                                                                                                                                                                           0.1s
 => [3/3] COPY checker.py ./                                                                                                                                                                        0.1s
 => exporting to image                                                                                                                                                                              0.0s
 => => exporting layers                                                                                                                                                                             0.0s
 => => writing image sha256:45fac857ec88f82fc57a3fd59731880a551d7b569b0a5d491a5cf3c4db44492b                                                                                                        0.0s
 => => naming to docker.io/library/webserver_python:1.0              
 ```
 
## Docker images

 ```bush
root@05lesson:/home/devops# docker images
REPOSITORY         TAG       IMAGE ID       CREATED         SIZE
webserver_python   1.0       45fac857ec88   2 minutes ago   128MB
 ```

## Run docker and test

 ```bush
root@05lesson:/home/devops# docker run -p 8443:8443 webserver_python:1.0
172.17.0.1 - - [27/Mar/2023 14:19:13] "GET / HTTP/1.1" 200 -

root@05lesson:/home/devops# curl http://localhost:8443
<html><head><title>Python server!</title></head><p>Request: /</p><body><p>This is an example web server.</p></body></html>root@05lesson:/home/devops#
```

## Docker ps

 ```bush
root@05lesson:/home/devops# docker ps
CONTAINER ID   IMAGE                  COMMAND               CREATED         STATUS         PORTS                                       NAMES
548089497dc7   webserver_python:1.0   "python checker.py"   3 minutes ago   Up 3 minutes   0.0.0.0:8443->8443/tcp, :::8443->8443/tcp   silly_kapitsa
 ```