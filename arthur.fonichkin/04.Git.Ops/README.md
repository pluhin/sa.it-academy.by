# Git.OPS

### Repository link:
https://github.com/ArthurF-java/git-ops

## First task

### History:
```bash
  378  git init
  380  git remote add origin git@github.com:ArthurF-java/git-ops.git
  382  git checkout -b main
  383  touch README.md
  389  touch hello.js
  405  mkdir -p .github/workflows
  406  vim .github/workflows/hello.yml
  407  cat .github/workflows/hello.yml
  416  touch .gitignore
  417  git status
  418  vim .gitignore
  419  git status
  422  git add --all
  423  git status
  424  git commit -m "check 1 actions"
  425  git push
  426  git status
  428  git add --all
  429  git commit -m "2"
  430  git push
  431  git add --all
  432  git commit -m "3"
  433  git push
  434  history
```

### Yml:
```yaml
name: Hello action
on:
  push:
    branches:
      - main

jobs:
  prepare:
    runs-on: ubuntu-latest
    steps:
      - name: Install nodejs
        run: sudo apt update && sudo apt install nodejs

      - name: Checkout code
        uses: actions/checkout@v3

      - name: Run script
        run: node ./hello.js
```

### Script js:
```javascript
console.log('Hello, GitHub Actions!')
```

## Second task

### Yml
```yaml
    name: Build, Test, and Deploy Spring Boot Application

    on:
      push:
        branches:
          - main

    jobs:
      build-test-deploy:
        runs-on: ubuntu-latest

        steps:
          - name: Checkout repository
            uses: actions/checkout@v4

          - name: Set up JDK 21
            uses: actions/setup-java@v3
            with:
              java-version: '21'
              distribution: 'temurin'
              cache: maven

          - name: Run unit tests
            run: mvn --batch-mode clean test

          - name: Build app
            run: mvn --batch-mode clean package -DskipTests

          - name: Set JAR_FILE and FILE_NAME
            run: |
              JAR_FILE=$(ls target/*.jar | head -n 1)
              echo "Found .jar file: $JAR_FILE"
              echo "JAR_FILE=$JAR_FILE" >> $GITHUB_ENV

          - name: Remove previous app
            run: |
              PID=$(lsof -t -i:$APP_PORT || true)
              if [ -n "$PID" ]; then
                echo "Port $APP_PORT is busy"
                kill -9 $PID
              else
                echo "App port isn't busy"
              fi
            env:
              APP_PORT: ${{ vars.APP_PORT }}

          - name: Run app
            run: |
              java -jar "$JAR_FILE" &

          - name: Check app
            run: |
              echo "checUrl: $CHECK_URL"
              RESPONSE_STATUS=$(curl --write-out "%{http_code}" --silent --output /dev/null "$CHECK_URL")
              echo "response status: $RESPONSE_STATUS"
              if [ "$RESPONSE_STATUS" -eq 200 ]; then
                echo "successful with status = $RESPONSE_STATUS"
              else
                echo "error with status = $RESPONSE_STATUS"
                exit 1
              fi
            env:
              CHECK_URL: ${{ vars.CHECK_URL }}
```

