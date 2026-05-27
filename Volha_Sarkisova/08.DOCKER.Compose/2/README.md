			
**Homework Assignment 2: Docker build automation (github action)
** Ñòðóêòóðà ïðîåêòà
2/
+-- app/
¦   L-- main.py
+-- requirements.txt
+-- Dockerfile
+-- docker-compose.yml
+-- .github/
¦   +-- workflows/
¦   ¦   L-- docker-build.yml
L-- README.md  
  
  
**kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/08.DOCKER.Compose/2$ docker build -t my-python-app .

		[+] Building 29.6s (15/15) FINISHED                                                                      docker:default
		 => [internal] load build definition from Dockerfile                                                               0.0s
		 => => transferring dockerfile: 1.45kB                                                                             0.0s
		 => [internal] load metadata for docker.io/library/python:3.11-slim                                                1.0s
		 => [internal] load .dockerignore                                                                                  0.0s
		 => => transferring context: 2B                                                                                    0.0s
		 => [internal] load build context                                                                                  0.1s
		 => => transferring context: 408B                                                                                  0.0s
		 => CACHED [builder 1/6] FROM docker.io/library/python:3.11-slim@sha256:a3ab0b966bc4e91546a033e22093cb84090897948  0.1s
		 => => resolve docker.io/library/python:3.11-slim@sha256:a3ab0b966bc4e91546a033e22093cb840908979487a9fc0e6e382957  0.1s
		 => [builder 2/6] WORKDIR /build                                                                                   0.2s
		 => [runtime 2/5] RUN addgroup --system app && adduser --system --group app                                        0.6s
		 => [builder 3/6] RUN apt-get update && apt-get install -y --no-install-recommends     gcc     && rm -rf /var/li  12.7s
		 => [builder 4/6] COPY requirements.txt .                                                                          0.1s
		 => [builder 5/6] RUN python -m venv /opt/venv                                                                     2.9s
		 => [builder 6/6] RUN pip install --no-cache-dir -r requirements.txt                                               9.4s
		 => [runtime 3/5] COPY --from=builder /opt/venv /opt/venv                                                          0.3s
		 => [runtime 4/5] WORKDIR /app                                                                                     0.0s
		 => [runtime 5/5] COPY app/ .                                                                                      0.0s
		 => exporting to image                                                                                             2.4s
		 => => exporting layers                                                                                            1.8s
		 => => exporting manifest sha256:18c02a47e3418339f4a502228c31297e68844e92bae7b00c6aa1cd09dcd1f8ed                  0.0s
		 => => exporting config sha256:25583edd8f3ec2cd4e8afd18bc83df7193cad48d8ee22a66e26d95b05668e77a                    0.0s
		 => => exporting attestation manifest sha256:e7edd631a6c3e16e2fc7775969e2214ebbfdeccb3acdab8e494ee79287d643c1      0.0s
		 => => exporting manifest list sha256:93891916c416c3b563f6b5dd8dac0b5a35bc0ed80d1c7ae1ec46ba390299c8ae             0.0s
		 => => naming to docker.io/library/my-python-app:latest                                                            0.0s
		 => => unpacking to docker.io/library/my-python-app:latest                                                         0.5s
		 
**kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/08.DOCKER.Compose/2$ docker images | grep my-python-app

		my-python-app:latest   93891916c416        273MB         64.2MB   U

**kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/08.DOCKER.Compose/2$ docker run -d -p 8000:8000 --name my-python-app my-python-app
		
		7fdd6736474bd64a2b1f5e295697de5d31dc1c1c0addf81f8f3365453919322d
		
**kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/08.DOCKER.Compose/2$ docker logs python-app

		[2026-05-26 13:14:36 +0000] [1] [INFO] Starting gunicorn 21.2.0
		[2026-05-26 13:14:36 +0000] [1] [INFO] Listening at: http://0.0.0.0:5000 (1)
		[2026-05-26 13:14:36 +0000] [1] [INFO] Using worker: sync
		[2026-05-26 13:14:36 +0000] [7] [INFO] Booting worker with pid: 7
		
**kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/08.DOCKER.Compose/2$ docker ps

		CONTAINER ID   IMAGE                COMMAND                  CREATED          STATUS                  PORTS                                         NAMES
		7fdd6736474b   my-python-app        "uvicorn main:app --…"   19 seconds ago   Up 18 seconds           0.0.0.0:8000->8000/tcp, [::]:8000->8000/tcp   my-python-app
		702ec817613b   python-app           "gunicorn --bind 0.0…"   19 hours ago     Up 19 hours (healthy)   0.0.0.0:5100->5000/tcp, [::]:5100->5000/tcp   python-app
		987e97051730   1-web                "python app.py"          23 hours ago     Up 23 hours             0.0.0.0:5000->5000/tcp, [::]:5000->5000/tcp   my-web-app
		37853e475dd0   postgres:15-alpine   "docker-entrypoint.s…"   23 hours ago     Up 23 hours             0.0.0.0:5432->5432/tcp, [::]:5432->5432/tcp   my-database
		93c99e06efff   node-web-app         "docker-entrypoint.s…"   43 hours ago     Up 43 hours             0.0.0.0:3000->3000/tcp, [::]:3000->3000/tcp   my-node-app

**kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/08.DOCKER.Compose/2$ curl http://localhost:8000/

		{"message":"Hello from Docker multi-stage build!","env":"development"}
		
**kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/08.DOCKER.Compose/2$ curl http://localhost:8000/health
		
		{"status":"ok"}
		
**kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/08.DOCKER.Compose/2$ docker history my-python-app

		IMAGE          CREATED         CREATED BY                                      SIZE      COMMENT
		93891916c416   6 minutes ago   CMD ["uvicorn" "main:app" "--host" "0.0.0.0"…   0B        buildkit.dockerfile.v0
		<missing>      6 minutes ago   EXPOSE [8000/tcp]                               0B        buildkit.dockerfile.v0
		<missing>      6 minutes ago   USER app                                        0B        buildkit.dockerfile.v0
		<missing>      6 minutes ago   ENV PATH=/opt/venv/bin:/usr/local/bin:/usr/l…   0B        buildkit.dockerfile.v0
		<missing>      6 minutes ago   COPY app/ . # buildkit                          12.3kB    buildkit.dockerfile.v0
		<missing>      6 minutes ago   WORKDIR /app                                    8.19kB    buildkit.dockerfile.v0
		<missing>      6 minutes ago   COPY /opt/venv /opt/venv # buildkit             68MB      buildkit.dockerfile.v0
		<missing>      6 minutes ago   RUN /bin/sh -c addgroup --system app && addu…   45.1kB    buildkit.dockerfile.v0
		<missing>      7 days ago      CMD ["python3"]                                 0B        buildkit.dockerfile.v0
		<missing>      7 days ago      RUN /bin/sh -c set -eux;  for src in idle3 p…   16.4kB    buildkit.dockerfile.v0
		<missing>      7 days ago      RUN /bin/sh -c set -eux;   savedAptMark="$(a…   48.4MB    buildkit.dockerfile.v0
		<missing>      7 days ago      ENV PYTHON_SHA256=272179ddd9a2e41a0fc8e42e33…   0B        buildkit.dockerfile.v0
		<missing>      7 days ago      ENV PYTHON_VERSION=3.11.15                      0B        buildkit.dockerfile.v0
		<missing>      7 days ago      ENV GPG_KEY=A035C8C19219BA821ECEA86B64E628F8…   0B        buildkit.dockerfile.v0
		<missing>      7 days ago      RUN /bin/sh -c set -eux;  apt-get update;  a…   4.94MB    buildkit.dockerfile.v0
		<missing>      7 days ago      ENV LANG=C.UTF-8                                0B        buildkit.dockerfile.v0
		<missing>      7 days ago      ENV PATH=/usr/local/bin:/usr/local/sbin:/usr…   0B        buildkit.dockerfile.v0
		<missing>      9 days ago      # debian.sh --arch 'amd64' out/ 'trixie' '@1…   87.4MB    debuerreotype 0.17  
```