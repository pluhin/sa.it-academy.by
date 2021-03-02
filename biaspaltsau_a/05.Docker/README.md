# DZ5.Docker
## Dockerfile
```sh
FROM ubuntu:18.04
RUN apt-get update -y && \
    apt-get install -y python-pip python-dev
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
COPY . /app
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
```
## requirements.txt
```sh
Flask==1.1.2
```
## app.py
```sh
from flask import Flask
app = Flask(__name__)
@app.route("/")
def hello():
    return "Hello World from Flask"
if __name__ == "__main__":
    # Only for debugging while developing
    app.run(host='0.0.0.0', debug=True, port=5000)
```

#### build docker build . -t mrpihma/docker:v6
#### start sudo docker run  --rm -p 5000:5000 mrpihma/docker:v6

## Dockerhub/Github integration
![alt text](https://github.com/MsWik/DZ5.Docker/blob/main/2021-03-02_10-07-37.png)
## History of testing commands

![alt text](https://github.com/MsWik/DZ5.Docker/blob/main/2021-03-02_09-51-53.png)
![alt text](https://github.com/MsWik/DZ5.Docker/blob/main/2021-03-02_09-52-31.png)
 