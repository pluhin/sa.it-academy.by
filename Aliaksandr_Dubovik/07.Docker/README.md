# Docker ps

aliaksandr@aloaksandr:~/07.Docer.Basic_concept/python-docker$ docker ps
CONTAINER ID   IMAGE              COMMAND            CREATED          STATUS          PORTS                                       NAMES
a59c1ba2a1fc   docker-flask-api   "python3 app.py"   21 seconds ago   Up 21 seconds   0.0.0.0:5000->5000/tcp, :::5000->5000/tcp   vigilant_agnesi


# Build

```
aliaksandr@aloaksandr:~/07.Docer.Basic_concept/python-docker$ docker build -t docker-flask-api .
Sending build context to Docker daemon   5.12kB
Step 1/7 : FROM alpine:latest
latest: Pulling from library/alpine
c158987b0551: Already exists
Digest: sha256:8914eb54f968791faf6a8638949e480fef81e697984fba772b3976835194c6d4
Status: Downloaded newer image for alpine:latest
 ---> 49176f190c7e
Step 2/7 : RUN apk add --no-cache python3-dev     && python3 -m ensurepip     && pip3 install --upgrade pip
 ---> Running in 47e4fd62362d
fetch https://dl-cdn.alpinelinux.org/alpine/v3.17/main/x86_64/APKINDEX.tar.gz
fetch https://dl-cdn.alpinelinux.org/alpine/v3.17/community/x86_64/APKINDEX.tar.gz
(1/15) Installing pkgconf (1.9.3-r0)
(2/15) Installing libbz2 (1.0.8-r4)
(3/15) Installing libexpat (2.5.0-r0)
(4/15) Installing libffi (3.4.4-r0)
(5/15) Installing gdbm (1.23-r0)
(6/15) Installing xz-libs (5.2.9-r0)
(7/15) Installing libgcc (12.2.1_git20220924-r4)
(8/15) Installing libstdc++ (12.2.1_git20220924-r4)
(9/15) Installing mpdecimal (2.5.1-r1)
(10/15) Installing ncurses-terminfo-base (6.3_p20221119-r0)
(11/15) Installing ncurses-libs (6.3_p20221119-r0)
(12/15) Installing readline (8.2.0-r0)
(13/15) Installing sqlite-libs (3.40.0-r0)
(14/15) Installing python3 (3.10.9-r1)
(15/15) Installing python3-dev (3.10.9-r1)
Executing busybox-1.35.0-r29.trigger
OK: 107 MiB in 30 packages
Looking in links: /tmp/tmp11u2e2_j
Processing /tmp/tmp11u2e2_j/setuptools-65.5.0-py3-none-any.whl
Processing /tmp/tmp11u2e2_j/pip-22.3.1-py3-none-any.whl
Installing collected packages: setuptools, pip
Successfully installed pip-22.3.1 setuptools-65.5.0
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
Requirement already satisfied: pip in /usr/lib/python3.10/site-packages (22.3.1)
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
Removing intermediate container 47e4fd62362d
 ---> e4c8c4d8183b
Step 3/7 : WORKDIR /app
 ---> Running in 3001930e5aa9
Removing intermediate container 3001930e5aa9
 ---> ad2cca6ab599
Step 4/7 : COPY . /app
 ---> 556fff6905ac
Step 5/7 : RUN pip3 --no-cache-dir install -r requirements.txt
 ---> Running in 17e3f25c1d21
Collecting Flask
  Downloading Flask-2.2.2-py3-none-any.whl (101 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 101.5/101.5 kB 1.6 MB/s eta 0:00:00
Collecting click>=8.0
  Downloading click-8.1.3-py3-none-any.whl (96 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 96.6/96.6 kB 50.6 MB/s eta 0:00:00
Collecting itsdangerous>=2.0
  Downloading itsdangerous-2.1.2-py3-none-any.whl (15 kB)
Collecting Werkzeug>=2.2.2
  Downloading Werkzeug-2.2.2-py3-none-any.whl (232 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 232.7/232.7 kB 10.5 MB/s eta 0:00:00
Collecting Jinja2>=3.0
  Downloading Jinja2-3.1.2-py3-none-any.whl (133 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 133.1/133.1 kB 50.8 MB/s eta 0:00:00
Collecting MarkupSafe>=2.0
  Downloading MarkupSafe-2.1.1-cp310-cp310-musllinux_1_1_x86_64.whl (29 kB)
Installing collected packages: MarkupSafe, itsdangerous, click, Werkzeug, Jinja2, Flask
Successfully installed Flask-2.2.2 Jinja2-3.1.2 MarkupSafe-2.1.1 Werkzeug-2.2.2 click-8.1.3 itsdangerous-2.1.2
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
Removing intermediate container 17e3f25c1d21
 ---> 1f30c1e8f5ad
Step 6/7 : EXPOSE 5000
 ---> Running in cdad98efdafa
Removing intermediate container cdad98efdafa
 ---> d233bc487c3f
Step 7/7 : CMD ["python3", "app.py"]
 ---> Running in 269adc14a7bf
Removing intermediate container 269adc14a7bf
 ---> df083c381d36
Successfully built df083c381d36
Successfully tagged docker-flask-api:latest
```

# Test

```
aliaksandr@aloaksandr:~/07.Docer.Basic_concept/python-docker$ curl -S http://localhost:5000
{
  "response": "Hello world!"
}
```