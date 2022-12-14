## docker build -t flask:1.0 -f Dockerfile .
```sh
Sending build context to Docker daemon  4.608kB

Step 1/7 : FROM  python:3-alpine AS builder
3-alpine: Pulling from library/python
c158987b0551: Pulling fs layer
7ec3a91b66d9: Pulling fs layer
c89fd98887b3: Pulling fs layer
877ccf16716c: Pulling fs layer
3cfcd1e4ebae: Pulling fs layer
877ccf16716c: Waiting
3cfcd1e4ebae: Waiting
7ec3a91b66d9: Verifying Checksum
7ec3a91b66d9: Download complete
c158987b0551: Download complete
c158987b0551: Pull complete
7ec3a91b66d9: Pull complete
877ccf16716c: Verifying Checksum
877ccf16716c: Download complete
3cfcd1e4ebae: Verifying Checksum
3cfcd1e4ebae: Download complete
c89fd98887b3: Verifying Checksum
c89fd98887b3: Download complete
c89fd98887b3: Pull complete
877ccf16716c: Pull complete
3cfcd1e4ebae: Pull complete
Digest: sha256:af8fef83397b3886ed93d2c81bf3b4e70d39c0789c1c6feb1ecb86ca9bc42a0a
Status: Downloaded newer image for python:3-alpine
 ---> 18ccdc39ea28
Step 2/7 : WORKDIR /webapp
 ---> Running in 77dbd0bf651d
Removing intermediate container 77dbd0bf651d
 ---> 0775fda5a2c9
Step 3/7 : COPY requirements.txt ./
 ---> b40bb91d0869
Step 4/7 : RUN pip3 install --no-cache-dir -r requirements.txt
 ---> Running in 4684d0a36ac4
Collecting flask
  Downloading Flask-2.2.2-py3-none-any.whl (101 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 101.5/101.5 kB 1.7 MB/s eta 0:00:00
Collecting Werkzeug>=2.2.2
  Downloading Werkzeug-2.2.2-py3-none-any.whl (232 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 232.7/232.7 kB 5.5 MB/s eta 0:00:00
Collecting Jinja2>=3.0
  Downloading Jinja2-3.1.2-py3-none-any.whl (133 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 133.1/133.1 kB 14.6 MB/s eta 0:00:00
Collecting itsdangerous>=2.0
  Downloading itsdangerous-2.1.2-py3-none-any.whl (15 kB)
Collecting click>=8.0
  Downloading click-8.1.3-py3-none-any.whl (96 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 96.6/96.6 kB 15.0 MB/s eta 0:00:00
Collecting MarkupSafe>=2.0
  Downloading MarkupSafe-2.1.1.tar.gz (18 kB)
  Preparing metadata (setup.py): started
  Preparing metadata (setup.py): finished with status 'done'
Building wheels for collected packages: MarkupSafe
  Building wheel for MarkupSafe (setup.py): started
  Building wheel for MarkupSafe (setup.py): finished with status 'done'
  Created wheel for MarkupSafe: filename=MarkupSafe-2.1.1-py3-none-any.whl size=9650 sha256=2d8edae2b967e49f8b4ac178b7cb4a174168dbc970d61c6e5d1272f27714c19c
  Stored in directory: /tmp/pip-ephem-wheel-cache-aljjatiq/wheels/96/ee/62/407c247ad088bcb67b530ba3ac1479058c58a651bd6bf09a1f
Successfully built MarkupSafe
Installing collected packages: MarkupSafe, itsdangerous, click, Werkzeug, Jinja2, flask
Successfully installed Jinja2-3.1.2 MarkupSafe-2.1.1 Werkzeug-2.2.2 click-8.1.3 flask-2.2.2 itsdangerous-2.1.2
[91mWARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
[0mRemoving intermediate container 4684d0a36ac4
 ---> 810c58f1a6ed
Step 5/7 : COPY . .
 ---> 1f4903a6087a
Step 6/7 : CMD ["python", "app.py"]
 ---> Running in a0760a80eab9
Removing intermediate container a0760a80eab9
 ---> 48e4240c53af
Step 7/7 : EXPOSE 80
 ---> Running in d50485fa8f9d
Removing intermediate container d50485fa8f9d
 ---> bd369f64b9b0
Successfully built bd369f64b9b0
Successfully tagged flask:1.0
 * Serving Flask app 'app'
 * Debug mode: off
```

## docker images
```sh
2022-12-14 15:10:17 (2.43 MB/s) - ‘index.html’ saved [18/18]REPOSITORY   TAG        IMAGE ID       CREATED          SIZE
flask        1.0        bd369f64b9b0   32 minutes ago   71.1MB
python       3-alpine   18ccdc39ea28   6 days ago       52.4MB
```


## wget http://172.17.0.2:5000
```sh
--2022-12-14 15:37:57--  http://172.17.0.2:5000/
Connecting to 172.17.0.2:5000... connected.
HTTP request sent, awaiting response... 200 OK
Length: 18 [text/html]
Saving to: ‘index.html.1’

index.html.1                                      100%[=============================================================================================================>]      18  --.-KB/s    in 0s      

2022-12-14 15:37:57 (74.0 KB/s) - ‘index.html.1’ saved [18/18]
```

## curl http://172.17.0.2:5000
```sh
I am FLASK! Hello!
```