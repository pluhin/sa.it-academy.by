```bash
**Homework Assignment 1: Docker Installation and Basic Commands
  523  mkdir 07.Docker
  524  sudo apt update
  525  apt list --upgradable
  526  sudo apt install ca-certificates curl
  527  sudo install -m 0755 -d /etc/apt/keyrings
  528  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  529  sudo chmod a+r /etc/apt/keyrings/docker.asc
  530  sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
    Types: deb
    URIs: https://download.docker.com/linux/ubuntu
    Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
    Components: stable
    Architectures: $(dpkg --print-architecture)
    Signed-By: /etc/apt/keyrings/docker.asc
    EOF
  543  sudo apt update
  544  sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  545  systemctl status docker.service
  546  docker --version
				Docker version 29.5.2, build 79eb04c
  547  docker search hello-world				
  548  docker pull hello-world
  549  docker images
																		i Info →   U  In 
				UseIMAGE                ID             DISK USAGE   CONTENT SIZE   EXTRA
				hello-world:latest   0e760fdfbc48       25.9kB         9.49kB
  550  docker run hello-world
				  Hello from Docker!
				This message shows that your installation appears to be working correctly.

				To generate this message, Docker took the following steps:
				 1. The Docker client contacted the Docker daemon.
				 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
					(amd64)
				 3. The Docker daemon created a new container from that image which runs the
					executable that produces the output you are currently reading.
				 4. The Docker daemon streamed that output to the Docker client, which sent it
					to your terminal.

				To try something more ambitious, you can run an Ubuntu container with:
				 $ docker run -it ubuntu bash

				Share images, automate workflows, and more with a free Docker ID:
				 https://hub.docker.com/

				For more examples and ideas, visit:
				 https://docs.docker.com/get-started/
  551  docker ps
			CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
  552  docker ps -a
			CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
			c1f757b2beb8   hello-world   "/hello"   14 seconds ago   Exited (0) 14 seconds ago             trusting_lehmann

**Homework Assignment 2: Building a Docker Image with Dockerfile
  560  mkdir docker-node-app
  561  cd docker-node-app
  562  touch Dockerfile app.js package.json
  563  nano package.json
  565  nano app.js
  566  nano Dockerfile
  567  docker build -t node-web-app .
  568  docker images | grep node-web-app
			node-web-app:latest   290313bd4ab6        196MB         47.3MB
  569  docker run -d -p 3000:3000 --name my-node-app node-web-app
			node-web-app
			015c72548cd05f5faf630179aa254d3786407920f5375a14ee66d388e400e6a8
  570  docker ps
			CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                                         NAMES
			015c72548cd0   node-web-app   "docker-entrypoint.s…"   8 seconds ago   Up 8 seconds   0.0.0.0:3000->3000/tcp, [::]:3000->3000/tcp   my-node-app
  571  curl http://localhost:3000
		<!DOCTYPE html>
        <html>
        <head>
            <title>Docker Node.js App</title>
            <style>
                body {
                    font-family: 'Arial', sans-serif;
                    margin: 0;
                    padding: 50px;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    min-height: 100vh;
                }
                .container {
                    background: white;
                    border-radius: 10px;
                    padding: 40px;
                    box-shadow: 0 10px 30px rgba(0,0,0,0.2);
                    max-width: 600px;
                    margin: 0 auto;
                }
                h1 { color: #667eea; }
                .info {
                    background: #f5f5f5;
                    padding: 20px;
                    border-radius: 5px;
                    margin: 20px 0;
                }
                .label {
                    font-weight: bold;
                    color: #667eea;
                }
                .success {
                    color: #10b981;
                    font-weight: bold;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <h1>🚀 Docker Node.js Application</h1>
                <div class="info">
                    <p><span class="label">Container ID:</span> 015c72548cd0</p>
                    <p><span class="label">Message:</span> Hello from Docker!</p>
                    <p><span class="label">Node.js Version:</span> v18.20.8</p>
                    <p><span class="label">Platform:</span> linux</p>
                </div>
                <p><span class="success">✅ Node.js app is running inside Docker container!</span></p>
            </div>
        </body>
        </html>
  572  docker logs my-node-app
			✅ Server running on http://localhost:3000
			📦 Container ID: 015c72548cd0
  573  docker inspect my-node-app
  574  docker stop my-node-app
  575  docker start my-node-app
  576  docker restart my-node-app
  577  docker rm -f my-node-app
  578  docker ps
			CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
  579  docker ps -a
			CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                      PORTS     NAMES
			c1f757b2beb8   hello-world   "/hello"   42 minutes ago   Exited (0) 42 minutes ago             trusting_lehmann
```
