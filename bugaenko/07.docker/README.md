##task1

```

 sudo apt-get update
  522  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  523  sudo apt install apt-transport-https ca-certificates curl software-properties-common
  524  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  525  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb\_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  526  sudo apt update
  527  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  528  docker --version
  529  ls
  530  docker search hello
  531  sudo docker search hello
  532  sudo docker search hello_world
  533  sudo docker search hello-world
  534  docker pull hello-world
  535  sudo docker pull hello-world
  536  docker run hello-world
  537  sudo docker run hello-world
  538  sudo docker ps
```
##task2
```

540  nano dockerfile
  541  nano README.md
  542  history
  543  nano README.md
  544  sudo docker --version
  545  nano README.md
  546  nano application.py
  547  sudo docker build -t task2 .
  548  sudo docker images
  549  sudo docker run task2
  550  nano application.py
  551  sudo ufw status
  552  ip a
  553  nano application.py
  554  sudo docker build -t task2-1 .
  555  sudo docker run task2-1
  556  nano application.py
  557  sudo docker run task2
  558  ls
  559  nano dockerfile
  560  sudo docker build -t task2
  561  sudo docker run task2
  562  nano dockerfile
  563  sudo docker run 7000:7000 task2
  564  sudo docker run -p 7000:7000 task2
  565  history
```
