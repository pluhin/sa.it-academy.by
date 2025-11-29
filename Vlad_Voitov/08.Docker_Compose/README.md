# Docker Homework (Compose + CI multi-stage)

Repo: https://github.com/neroseccess/08.Docker_compose

## HW1: Docker Compose stack
Folder: `Homework_Assignment_1/`  
Stack: `web` (Flask) + `db` (PostgreSQL), with network + volume + env vars.

Run:
```bash
cd Homework_Assignment_1
docker compose up -d --build

Test

curl http://localhost:5000/
curl http://localhost:5000/health
curl http://localhost:5000/db

Stop

docker compose down


