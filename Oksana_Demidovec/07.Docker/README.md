# 07. Docker

## Docker file

```
# API (port) listener
FROM python:3.11
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
ENV PORT=8000
EXPOSE $PORT
CMD ["python", "app.py"]
```
### requirements.txt
```
Flask==2.2.3
```
### app.py
```python
from flask import Flask
import os
app = Flask(__name__)
node_name = os.uname().nodename
@app.route('/')
def hello_world():
    return f'Hello, World from node {node_name}!'
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 8000)))
```
## Run image as container
```bash
sudo docker build -t my-python-app .
sudo docker run -d -p 8000:8000 my-python-app
curl http://localhost:8000/ | tee -a node.log
```
### node.log
```
Hello, World from node 6e20a1f04890!
```
