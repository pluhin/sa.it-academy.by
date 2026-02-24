# Assignment 1: Docker Compose for Application Stacks

	##Run containers from compose file

 *Example  Compose file for run generated AI Application (backend and frontend on GO vs database Postgre)
 
```
services:
  postgres:
    image: postgres:16-alpine
    container_name: simplenote-db
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: simplenote
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 5s
      timeout: 5s
      retries: 5

  app:
    build: .
    container_name: simplenote-app
    depends_on:
      postgres:
        condition: service_healthy
    environment:
      DATABASE_URL: postgres://postgres:postgres@postgres:5432/simplenote?sslmode=disable
      PORT: 8080
    ports:
      - "8080:8080"
    restart: unless-stopped

volumes:
  postgres_data:

```


	*logs run

```
D:\github\SimplleNote [main ≡ +3 ~0 -0 !]> docker-compose up --build
time="2026-02-15T21:31:07+03:00" level=warning msg="D:\\github\\SimplleNote\\docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion"
[+] Running 13/13
 ✔ postgres Pulled                                                                                                14.8s
   ✔ 8243369e9866 Pull complete                                                                                    0.8s
   ✔ 6c18ff1f33d0 Pull complete                                                                                    1.3s
   ✔ 162bdab1e0a7 Pull complete                                                                                    0.7s
   ✔ 40aaa75af6ce Pull complete                                                                                   11.5s
   ✔ ebff7b0ec73e Pull complete                                                                                    0.5s
   ✔ 5ffb427686b6 Pull complete                                                                                    0.7s
   ✔ c02179436571 Pull complete                                                                                    0.5s
   ✔ 630177b00352 Pull complete                                                                                    1.2s
   ✔ b4403f29458a Pull complete                                                                                   11.4s
   ✔ 13e46e455d3b Pull complete                                                                                    0.5s
   ✔ 1eaa8a41a070 Download complete                                                                                0.0s
   ✔ 8c68e283f362 Download complete                                                                                0.0s
[+] Building 25.4s (18/18) FINISHED
 => [internal] load local bake definitions                                                                         0.0s
 => => reading from stdin 496B                                                                                     0.0s
 => [internal] load build definition from Dockerfile                                                               0.2s
 => => transferring dockerfile: 325B                                                                               0.0s
 => [internal] load metadata for docker.io/library/alpine:latest                                                   2.0s
 => [internal] load metadata for docker.io/library/golang:1.21-alpine                                              2.1s
 => [internal] load .dockerignore                                                                                  0.2s
 => => transferring context: 128B                                                                                  0.0s
 => [builder 1/6] FROM docker.io/library/golang:1.21-alpine@sha256:2414035b086e3c42b99654c8b26e6f5b1b1598080d65f  10.3s
 => => resolve docker.io/library/golang:1.21-alpine@sha256:2414035b086e3c42b99654c8b26e6f5b1b1598080d65fd03c7f499  0.2s
 => => sha256:4579008f8500d429ec007d092329191009711942d9380d060c8d9bd24c0c352c 126B / 126B                         0.3s
 => => sha256:54bf7053e2d96c2c7f4637ad7580bd64345b3c9fabb163e1fdb8894aea8a9af0 67.01MB / 67.01MB                   7.0s
 => => sha256:41db7493d1c6f3f26428d119962e3862c14a9e20bb0b8fefc36e7282d015d099 290.89kB / 290.89kB                 0.6s
 => => sha256:c6a83fedfae6ed8a4f5f7cbb6a7b6f1c1ec3d86fea8cb9e5ba2e5e6673fde9f6 3.62MB / 3.62MB                     1.4s
 => => extracting sha256:c6a83fedfae6ed8a4f5f7cbb6a7b6f1c1ec3d86fea8cb9e5ba2e5e6673fde9f6                          0.1s
 => => extracting sha256:41db7493d1c6f3f26428d119962e3862c14a9e20bb0b8fefc36e7282d015d099                          0.1s
 => => extracting sha256:54bf7053e2d96c2c7f4637ad7580bd64345b3c9fabb163e1fdb8894aea8a9af0                          2.3s
 => => extracting sha256:4579008f8500d429ec007d092329191009711942d9380d060c8d9bd24c0c352c                          0.1s
 => => extracting sha256:4f4fb700ef54461cfa02571ae0db9a0dc1e0cdb5577484a6d75e68dc38e8acc1                          0.1s
 => [stage-1 1/4] FROM docker.io/library/alpine:latest@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20ac  0.5s
 => => resolve docker.io/library/alpine:latest@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c  0.2s
 => [internal] load build context                                                                                  0.4s
 => => transferring context: 9.26kB                                                                                0.0s
 => [stage-1 2/4] RUN apk --no-cache add ca-certificates                                                           6.9s
 => [stage-1 3/4] WORKDIR /root/                                                                                   0.1s
 => [builder 2/6] WORKDIR /app                                                                                     1.5s
 => [builder 3/6] COPY go.mod go.sum ./                                                                            0.1s
 => [builder 4/6] RUN go mod download                                                                              0.5s
 => [builder 5/6] COPY . .                                                                                         0.1s
 => [builder 6/6] RUN go build -o simplenote .                                                                     7.8s
 => [stage-1 4/4] COPY --from=builder /app/simplenote .                                                            0.4s
 => exporting to image                                                                                             1.4s
 => => exporting layers                                                                                            1.0s
 => => exporting manifest sha256:b317bf2fca39720b01cab164b7b8df1f865651b5292b4cb17235d92e956738d2                  0.0s
 => => exporting config sha256:1aa3ce3ab7b8e2d7b9f7861d95a8bc35571a292e984f224b152a506196e600ba                    0.0s
 => => exporting attestation manifest sha256:8eb612b9bd34954419090d179cacda66bdf3f908d8c72d6628024d0e54a4ebd2      0.0s
 => => exporting manifest list sha256:4300331390421fe977cf547c941fb84e7cac4591cd4e1ca8d61fae68965830f9             0.0s
 => => naming to docker.io/library/simpllenote-app:latest                                                          0.0s
 => => unpacking to docker.io/library/simpllenote-app:latest                                                       0.2s
 => resolving provenance for metadata file                                                                         0.0s
[+] Running 5/5
 ✔ simpllenote-app                   Built                                                                         0.0s
 ✔ Network simpllenote_default       Created                                                                       0.1s
 ✔ Volume simpllenote_postgres_data  Created                                                                       0.0s
 ✔ Container simplenote-db           Created                                                                       0.3s
 ✔ Container simplenote-app          Created                                                                       0.2s
Attaching to simplenote-app, simplenote-db
simplenote-db  | The files belonging to this database system will be owned by user "postgres".
simplenote-db  | This user must also own the server process.
simplenote-db  |
simplenote-db  | The database cluster will be initialized with locale "en_US.utf8".
simplenote-db  | The default database encoding has accordingly been set to "UTF8".
simplenote-db  | The default text search configuration will be set to "english".
simplenote-db  |
simplenote-db  | Data page checksums are disabled.
simplenote-db  |
simplenote-db  | fixing permissions on existing directory /var/lib/postgresql/data ... ok
simplenote-db  | creating subdirectories ... ok
simplenote-db  | selecting dynamic shared memory implementation ... posix
simplenote-db  | selecting default max_connections ... 100
simplenote-db  | selecting default shared_buffers ... 128MB
simplenote-db  | selecting default time zone ... UTC
simplenote-db  | creating configuration files ... ok
simplenote-db  | running bootstrap script ... ok
simplenote-db  | sh: locale: not found
simplenote-db  | 2026-02-15 18:31:49.813 UTC [35] WARNING:  no usable system locales were found
simplenote-db  | performing post-bootstrap initialization ... ok
simplenote-db  | initdb: warning: enabling "trust" authentication for local connections
simplenote-db  | initdb: hint: You can change this by editing pg_hba.conf or using the option -A, or --auth-local and --auth-host, the next time you run initdb.
simplenote-db  | syncing data to disk ... ok
simplenote-db  |
simplenote-db  |
simplenote-db  | Success. You can now start the database server using:
simplenote-db  |
simplenote-db  |     pg_ctl -D /var/lib/postgresql/data -l logfile start
simplenote-db  |
simplenote-db  | waiting for server to start....2026-02-15 18:31:50.494 UTC [41] LOG:  starting PostgreSQL 16.12 on x86_64-pc-linux-musl, compiled by gcc (Alpine 15.2.0) 15.2.0, 64-bit
simplenote-db  | 2026-02-15 18:31:50.497 UTC [41] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
simplenote-db  | 2026-02-15 18:31:50.513 UTC [44] LOG:  database system was shut down at 2026-02-15 18:31:50 UTC
simplenote-db  | 2026-02-15 18:31:50.528 UTC [41] LOG:  database system is ready to accept connections
simplenote-db  |  done
simplenote-db  | server started
simplenote-db  | CREATE DATABASE
simplenote-db  |
simplenote-db  |
simplenote-db  | /usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/*
simplenote-db  |
simplenote-db  | waiting for server to shut down....2026-02-15 18:31:50.669 UTC [41] LOG:  received fast shutdown request
simplenote-db  | 2026-02-15 18:31:50.676 UTC [41] LOG:  aborting any active transactions
simplenote-db  | 2026-02-15 18:31:50.678 UTC [41] LOG:  background worker "logical replication launcher" (PID 47) exited with exit code 1
simplenote-db  | 2026-02-15 18:31:50.678 UTC [42] LOG:  shutting down
simplenote-db  | 2026-02-15 18:31:50.689 UTC [42] LOG:  checkpoint starting: shutdown immediate
simplenote-db  | 2026-02-15 18:31:50.894 UTC [42] LOG:  checkpoint complete: wrote 926 buffers (5.7%); 0 WAL file(s) added, 0 removed, 0 recycled; write=0.020 s, sync=0.162 s, total=0.216 s; sync files=301, longest=0.092 s, average=0.001 s; distance=4272 kB, estimate=4272 kB; lsn=0/191E938, redo lsn=0/191E938
simplenote-db  | 2026-02-15 18:31:50.898 UTC [41] LOG:  database system is shut down
simplenote-db  |  done
simplenote-db  | server stopped
simplenote-db  |
simplenote-db  | PostgreSQL init process complete; ready for start up.
simplenote-db  |
simplenote-db  | 2026-02-15 18:31:51.016 UTC [1] LOG:  starting PostgreSQL 16.12 on x86_64-pc-linux-musl, compiled by gcc (Alpine 15.2.0) 15.2.0, 64-bit
simplenote-db  | 2026-02-15 18:31:51.016 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
simplenote-db  | 2026-02-15 18:31:51.016 UTC [1] LOG:  listening on IPv6 address "::", port 5432
simplenote-db  | 2026-02-15 18:31:51.040 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
simplenote-db  | 2026-02-15 18:31:51.054 UTC [57] LOG:  database system was shut down at 2026-02-15 18:31:50 UTC
simplenote-db  | 2026-02-15 18:31:51.068 UTC [1] LOG:  database system is ready to accept connections
simplenote-app  | 2026/02/15 18:31:55 listen :8080
simplenote-db   | 2026-02-15 19:23:35.483 UTC [55] LOG:  checkpoint starting: time
simplenote-db   | 2026-02-15 19:23:45.085 UTC [55] LOG:  checkpoint complete: wrote 97 buffers (0.6%); 0 WAL file(s) added, 0 removed, 0 recycled; write=9.502 s, sync=0.033 s, total=9.602 s; sync files=52, longest=0.017 s, average=0.001 s; distance=429 kB, estimate=429 kB; lsn=0/198A0C8, redo lsn=0/198A090

```	



	*curl 127.0.0.1:8080



``` 
<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Заметки</title>
  <style>
    * { box-sizing: border-box; }
    body { font-family: system-ui, sans-serif; max-width: 560px; margin: 2rem auto; padding: 0 1rem; }
    h1 { margin-top: 0; }
    label { display: block; margin-bottom: 0.25rem; font-weight: 600; }
    input, textarea { width: 100%; padding: 0.5rem; margin-bottom: 1rem; border: 1px solid #ccc; border-radius: 6px; }
    textarea { min-height: 120px; resize: vertical; }
    .btns { display: flex; gap: 0.5rem; flex-wrap: wrap; margin-bottom: 1.5rem; }
    button { padding: 0.5rem 1rem; border-radius: 6px; border: 1px solid #333; cursor: pointer; font-size: 1rem; }
    button.primary { background: #333; color: #fff; border-color: #333; }
    button.secondary { background: #fff; }
    button:hover { opacity: 0.9; }
    #notesList { margin-top: 1.5rem; }
    .note { padding: 0.75rem; border: 1px solid #ddd; border-radius: 6px; margin-bottom: 0.5rem; background: #fafafa; }
    .note h3 { margin: 0 0 0.25rem 0; font-size: 1rem; }
    .note .meta { font-size: 0.8rem; color: #666; margin-bottom: 0.25rem; }
    .note .body { white-space: pre-wrap; font-size: 0.95rem; }
    .hidden { display: none; }
    .error { color: #c00; margin-top: 0.5rem; }
  </style>
</head>
<body>
  <h1>Заметки</h1>
  <form id="form">
    <label for="title">Заголовок</label>
    <input type="text" id="title" name="title" placeholder="Заголовок заметки">
    <label for="body">Текст</label>
    <textarea id="body" name="body" placeholder="Текст заметки"></textarea>
    <div class="btns">
      <button type="submit" class="primary">Сохранить</button>
      <button type="button" id="cancelBtn">Отменить</button>
      <button type="button" id="viewBtn">Посмотреть заметки</button>
    </div>
  </form>
  <p id="error" class="error hidden"></p>
  <section id="notesList" class="hidden">
    <h2>Список заметок</h2>
    <div id="notes"></div>
  </section>

  <script>
    const form = document.getElementById('form');
    const titleIn = document.getElementById('title');
    const bodyIn = document.getElementById('body');
    const cancelBtn = document.getElementById('cancelBtn');
    const viewBtn = document.getElementById('viewBtn');
    const notesList = document.getElementById('notesList');
    const notesContainer = document.getElementById('notes');
    const errEl = document.getElementById('error');

    function showErr(msg) {
      errEl.textContent = msg || '';
      errEl.classList.toggle('hidden', !msg);
    }

    form.addEventListener('submit', async (e) => {
      e.preventDefault();
      showErr('');
      const title = titleIn.value.trim();
      const body = bodyIn.value.trim();
      if (!title && !body) {
        showErr('Введите заголовок или текст.');
        return;
      }
      try {
        const res = await fetch('/api/notes', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ title, body })
        });
        if (!res.ok) throw new Error(await res.text());
        const data = await res.json();
        titleIn.value = '';
        bodyIn.value = '';
        showErr('');
        if (notesList.classList.contains('hidden') === false) loadNotes();
      } catch (err) {
        showErr(err.message || 'Ошибка сохранения');
      }
    });

    cancelBtn.addEventListener('click', () => {
      titleIn.value = '';
      bodyIn.value = '';
      showErr('');
    });

    async function loadNotes() {
      const res = await fetch('/api/notes');
      if (!res.ok) { notesContainer.innerHTML = '<p class="error">Не удалось загрузить заметки</p>'; return; }
      const notes = await res.json();
      notesList.classList.remove('hidden');
      if (notes.length === 0) {
        notesContainer.innerHTML = '<p>Нет заметок.</p>';
        return;
      }
      notesContainer.innerHTML = notes.map(n => {
        const d = new Date(n.created_at).toLocaleString('ru');
        return `<div class="note"><div class="meta">#${n.id} · ${d}</div><h3>${escapeHtml(n.title || '(без заголовка)')}</h3><div class="body">${escapeHtml(n.body)}</div></div>`;
      }).join('');
    }

    function escapeHtml(s) {
      const div = document.createElement('div');
      div.textContent = s;
      return div.innerHTML;
    }

    viewBtn.addEventListener('click', () => {
      loadNotes();
    });
  </script>
</body>
</html>



# Assignment 2: Docker build automation (github action)

 *Repo With Project ( compiled up)*
[poteenoka/SimplleNote: writeNotesIntoDB](https://github.com/poteenoka/SimplleNote)

Project tree
``` cmd
tree /f
Структура папок тома (D)
Серийный номер тома: C4FE-EAC3
│   .dockerignore
│   .gitignore
│   docker-compose.ci.yml
│   docker-compose.yml
│   Dockerfile
│   go.mod
│   go.sum
│   main.go
│   readme.md
│
├───.github
│   └───workflows
│           build-and-notify.yml
│
└───static
        index.html
```

*dockerCompouse file*
```yaml

services:
  postgres:
    image: postgres:16-alpine
    container_name: simplenote-db
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: simplenote
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 5s
      timeout: 5s
      retries: 5

  app:
    build: .
    container_name: simplenote-app
    depends_on:
      postgres:
        condition: service_healthy
    environment:
      DATABASE_URL: postgres://postgres:postgres@postgres:5432/simplenote?sslmode=disable
      PORT: 8080
    ports:
      - "8080:8080"
    restart: unless-stopped

volumes:
  postgres_data:

```

*githubWorkflowFile*

``` yaml
name: Build, push and notify

on:
  push:
    branches: [main]

env:
  IMAGE_NAME: simplenote

jobs:
  build-push-verify:
    runs-on: ubuntu-latest
    env:
      DOCKER_IMAGE: ${{ secrets.DOCKERHUB_USERNAME }}/simplenote:${{ github.sha }}
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}

      - name: Build and push
        uses: docker/build-push-action@v6
        with:
          context: .
          push: true
          tags: |
            ${{ secrets.DOCKERHUB_USERNAME }}/${{ env.IMAGE_NAME }}:latest
            ${{ secrets.DOCKERHUB_USERNAME }}/${{ env.IMAGE_NAME }}:sha-${{ github.sha }}
        id: build

      - name: Run stack
        env:
          DOCKER_IMAGE: ${{ secrets.DOCKERHUB_USERNAME }}/${{ env.IMAGE_NAME }}:latest
        run: |
          docker compose -f docker-compose.ci.yml up -d

      - name: Wait for app
        run: sleep 10

      - name: Verify service
        id: verify
        run: curl -sf http://localhost:8080/ -o /dev/null || (echo "App not responding" && exit 1)

      - name: Cleanup
        if: always()
        run: |
          docker compose -f docker-compose.ci.yml down -v

      - name: Notify Slack
        if: always()
        env:
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_URL }}
          BUILD_SUCCESS: ${{ steps.verify.outcome == 'success' }}
          RUN_URL: ${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}
          BRANCH: ${{ github.ref_name }}
        run: |
          if [ "$BUILD_SUCCESS" = "true" ]; then STATUS="succeeded"; else STATUS="failed"; fi
          payload=$(printf '{"text":"SimplleNote build %s | branch: %s | %s"}' "$STATUS" "$BRANCH" "$RUN_URL")
          curl -sS -X POST -H 'Content-type: application/json' --data "$payload" "$SLACK_WEBHOOK"

```

*Rtsult githubAction*

![[Attachments/Pasted20260216113952.png]]


*secrets*

![[Attachments/Pasted20260216114129.png]]


*dockerhubImage*
From DockerHub
```  
docker pull poteenoka/simplenote:sha-5b878b05538da6f3fe4015321c8d051041b23c98
```

*Slack notification thue WebHook*

![[Attachments/Pasted20260216114332.png]]