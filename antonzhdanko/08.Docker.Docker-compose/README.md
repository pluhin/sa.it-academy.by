# 08. Docker Compose

## Repositories and workflow

- Application repository:
  <https://github.com/antonzhdanko/github-actions-homework/tree/main/docker-compose-app>
- GitHub Actions workflow:
  <https://github.com/antonzhdanko/github-actions-homework/blob/main/.github/workflows/docker-publish.yml>
- Successful workflow run:
  <https://github.com/antonzhdanko/github-actions-homework/actions/runs/29163129265>
- Container image: `ghcr.io/antonzhdanko/docker-compose-homework`

## Objective

The project demonstrates:

- a multi-container application with Docker Compose;
- service networking and health checks;
- persistent database storage;
- a multi-stage Dockerfile;
- automated build, test and publication to GHCR;
- Slack notification configured through a GitHub repository secret.

## Architecture

```text
browser/curl
    |
    | localhost:8080
    v
web service (Flask + Gunicorn, non-root UID 10001)
    |
    | Compose private network, hostname: db, port: 5432
    v
PostgreSQL service
    |
    v
postgres_data named volume
```

The PostgreSQL port is not published to the host. Only the web service is
available externally. Both services are attached to the explicitly declared
`app_network` bridge network.

## Project structure

```text
08.Docker.Docker-compose/
├── .dockerignore
├── .env.example
├── Dockerfile
├── README.md
├── app.py
├── compose.yaml
├── docker-publish.yml
└── requirements.txt
```

## Compose services

### Database

The `db` service uses `postgres:17-alpine` and stores its data in the
`postgres_data` named volume.

The health check runs:

```text
pg_isready -U ${POSTGRES_USER} -d ${POSTGRES_DB}
```

### Web application

The `web` service is built from the multi-stage Dockerfile. It waits for the
database health check before starting:

```yaml
depends_on:
  db:
    condition: service_healthy
```

The application connects to the database using the Compose service name `db`.
Compose provides DNS resolution automatically inside the project network.

The `/` endpoint increments and returns a counter stored in PostgreSQL. The
`/health` endpoint checks that the database accepts a query. The web service
health check calls this endpoint, so `docker compose up --wait` returns only
after both PostgreSQL and the HTTP application are ready.

## Multi-stage Dockerfile

The `builder` stage downloads dependencies and builds Python wheel artifacts:

```dockerfile
FROM python:3.13-slim AS builder

WORKDIR /build
COPY requirements.txt .
RUN pip wheel --no-cache-dir --wheel-dir /wheels --requirement requirements.txt
```

The `runtime` stage copies only the wheels, installs them and starts the
application as an unprivileged user:

```dockerfile
FROM python:3.13-slim AS runtime

COPY --from=builder /wheels /wheels
RUN pip install --no-cache-dir /wheels/* \
    && rm -rf /wheels \
    && useradd --create-home --uid 10001 appuser

USER appuser
```

Build tools and temporary wheel files do not remain in the final image.

## Local validation

Validate the Compose file:

```bash
docker compose config --quiet
```

Build and start both services:

```bash
docker compose up --detach --build --wait
docker compose ps
```

Result:

```text
NAME                       SERVICE   STATUS                  PORTS
docker-compose-app-db-1    db        Up (healthy)            5432/tcp
docker-compose-app-web-1   web       Up (healthy)            0.0.0.0:8080->8080/tcp
```

Test the application:

```bash
curl --fail http://localhost:8080/
curl --fail http://localhost:8080/
curl --fail http://localhost:8080/health
```

Results:

```json
{"message":"Docker Compose homework","visits":1}
{"message":"Docker Compose homework","visits":2}
{"database":"connected","status":"ok"}
```

Verify the non-root user and service DNS:

```bash
docker compose exec --no-TTY web id
docker compose exec --no-TTY web getent hosts db
```

Results:

```text
uid=10001(appuser) gid=10001(appuser) groups=10001(appuser)
172.18.0.2      db
```

## Persistence test

Containers were removed without deleting the volume:

```bash
docker compose down
docker compose up --detach --wait
curl --fail http://localhost:8080/
```

Result:

```json
{"message":"Docker Compose homework","visits":3}
```

PostgreSQL also reported:

```text
PostgreSQL Database directory appears to contain a database; Skipping initialization
```

The counter continued from `2` to `3`, proving that data survived container
recreation in the named volume.

Clean up containers, network and test data:

```bash
docker compose down --volumes --remove-orphans
```

## GitHub Actions

The workflow is triggered by pushes and pull requests affecting the application,
and can also be started manually.

Pipeline steps:

1. check out the repository;
2. validate the Compose file;
3. build and start the Compose stack;
4. test `/health` and `/`;
5. remove test containers and volumes even after a failure;
6. configure Buildx;
7. log in to GHCR using the built-in `GITHUB_TOKEN`;
8. build and publish the runtime image;
9. send the final status, image name and commit tag to Slack.

The successful run published two tags:

```text
ghcr.io/antonzhdanko/docker-compose-homework:<commit-sha>
ghcr.io/antonzhdanko/docker-compose-homework:latest
```

The commit SHA tag is immutable and identifies the exact source revision.

## Secrets

The workflow uses:

- `GITHUB_TOKEN` — automatically provided by GitHub for GHCR publication;
- `SLACK_WEBHOOK` — repository secret for notifications.

No real password or webhook is stored in the repository. `.env.example` leaves
the password empty. A real local `.env` is ignored by Git and Docker.

At the time of the initial successful workflow run, `SLACK_WEBHOOK` had not yet
been added, so the notification step completed by reporting that notification
was skipped. After the secret is configured, the workflow must be run again and
the received Slack message should be added to the homework evidence.

## Conclusion

This homework implements a complete multi-container stack, persistent storage,
service readiness, a multi-stage non-root application image and CI publication
to GitHub Container Registry.
