## Commands

```
       curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
       dpkg -i minikube_latest_amd64.deb
       apt update
       apt-get install     apt-transport-https     ca-certificates     curl     gnupg     lsb-release
       curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
       echo   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
       apt update
       apt-get install docker-ce docker-ce-cli containerd.io
       usermod -aG docker aleks
       su - aleks
       minikube start
       sudo -i
       curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
       install -o root -g root -m 0755 /home/aleks/kubectl /usr/local/bin/kubectl   
       su - aleks
       kubectl proxy --address='0.0.0.0' --disable-filter=true &
       minikube addons enable dashboar
       minikube addons enable ingress
       minikube stop && minikube start --cpus 1 --memory 2048
       minikube start --cpus 2 --memory 2048
    
```
