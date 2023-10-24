# Anton Ivanov HW 7

## Installing Docker:

```bash
sudo apt-get update sudo apt-get install ca-certificates
 curl gnupg sudo install -m 0755 -d /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg sudo chmod a+r /etc/apt/keyrings/docker.gpg
 # Add the repository to Apt sources: 
echo \ "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \ "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \ sudo tee /etc/apt/sources.list.d/docker.list > /dev/null sudo apt-get update

apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

groupadd docker
usermod -aG docker $USER
```

## Command:

```bash
docker run hello-world

docker ps –a
docker images
```

## Create app.py:

```py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(debug=True)
```

## Create requirements.txt:

```
Flask=2.1.3
```

## Create Dockerfile:

```bash
FROM python:3.9
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["python3", "app.py", "--host=0.0.0.0"]
```

## Build image:

```
docker build -t myapp:v10 -f Dockerfile .
```

## Run image:

```
docker run -p 5000:5000 myapp:v10
``` 

### History:

```
 53  mkdir 07.Docker
   54  ls
   55  cd 07.Docker/
   56  sudo apt-update
   57  sudo apt update
   58  cd ~
   59  sudo apt-get update
   60  sudo apt-get install ca-certificates curl gnupg
   61  sudo install -m 0755 -d /etc/apt/keyrings
   62  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   63  sudo chmod a+r /etc/apt/keyrings/docker.gpg
   64  echo   "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
   65    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   66  sudo apt-get update
   67  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   68  service docker status
   69  rw .git
   70  cd 07.Docker/
   71  ls -la
   72  cd myapp/
   73  docker images
   74  docker run myapp:2
   75  flask app.py
   76  flask --help
   77  flask -a app.py
   78  ls
   79  python3 app.py
   80  flask -a app.py
   81  flask --help
   82  python3 app.py
   83  flask app.py
   84  python3 app.py
   85  python3 -t app.py
   86  service python3 status
   87  nano app.py
   88  ls
   89  rm app
   90  ls
   91  python3 -m venv venv
   92  source venv/bin/activate
   93  python3 app.py
   94  pip install flask
   95  export FLASK_APP=app
   96  export FLASK_ENV=development
   97  flask run
   98  nano requirements.txt
   99  nano app.py
  100  nano Dockerfile
  101  docker build -t myapp:v3
  102  docker build -t myapp
  103  docker build -t myapp:4 -f Dockerfile .
  104  nano Dockerfile
  105  docker build -t myapp:5 -f Dockerfile .
  106  docker run -p 5000:5000 myapp:5
  107  docker images
  108  nano Dockerfile
  109  curl http://127.0.0.1:5000
  110  python app.py
  111  curl http://127.0.0.1:5000
  112  curl http://127.0.0.1:5000/
  113  curl http://127.0.0.1:5000
  114  docker run -p 5000:5000 myapp:5
  115  docker build -t myapp:6 -f Dockerfile .
  116  ls
  117  cd 07.Docker/
  118  docker build -t myapp:6 -f Dockerfile .
  119  docker run -p 5000:5000 myapp:6
  120  docker run -t -p 5000:5000 myapp:6
  121  docker images
  122  docker run myapp:6
  123  docker run -p 5000:5000 myapp:6
  124  python app.py
  125  python3 app.py
  126  cd myapp/
  127  docker build -t myapp:7 -f Dockerfile .
  128  docker run -p 5000:5000 myapp:7
  129  cmd python3 app.py
  130  python3 app.py
  131  docker run -p 5000:5000 myapp:7
  132  nano Dockerfile
  133  docker run -p 5000:5000 myapp:7
  134  docker build -t myapp:8 -f Dockerfile .
  135  docker run -p 5000:5000 myapp:8
  136  nano Dockerfile
  137  docker build -t myapp:v9 -f Dockerfile .
  138  docker run -p 5000:5000 myapp:8
  139  docker run -p 5000:5000 myapp:9
  140  docker run -p 5000:5000 myapp:v9
  141  docker ps
  142  docker ps -a
  143  docker run -p 5000:5000 myapp:v9
  144  docker run -p 5000:5000 myapp:v9 -е
  145  docker run -p 5000:5000 myapp:v9 -t
  146  docker run -p 5000:5000 myapp:v9
  147  nano app.py
  148  docker build -t myapp:v10 -f Dockerfile .
  149  docker run -p 5000:5000 myapp:v10
```


