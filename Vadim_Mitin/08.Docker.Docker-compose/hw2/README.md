# HW 2

# Build Process

```
docker build -t flask-app:local ./app
```

```
docker run -d --name flask-test -p 8083:5000 flask-app:local
```

# Check

```
http://localhost:8083/health
```

# Push image в Docker Hub

```
docker login
```

```
docker tag flask-app:local vadzimmitsin/go-app:local
```

```
docker push vadzimmitsin/go-app:local
```
# Secrets in GitHub

Create: 
```
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN
SLACK_WEBHOOK_URL
```