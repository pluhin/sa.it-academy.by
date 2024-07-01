## 08. Docker. Docker compose

---

### Docker Compose for Application Stacks

---

1. Select a combination of services (e.g., web app, database) to create a multi-container application.

- Installing docker-compose:

```bash
docker compose version
```

- Output:

```
Docker Compose version v2.27.1
```

```bash
cd
mkdir 08.Docker.Docker_compose
cd 08.Docker.Docker_compose/
```

2. Create a Docker Compose YAML file to define the services, networks, and volumes:

```bash
nano docker-compose.yml
```
```yml
version: '3.3'

services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root_secret
      MYSQL_DATABASE: drupal
      MYSQL_USER: drupal
      MYSQL_PASSWORD: drupal
  drupal:
    depends_on:
      - db
    image: drupal:latest
    ports:
      - "8000:80"
    volumes:
      - drupal_modules:/var/www/html/modules
      - drupal_profiles:/var/www/html/profiles
      - drupal_themes:/var/www/html/themes
      - drupal_sites:/var/www/html/sites
    restart: always
volumes:
  db_data:
  drupal_modules:
  drupal_profiles:
  drupal_themes:
  drupal_sites:
```

3. Configure environment variables and dependencies between services.

4. Run the application stack using the docker-compose up command:

```bash
docker-compose up
```

5. Access the application through a web browser or API client:

```bash
curl http://localhost:8080
```

6. Document the Docker Compose file structure and the steps to deploy the application stack.


---

### Building a Docker Image with Dockerfile

---

1. Choose a programming language (e.g., Java, Go, Python) and a sample application

```pyton

```

2. Write a multi-stage Dockerfile to build the application with different stages for build and runtime.

- Dockerfile

```bash
FROM python:3.9

WORKDIR /app

COPY app/app.py .

EXPOSE 5000

CMD ["python", "app.py"]
```

- build.yaml

```yaml
name: Publish Docker image

on:
  release:
    types: [published]
  push:
    branches:
      - "master"

jobs:
  push_to_registries:
    name: Push Docker image
    runs-on: ubuntu-latest
    permissions:
      packages: write
      contents: read
    steps:
      - name: Check out the repo
        uses: actions/checkout@v2

      - name: Log in to the Container registry
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.CR_TOKEN }}

      - name: Build and push Docker images
        uses: docker/build-push-action@v2
        with:
          context: .
          push: true
          tags: ghcr.io/vitaliyshvedov/docker_build:1
```

3. Compile or package the application in the build stage.
4. Copy the compiled application into the runtime stage and configure it to run.
5. Build the multi-stage Docker image and run a container based on it.
6. Push/publish image to docker hub and/or github container register.

[Github HW_08.Docker.Docker-compose_Task-2](https://github.com/Patsa-Vatsa/HW_08.Docker.Docker-compose_Task-2)

7. Slack notification when build failed/success with image name/tag.
8. Document the Dockerfile structure, the build process, and the advantages of multi-stage builds.