##### 09.Docker

[Docker image](https://github.com/users/artem-devitsky/packages/container/package/docker_build)

[Github Repo](https://github.com/artem-devitsky/09.Docker)

#docker-compose.yml

```yaml
version: "3.3"
services:
        web:
                build:
                        context: .
                ports:
                      - "80:80"
```

#Dockerfile

```bash
FROM python:alpine
MAINTAINER Artsiom Dziavitski 
COPY test_app.py /test_app.py
ENTRYPOINT ["python3","-u", "test_app.py"]
LABEL org.opencontainers.image.source https://github.com/artem-devitsky/09.Docker
```

#GHCR Workflow

```yaml
name: Docker image publishing

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
          username: ${{ github.repository_owner }}
          password: ${{ secrets.TOKEN }}

      - name: Build and push Docker images
        uses: docker/build-push-action@v2
        with:
         context: .
         push: true
         tags: ghcr.io/artem-devitsky/docker_build:latest

```

#Testing

```bash
vagrant> vagrant up
Bringing machine 'VM-CentosDocker' up with 'virtualbox' provider...
==> VM-CentosDocker: Importing base box 'generic/centos8'...
==> VM-CentosDocker: Matching MAC address for NAT networking...
==> VM-CentosDocker: Checking if box 'generic/centos8' version '3.6.14' is up to date...
==> VM-CentosDocker: Setting the name of the VM: vagrant_VM-CentosDocker_1653247530825_53712
==> VM-CentosDocker: Clearing any previously set network interfaces...
==> VM-CentosDocker: Preparing network interfaces based on configuration...
    VM-CentosDocker: Adapter 1: nat
==> VM-CentosDocker: Forwarding ports...
    VM-CentosDocker: 80 (guest) => 8080 (host) (adapter 1)
    VM-CentosDocker: 22 (guest) => 2222 (host) (adapter 1)
==> VM-CentosDocker: Running 'pre-boot' VM customizations...
==> VM-CentosDocker: Booting VM...
==> VM-CentosDocker: Waiting for machine to boot. This may take a few minutes...
    VM-CentosDocker: SSH address: 127.0.0.1:2222
    VM-CentosDocker: SSH username: vagrant
    VM-CentosDocker: SSH auth method: private key
    VM-CentosDocker: 
    VM-CentosDocker: Vagrant insecure key detected. Vagrant will automatically replace
    VM-CentosDocker: this with a newly generated keypair for better security.
    VM-CentosDocker: 
    VM-CentosDocker: Inserting generated public key within guest...
    VM-CentosDocker: Removing insecure key from the guest if it's present...
    VM-CentosDocker: Key inserted! Disconnecting and reconnecting using new SSH key...
==> VM-CentosDocker: Machine booted and ready!
==> VM-CentosDocker: Checking for guest additions in VM...
==> VM-CentosDocker: Setting hostname...
==> VM-CentosDocker: Configuring proxy environment variables...
==> VM-CentosDocker: Configuring proxy for Yum...
==> VM-CentosDocker: Mounting shared folders...
    VM-CentosDocker: /app_files => /home/kagato/edu/devops_202205/09.Docker/vagrant/app_files
==> VM-CentosDocker: Running provisioner: docker...
    VM-CentosDocker: Installing Docker onto machine...
==> VM-CentosDocker: Configuring proxy for Docker...
==> VM-CentosDocker: Running provisioner: docker_compose...
    VM-CentosDocker: Checking for Docker Compose installation...
    VM-CentosDocker: Getting machine and kernel name from guest machine...
    VM-CentosDocker: Downloading Docker Compose 1.24.1 for Linux x86_64
    VM-CentosDocker: Downloaded Docker Compose 1.24.1 has SHA256 signature cfb3439956216b1248308141f7193776fcf4b9c9b49cbbe2fb07885678e2bb8a
    VM-CentosDocker: Uploading Docker Compose 1.24.1 to guest machine...
    VM-CentosDocker: Installing Docker Compose 1.24.1 in guest machine...
    VM-CentosDocker: Symlinking Docker Compose 1.24.1 in guest machine...
==> VM-CentosDocker: Configuring proxy for Docker...
==> VM-CentosDocker: Running provisioner: docker_compose...
    VM-CentosDocker: Checking for Docker Compose installation...
    VM-CentosDocker: Symlinking Docker Compose 1.24.1 in guest machine...
    VM-CentosDocker: Running docker-compose rm...
    VM-CentosDocker: No stopped containers
    VM-CentosDocker: Running docker-compose build...
==> VM-CentosDocker: Building web
    VM-CentosDocker: Step 1/5 : FROM python:alpine
    VM-CentosDocker: alpine: Pulling from library/python
    VM-CentosDocker: Digest: sha256:f4c1b7853b1513eb2f551597e2929b66374ade28465e7d79ac9e099ccecdfeec
    VM-CentosDocker: Status: Downloaded newer image for python:alpine
    VM-CentosDocker:  ---> 8b74835e51c6
    VM-CentosDocker: Step 2/5 : MAINTAINER Artsiom Dziavitski
    VM-CentosDocker:  ---> Running in 29b8206d623b
    VM-CentosDocker: Removing intermediate container 29b8206d623b
    VM-CentosDocker:  ---> 19eb3c049879
    VM-CentosDocker: Step 3/5 : COPY test_app.py /test_app.py
    VM-CentosDocker:  ---> 43f60a7ad978
    VM-CentosDocker: Step 4/5 : ENTRYPOINT ["python3","-u", "test_app.py"]
    VM-CentosDocker:  ---> Running in 6e5322711855
    VM-CentosDocker: Removing intermediate container 6e5322711855
    VM-CentosDocker:  ---> 3767562c284a
    VM-CentosDocker: Step 5/5 : LABEL org.opencontainers.image.source https://github.com/artem-devitsky/09.Docker
    VM-CentosDocker:  ---> Running in 1e59a6638c34
    VM-CentosDocker: Removing intermediate container 1e59a6638c34
    VM-CentosDocker:  ---> bdc9564f3521
    VM-CentosDocker: 
    VM-CentosDocker: Successfully built bdc9564f3521
    VM-CentosDocker: Successfully tagged app_files_web:latest
    VM-CentosDocker: Running docker-compose up...
==> VM-CentosDocker: Creating network "app_files_default" with the default driver
==> VM-CentosDocker: Creating app_files_web_1 ... 
Creating app_files_web_1 ... done
==> VM-CentosDocker: Configuring proxy for Docker...
==> VM-CentosDocker: Running provisioner: shell...
    VM-CentosDocker: Running: inline script
    VM-CentosDocker: success
    VM-CentosDocker: success
 Escape character is '^]'.g 127.0.0.1...
    VM-CentosDocker: Connection closed by foreign host.
==> VM-CentosDocker: Configuring proxy for Docker...
You have new mail in /var/spool/mail/kagato
kagato@dev:~/edu/devops_202205/09.Docker/vagrant> telnet 127.0.0.1 8080
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.
fdfd2b57c23a
Sun May 22 19:34:50 2022
Connection closed by foreign host.

```
