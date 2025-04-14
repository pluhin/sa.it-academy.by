### 08. Docker. Docker compose
#### Homework Assignment 1: Docker Compose for Application Stacks
Installed Docker Desktop 4.40.0
Created project folder 08.Docker.Docker-compose locally on my computer
Created docker-compose.yml

```yaml
version: '3.8'

services:
  web:
    build: .
    ports:
      - "5000:5000"
    depends_on:
      - db
    environment:
      - DATABASE_URL=postgresql://[SECRETS]@db:5432/mydatabase
    volumes:
      - .:/app
    command: python app.py

  db:
    image: postgres:13
    environment:
      POSTGRES_USER: [SECRETS]
      POSTGRES_PASSWORD: [SECRETS]
      POSTGRES_DB: [SECRETS]
    volumes:
      - db_data:/var/lib/postgresql/data

volumes:
  db_data:
```

Created the file app.py
```python
from flask import Flask
import os
import psycopg2

app = Flask(__name__)

DATABASE_URL = os.getenv('DATABASE_URL')

@app.route('/')
def hello():
    conn = psycopg2.connect(DATABASE_URL)
    cur = conn.cursor()
    cur.execute("SELECT version();")
    db_version = cur.fetchone()
    cur.close()
    conn.close()
    return f"Hello, World! Connected to {db_version[0]}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

Created the file requirements.txt
```bash
Flask==2.3.2
Werkzeug==2.3.4
psycopg2-binary==2.9.1
```
The Dockerfile is provided separately.

Launch via command:
```bash
docker-compose up --build
```
In my browser, I type localhost:5000 and I see:
```bash
Hello, World! Connected to PostgreSQL 13.20 (Debian 13.20-1.pgdg120+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
```
#### Homework Assignment 2: Docker build automation (github action)
Created the 08-Docker-Docker-compose repository
Created locally the folder 08-Docker-Docker-compose
I copied the content from the last homework assignment into it
Created a .github/workflows folder and a docker-build.yml file
The docker-build.yml file is provided separately.

Set up secrets in GitHub for Docker (username and password) and Slack webhook
Added files
Made commit
Push to my repository
Looking at Actions, I see that everything went well (google drive images):

Slack: [result](https://drive.google.com/file/d/1TWjsbJP2ANO91tu4c_tGShaEMbyUsauJ/view?usp=sharing "result")
Docker: [result](https://drive.google.com/file/d/1GwX0PfcOh0TGKWtsSX_7PCpLp4uGs1TS/view?usp=sharing "result")
GitHub Actions: [result](https://drive.google.com/file/d/1EHvKabWPIMcJ4y1Kg9mJYvuJ-ECwWZU8/view?usp=sharing "result")
