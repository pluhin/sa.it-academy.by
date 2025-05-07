## Homework Assignment 1: Docker Compose for Application Stacks

Django + Postgres

```bash
sudo apt install python3-django
django-admin startproject docker_django_app
cd docker_django_app/
pip3 freeze > requirements.txt
sudo docker build -t docker-django:1 -f dockerfile_django .
sudo docker image list
sudo docker compose up --build
```

## Homework Assignment 2: Docker build automation (github action)
https://github.com/infinity-step/08_project

Login to GitHub Container Registry
```bash
Run docker/login-action@v3

Logging into ghcr.io...

Login Succeeded!
```

Build and push
```bash
Run docker/build-push-action@v4

GitHub Actions runtime token ACs

Docker info

Proxy configuration

Buildx version

/usr/bin/docker buildx build --file ./dockerfile_flask --iidfile /tmp/docker-actions-toolkit-bRFTxF/iidfile --tag ghcr.io/infinity-step/08_project:latest --metadata-file /tmp/docker-actions-toolkit-bRFTxF/metadata-file --push .

#0 building with "default" instance using docker driver

#1 [internal] load build definition from dockerfile_flask

#1 transferring dockerfile: 625B done

#1 DONE 0.0s

#2 [auth] library/python:pull token for registry-1.docker.io

#2 DONE 0.0s

#3 [internal] load metadata for docker.io/library/python:3.13-slim

#3 DONE 0.3s

#4 [internal] load .dockerignore

#4 transferring context: 2B done

#4 DONE 0.0s

#5 [internal] load build context

#5 transferring context: 35.19kB done

#5 DONE 0.0s

#6 [stage-1 1/6] FROM docker.io/library/python:3.13-slim@sha256:21e39cf1815802d4c6f89a0d3a166cc67ce58f95b6d1639e68a394c99310d2e5

#6 resolve docker.io/library/python:3.13-slim@sha256:21e39cf1815802d4c6f89a0d3a166cc67ce58f95b6d1639e68a394c99310d2e5 done

#6 sha256:21e39cf1815802d4c6f89a0d3a166cc67ce58f95b6d1639e68a394c99310d2e5 9.12kB / 9.12kB done

#6 sha256:24957e9f1f17edff619f3b26ced3f558d6d9374b0b714299a8ce3ec56ec1616c 1.75kB / 1.75kB done

#6 sha256:94124e1b0412d8ea681c370b2724986703ec380e867240c13247050b3ea39ca2 5.37kB / 5.37kB done

#6 sha256:8a628cdd7ccc83e90e5a95888fcb0ec24b991141176c515ad101f12d6433eb96 2.10MB / 28.23MB 0.1s

#6 sha256:f89b8a1b3342398d9ee19b91234cb94aa548bab41d77fe0455c4ef62b33b9422 0B / 3.51MB 0.1s

#6 sha256:29984f11a3e969b89f0ce2300cbc436d535e7c8b6000c23f27e909355300b878 0B / 12.59MB 0.1s

#6 sha256:8a628cdd7ccc83e90e5a95888fcb0ec24b991141176c515ad101f12d6433eb96 22.02MB / 28.23MB 0.3s

#6 sha256:f89b8a1b3342398d9ee19b91234cb94aa548bab41d77fe0455c4ef62b33b9422 3.51MB / 3.51MB 0.2s done

#6 sha256:29984f11a3e969b89f0ce2300cbc436d535e7c8b6000c23f27e909355300b878 12.59MB / 12.59MB 0.2s done

#6 sha256:0f1e2b67e65537d3bcad248a941bd35d5eac68ae37aa053af8f9daa81705ebe3 251B / 251B 0.2s done

#6 sha256:8a628cdd7ccc83e90e5a95888fcb0ec24b991141176c515ad101f12d6433eb96 28.23MB / 28.23MB 0.4s

#6 extracting sha256:8a628cdd7ccc83e90e5a95888fcb0ec24b991141176c515ad101f12d6433eb96

#6 sha256:8a628cdd7ccc83e90e5a95888fcb0ec24b991141176c515ad101f12d6433eb96 28.23MB / 28.23MB 0.4s done

#6 extracting sha256:8a628cdd7ccc83e90e5a95888fcb0ec24b991141176c515ad101f12d6433eb96 1.0s done

#6 extracting sha256:f89b8a1b3342398d9ee19b91234cb94aa548bab41d77fe0455c4ef62b33b9422

#6 extracting sha256:f89b8a1b3342398d9ee19b91234cb94aa548bab41d77fe0455c4ef62b33b9422 0.1s done

#6 extracting sha256:29984f11a3e969b89f0ce2300cbc436d535e7c8b6000c23f27e909355300b878

#6 extracting sha256:29984f11a3e969b89f0ce2300cbc436d535e7c8b6000c23f27e909355300b878 0.5s done

#6 extracting sha256:0f1e2b67e65537d3bcad248a941bd35d5eac68ae37aa053af8f9daa81705ebe3

#6 extracting sha256:0f1e2b67e65537d3bcad248a941bd35d5eac68ae37aa053af8f9daa81705ebe3 done

#6 DONE 2.3s

#7 [stage-1 2/6] RUN useradd -m -r appuser && mkdir /app && chown -R appuser /app

#7 ...

#8 [builder 2/5] RUN mkdir /app

#8 DONE 0.2s

#9 [builder 3/5] WORKDIR /app

#9 DONE 0.0s

#7 [stage-1 2/6] RUN useradd -m -r appuser && mkdir /app && chown -R appuser /app

#7 DONE 0.2s

#10 [builder 4/5] RUN pip install --upgrade pip

#10 1.349 Requirement already satisfied: pip in /usr/local/lib/python3.13/site-packages (25.0.1)

#10 1.439 WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager, possibly rendering your system unusable. It is recommended to use a virtual environment instead: [https://pip.pypa.io/warnings/venv.](https://pip.pypa.io/warnings/venv.) Use the --root-user-action option if you know what you are doing and want to suppress this warning.

#10 DONE 1.6s

#11 [builder 5/5] RUN pip install flask

#11 1.413 Collecting flask

#11 1.460 Downloading flask-3.1.0-py3-none-any.whl.metadata (2.7 kB)

#11 1.490 Collecting Werkzeug>=3.1 (from flask)

#11 1.498 Downloading werkzeug-3.1.3-py3-none-any.whl.metadata (3.7 kB)

#11 1.518 Collecting Jinja2>=3.1.2 (from flask)

#11 1.529 Downloading jinja2-3.1.6-py3-none-any.whl.metadata (2.9 kB)

#11 1.547 Collecting itsdangerous>=2.2 (from flask)

#11 1.556 Downloading itsdangerous-2.2.0-py3-none-any.whl.metadata (1.9 kB)

#11 1.577 Collecting click>=8.1.3 (from flask)

#11 1.584 Downloading click-8.1.8-py3-none-any.whl.metadata (2.3 kB)

#11 1.600 Collecting blinker>=1.9 (from flask)

#11 1.607 Downloading blinker-1.9.0-py3-none-any.whl.metadata (1.6 kB)

#11 1.656 Collecting MarkupSafe>=2.0 (from Jinja2>=3.1.2->flask)

#11 1.665 Downloading MarkupSafe-3.0.2-cp313-cp313-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (4.0 kB)

#11 1.679 Downloading flask-3.1.0-py3-none-any.whl (102 kB)

#11 1.698 Downloading blinker-1.9.0-py3-none-any.whl (8.5 kB)

#11 1.708 Downloading click-8.1.8-py3-none-any.whl (98 kB)

#11 1.718 Downloading itsdangerous-2.2.0-py3-none-any.whl (16 kB)

#11 1.729 Downloading jinja2-3.1.6-py3-none-any.whl (134 kB)

#11 1.739 Downloading werkzeug-3.1.3-py3-none-any.whl (224 kB)

#11 1.750 Downloading MarkupSafe-3.0.2-cp313-cp313-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (23 kB)

#11 1.771 Installing collected packages: MarkupSafe, itsdangerous, click, blinker, Werkzeug, Jinja2, flask

#11 2.123 Successfully installed Jinja2-3.1.6 MarkupSafe-3.0.2 Werkzeug-3.1.3 blinker-1.9.0 click-8.1.8 flask-3.1.0 itsdangerous-2.2.0

#11 2.123 WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager, possibly rendering your system unusable. It is recommended to use a virtual environment instead: [https://pip.pypa.io/warnings/venv.](https://pip.pypa.io/warnings/venv.) Use the --root-user-action option if you know what you are doing and want to suppress this warning.

#11 DONE 2.2s

#12 [stage-1 3/6] COPY --from=builder /usr/local/lib/python3.13/site-packages/ /usr/local/lib/python3.13/site-packages/

#12 DONE 0.2s

#13 [stage-1 4/6] COPY --from=builder /usr/local/bin/ /usr/local/bin/

#13 DONE 0.0s

#14 [stage-1 5/6] WORKDIR /app

#14 DONE 0.0s

#15 [stage-1 6/6] COPY --chown=appuser:appuser . .

#15 DONE 0.0s

#16 exporting to image

#16 exporting layers

#16 exporting layers 0.5s done

#16 writing image sha256:df6d453c45f183a405ca7f9d32f69936f83f6ff3fa1fa703c7883c96f411a187 done

#16 naming to ghcr.io/infinity-step/08_project:latest done

#16 DONE 0.5s

#17 resolving provenance for metadata file

#17 DONE 0.0s

#18 pushing ghcr.io/infinity-step/08_project:latest with docker

#18 pushing layer 8d1cc4435222

#18 pushing layer 5f70bf18a086

#18 pushing layer 38fb7ef244b1

#18 pushing layer 558956453306

#18 pushing layer e82ffa08e85e

#18 pushing layer e8e6022208c3

#18 pushing layer 20762b83e049

#18 pushing layer 0dbd92ca4322

#18 pushing layer ea680fbff095

#18 pushing layer 8d1cc4435222 78.34kB / 31.96kB 0.2s

#18 pushing layer 38fb7ef244b1 3.58kB / 217B 0.2s

#18 pushing layer 558956453306 2.25MB / 4.58MB 0.3s

#18 pushing layer e82ffa08e85e 17.92kB / 8.43kB 0.2s

#18 pushing layer 558956453306 4.85MB / 4.58MB 0.4s

#18 pushing layer 5f70bf18a086 0.6s done

#18 pushing layer 8d1cc4435222 0.6s done

#18 pushing layer 38fb7ef244b1 0.6s done

#18 pushing layer 558956453306 0.8s done

#18 pushing layer e82ffa08e85e 0.6s done

#18 pushing layer ea680fbff095 5.94MB / 74.83MB 1.1s

#18 pushing layer ea680fbff095 12.47MB / 74.83MB 1.3s

#18 pushing layer ea680fbff095 19.06MB / 74.83MB 1.5s

#18 pushing layer ea680fbff095 27.65MB / 74.83MB 1.7s

#18 pushing layer ea680fbff095 31.98MB / 74.83MB 1.9s

#18 pushing layer ea680fbff095 37.45MB / 74.83MB 2.1s

#18 pushing layer ea680fbff095 42.94MB / 74.83MB 2.3s

#18 pushing layer ea680fbff095 49.46MB / 74.83MB 2.5s

#18 pushing layer ea680fbff095 54.92MB / 74.83MB 2.7s

#18 pushing layer ea680fbff095 61.34MB / 74.83MB 2.9s

#18 pushing layer ea680fbff095 67.82MB / 74.83MB 3.2s

#18 pushing layer ea680fbff095 74.17MB / 74.83MB 3.4s

#18 pushing layer ea680fbff095 4.6s done

#18 pushing layer e8e6022208c3 5.5s done

#18 pushing layer 20762b83e049 5.5s done

#18 pushing layer 0dbd92ca4322 5.5s done

#18 DONE 5.5s
```