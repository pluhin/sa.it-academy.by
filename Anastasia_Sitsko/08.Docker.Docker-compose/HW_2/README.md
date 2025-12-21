# Project Structure

```
.
├── main.go
├── go.mod
├── Dockerfile
└── .github/
    └── workflows/
        └── docker.yml
```

# Build Process

```
docker build -t go-app:1.0 .
```

```
docker run -d -p 8080:8080 go-app:1.0
```

# Check

```
http://localhost:8080
```

![alt text](<image-1.png>)

# Push image в Docker Hub

```
docker login
```

```
docker tag go-app:1.0 anastasiaakimova/go-app:1.0
```

```
docker push anastasiaakimova/go-app:1.0
```
# Secrets in GitHub

```
Settings → Secrets and variables → Actions → New repository secret
```
Create: 
```
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN
SLACK_WEBHOOK
```