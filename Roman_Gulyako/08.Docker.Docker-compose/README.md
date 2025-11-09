# Homework Assignment 1: Docker Compose for Application Stacks
### Docker Compose Application Stack

A multi-container application with Flask web server and PostgreSQL database.

### Architecture
- **Web Service**: Flask application (port 5000)
- **Database Service**: PostgreSQL with persistent storage
- **Network**: Internal bridge network for service communication

### Project structure
```text
homework-assignment-1/
├── docker-compose.yml
├── web/
│   ├── Dockerfile
│   ├── app.py
│   └── requirements.txt
└── .env.example
```
### Quick Start

1. Copy `.env.example` to `.env` and set values to connection to database.
2. **Start the application:**
   ```bash
   docker-compose up -d
   ```
3. Check application working:
```bash
curl http://localhost:5000/
curl http://localhost:5000/health
```

# Homework Assignment 2: Docker build automation

### Docker Multi-Stage Build with GitHub Actions
#### Project Overview

This project demonstrates a complete CI/CD pipeline for a Java application using **multi-stage Docker builds** and **GitHub Actions**. The automation includes building a Docker image, pushing it to GitHub Container Registry, and sending Telegram notifications.

**Repository**: [https://github.com/romangulyako/docker-homework](https://github.com/romangulyako/docker-homework)