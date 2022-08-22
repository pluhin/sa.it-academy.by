# 09. Docker 
## URl's
[Docker Hub](https://hub.docker.com/r/alexeyby/it-a)

## Dokerfile
```
FROM python:3.7.13-alpine3.16
RUN apk update && apk add python3
RUN pip install --upgrade pip
RUN pip3 install --no-cache-dir bottle
ADD runme.py /
CMD [ "python3", "./runme.py" ]
EXPOSE 8080
```

## Docker container build
```bash
alex@ubntest:~/myfirstrepo/09.Docker$ docker build -t bottle:1 .
Sending build context to Docker daemon  7.168kB
Step 1/7 : FROM python:3.7.13-alpine3.16
 ---> cd2a4f346519
Step 2/7 : RUN apk update && apk add python3
 ---> Running in cacd1bf7434a
fetch https://dl-cdn.alpinelinux.org/alpine/v3.16/main/x86_64/APKINDEX.tar.gz
fetch https://dl-cdn.alpinelinux.org/alpine/v3.16/community/x86_64/APKINDEX.tar.gz
v3.16.2-31-gfe918834c6 [https://dl-cdn.alpinelinux.org/alpine/v3.16/main]
v3.16.2-35-g8b5106c6a8 [https://dl-cdn.alpinelinux.org/alpine/v3.16/community]
OK: 17025 distinct packages available
(1/4) Installing libgcc (11.2.1_git20220219-r2)
(2/4) Installing libstdc++ (11.2.1_git20220219-r2)
(3/4) Installing mpdecimal (2.5.1-r1)
(4/4) Installing python3 (3.10.5-r0)
Executing busybox-1.35.0-r17.trigger
OK: 64 MiB in 40 packages
Removing intermediate container cacd1bf7434a
 ---> d2a51fa33de3
Step 3/7 : RUN pip install --upgrade pip
 ---> Running in fe02dbfb13b0
Requirement already satisfied: pip in /usr/local/lib/python3.7/site-packages (22.0.4)
Collecting pip
  Downloading pip-22.2.2-py3-none-any.whl (2.0 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 2.0/2.0 MB 939.0 kB/s eta 0:00:00
Installing collected packages: pip
  Attempting uninstall: pip
    Found existing installation: pip 22.0.4
    Uninstalling pip-22.0.4:
      Successfully uninstalled pip-22.0.4
Successfully installed pip-22.2.2
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
Removing intermediate container fe02dbfb13b0
 ---> e2ee9dfaf912
Step 4/7 : RUN pip3 install --no-cache-dir bottle
 ---> Running in 501073d106a2
Collecting bottle
  Downloading bottle-0.12.23-py3-none-any.whl (90 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 90.1/90.1 kB 688.5 kB/s eta 0:00:00
Installing collected packages: bottle
Successfully installed bottle-0.12.23
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
Removing intermediate container 501073d106a2
 ---> 5c7c85743221
Step 5/7 : ADD runme.py /
 ---> cf9eff30cbf2
Step 6/7 : CMD [ "python3", "./runme.py" ]
 ---> Running in ea16b08b7b01
Removing intermediate container ea16b08b7b01
 ---> 961f9407beac
Step 7/7 : EXPOSE 8080
 ---> Running in 546b6684ae5a
Removing intermediate container 546b6684ae5a
 ---> 1376d48dc94d
Successfully built 1376d48dc94d
Successfully tagged bottle:1
```

## Docker container run&test
```bash
alex@ubntest:~/myfirstrepo/09.Docker$ docker run -d -p 8080:8080 bottle:1
42cb70fa0a7884fd51b931b4a0aaaa28c28c7fd5ad4b90f55c8b85f9bd88b290
alex@ubntest:~/myfirstrepo/09.Docker$ docker ps
CONTAINER ID   IMAGE      COMMAND                CREATED         STATUS         PORTS                                       NAMES
42cb70fa0a78   bottle:1   "python3 ./runme.py"   4 seconds ago   Up 4 seconds   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   ecstatic_chaum
alex@ubntest:~/myfirstrepo/09.Docker$ curl http://localhost:8080
Hello, world! (From Full Stack Python)
```