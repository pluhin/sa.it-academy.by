# Docker.Lading
##### DockerHub [account](https://cloud.docker.com/repository/list)
##### Work directory (all this files are in app folder):
```bash
:~/work/git/docker/test > tree
.
├── Dockerfile
├── __pycache__
│   └── start.cpython-36.pyc
├── requirements.txt
├── start.py
├── start.pyc
└── templates
    ├── index.html
    └── main.html

2 directories, 7 files
```
##### To test this docker container, run the following commands:
```bash
docker pull hutemai/first:v_1
docker run -d -p 5000:5000 hutemai/first:v_1
```
##### After that go to http://127.0.0.1:5000
##### Console OUTPUT:
```bash
:~/work/git/docker/test > docker build -t hutemai/first:v_1 .
Sending build context to Docker daemon  31.23kB
Step 1/6 : FROM python:alpine3.6
 ---> 37daba746bbe
Step 2/6 : COPY . /app
 ---> 7d4dc0a33b1f
Step 3/6 : WORKDIR /app
 ---> Running in 2948a68a44e6
Removing intermediate container 2948a68a44e6
 ---> aef8991e2202
Step 4/6 : RUN pip install -r requirements.txt
 ---> Running in 35a4d6712b1f
Collecting flask (from -r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/7f/e7/08578774ed4536d3242b14dacb4696386634607af824ea997202cd0edb4b/Flask-1.0.2-py2.py3-none-any.whl (91kB)
Collecting Jinja2>=2.10 (from flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/7f/ff/ae64bacdfc95f27a016a7bed8e8686763ba4d277a78ca76f32659220a731/Jinja2-2.10-py2.py3-none-any.whl (126kB)
Collecting click>=5.1 (from flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/fa/37/45185cb5abbc30d7257104c434fe0b07e5a195a6847506c074527aa599ec/Click-7.0-py2.py3-none-any.whl (81kB)
Collecting itsdangerous>=0.24 (from flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/76/ae/44b03b253d6fade317f32c24d100b3b35c2239807046a4c953c7b89fa49e/itsdangerous-1.1.0-py2.py3-none-any.whl
Collecting Werkzeug>=0.14 (from flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/24/4d/2fc4e872fbaaf44cc3fd5a9cd42fda7e57c031f08e28c9f35689e8b43198/Werkzeug-0.15.1-py2.py3-none-any.whl (328kB)
Collecting MarkupSafe>=0.23 (from Jinja2>=2.10->flask->-r requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094/MarkupSafe-1.1.1.tar.gz
Building wheels for collected packages: MarkupSafe
  Running setup.py bdist_wheel for MarkupSafe: started
  Running setup.py bdist_wheel for MarkupSafe: finished with status 'done'
  Stored in directory: /root/.cache/pip/wheels/f2/aa/04/0edf07a1b8a5f5f1aed7580fffb69ce8972edc16a505916a77
Successfully built MarkupSafe
Installing collected packages: MarkupSafe, Jinja2, click, itsdangerous, Werkzeug, flask
Successfully installed Jinja2-2.10 MarkupSafe-1.1.1 Werkzeug-0.15.1 click-7.0 flask-1.0.2 itsdangerous-1.1.0
You are using pip version 10.0.1, however version 19.0.3 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
Removing intermediate container 35a4d6712b1f
 ---> 5f6226b8ee50
Step 5/6 : EXPOSE 5000
 ---> Running in 67a073f3b2ab
Removing intermediate container 67a073f3b2ab
 ---> 2c97034deb92
Step 6/6 : CMD python3 ./start.py
 ---> Running in f21e9a9352a4
Removing intermediate container f21e9a9352a4
 ---> cdc56289b165
Successfully built cdc56289b165
Successfully tagged hutemai/first:v_1
:~/work/git/docker/test > docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
hutemai/first       v_1                 cdc56289b165        10 seconds ago      97.5MB
python              alpine3.6           37daba746bbe        8 months ago        86.9MB
:~/work/git/docker/test > docker run -d -p 5000:5000 hutemai/first:v_1
54af2aedd1c4856260ff6dec13324cd1179b912c989789a1390f663554f5fb11
:~/work/git/docker/test > docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
54af2aedd1c4        hutemai/first:v_1   "/bin/sh -c 'python3…"   6 seconds ago       Up 5 seconds        0.0.0.0:5000->5000/tcp   tender_dhawan
:~/work/git/docker/test > curl http://127.0.0.1:5000
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Greetings</title>
</head>
<body>
<h1>Hello, user</h1>
<a href="/main">Main page</a>

</body>
</html>:~/work/git/docker/test > curl http://127.0.0.1:5000/main
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main page</title>
</head>
<body>
<h2>Messages</h2>
<form method="post" action="/add_message">
    <input type="text" name="text">
    <input type="text" name="tag">
    <button type="submit">Add message</button>

</form>

<h3>Messages list</h3>


</body>
:~/work/git/docker/test > 

```

