## Homework Assignment 1: Setting up a Basic GitHub Action

Link to the python script: https://github.com/Julie717/github-actions/blob/master/task1/hello.py \
Link to the workflow: https://github.com/Julie717/github-actions/blob/master/.github/workflows/hello.yml \
Link to the action: https://github.com/Julie717/github-actions/actions/runs/12472467091

```yaml
name: Setting up a Basic GitHub Action
on:
  push:
    branches:
      - master
jobs:
  hello:
    runs-on: ubuntu-latest
    steps:
      - name: Check out repository to the runner
        uses: actions/checkout@v4
      - name: Add rights to execute script
        run: chmod +x task1/hello.py
      - name: Run hello.py script
        run: ./task1/hello.py
```

## Homework Assignment 2: Building and Testing with GitHub Actions

Link to the Gradle project on Java: https://github.com/Julie717/github-actions/tree/master/task2 \
Link to the workflow: https://github.com/Julie717/github-actions/blob/master/.github/workflows/task2.yml \
Link to the successful action: https://github.com/Julie717/github-actions/actions/runs/12473471252 \
Link to the action with one falling test: https://github.com/Julie717/github-actions/actions/runs/12473413542

```yaml
name: Building and Testing with GitHub Actions
on:
  push:
jobs:
  build:
    permissions: write-all
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: ./task2
    steps:
      - name: Check out the repository to the runner
        uses: actions/checkout@v4
      - name: Set up JDK 15
        uses: actions/setup-java@v4
        with:
          java-version: '15'
          distribution: 'adopt'
      - name: Setup Gradle
        uses: gradle/gradle-build-action@v3
      - name: Build
        run: gradle build
      - name: Tests
        run: gradle test
      - name: Report test results
        uses: mikepenz/action-junit-report@v5
        if: always()
        with:
          report_paths: '**/build/test-results/test/TEST-*.xml'
          fail-on-failure: true
```
## Homework Assignment 3: Continuous Deployment with GitHub Actions


Link to the static website: https://github.com/Julie717/static-website \
Link to the workflow: https://github.com/Julie717/static-website/tree/master/.github/workflows \
Link to the action: https://github.com/Julie717/static-website/actions/runs/12485909626 \
Link to the website: https://julie717.github.io/static-website/

```yaml
name: Continuous Deployment with GitHub Actions
on:
  push:
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Check out the repository to the runner
        uses: actions/checkout@v4
        with:
          path: build
      - name: Upload static files as artifact
        id: deployment
        uses: actions/upload-pages-artifact@v3
        with:
          path: build
  deploy:
    needs: build
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pages: write
      id-token: write
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
        with:
          deploy_key: ${{ secrets.DEPLOY_PRIVATE_KEY }}
```

For deployment there were generated public and private keys via ssh-keygen. Private key was added to the secrets:
Settings->Secrets and variables->action. Public key was added into deploy keys with write access.

## Homework Assignment 4: Customizing GitHub Actions Workflow

Link to the java app: https://github.com/Julie717/multiple-env \
Link to the workflow: https://github.com/Julie717/multiple-env/blob/development/.github/workflows/deployment.yml \
Link to the action: https://github.com/Julie717/multiple-env/actions \

Java app only print from what environment it was run. Environment passes via environment variable ENV.
In github for each environment was added restriction to deploy only from a branch of corresponding name.

```yaml
name: Customizing GitHub Actions Workflow
on:
  push:
    branches:
      - development
      - staging
      - production
env:
 ENV: ${{ github.ref_name }}
jobs:
  build:
    permissions: write-all
    runs-on: ubuntu-latest
    steps:
      - name: Check out the repository to the runner
        uses: actions/checkout@v4
      - name: Set up JDK 15
        uses: actions/setup-java@v4
        with:
          java-version: '15'
          distribution: 'adopt'
      - name: Setup Gradle
        uses: gradle/gradle-build-action@v3
      - name: Build
        run: gradle build
      - name: Upload artefact
        uses: actions/upload-artifact@v4
        with:
          name: artifact
          path: '**/build/libs/'
          run: chmod +x '**/build/libs/'
  production:
    if: ${{ github.ref_name == 'production' }}
    runs-on: ubuntu-latest
    needs: build
    permissions: write-all
    environment: production
    steps:
      - name: Download artifact
        uses: actions/download-artifact@v4
        with:
          name: artifact
      - name: Run application
        run: |
          java -jar '${{ github.workspace }}/build/libs/multiple-env-1.0-SNAPSHOT.jar'
  staging:
    if: ${{ github.ref_name == 'staging' }}
    runs-on: ubuntu-latest
    needs: build
    permissions: write-all
    environment: staging
    steps:
      - name: Download artifact
        uses: actions/download-artifact@v4
        with:
          name: artifact
      - name: Run application
        run: |
          java -jar '${{ github.workspace }}/build/libs/multiple-env-1.0-SNAPSHOT.jar'
  development:
    if: ${{ github.ref_name == 'development' }}
    runs-on: ubuntu-latest
    needs: build
    permissions: write-all
    environment: development
    steps:
      - name: Download artifact
        uses: actions/download-artifact@v4
        with:
          name: artifact
      - name: Run application
        run: |
          java -jar '${{ github.workspace }}/build/libs/multiple-env-1.0-SNAPSHOT.jar'
```
