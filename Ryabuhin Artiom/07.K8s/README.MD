# 07.K8s

```PS
choco install minikube
Install-Script -Name install-kubectl -Scope CurrentUser -Force
install-kubectl.ps1 [-DownloadLocation <path>]
choco install kubernetes-cli
minikube.exe start
minikube.exe service list
minikube.exe addons list
minikube.exe addons enable dashboard
minikube.exe addons enable ingress
minikube.exe addons list
```

### command for run minikube with different HW options (RAM/CPU)

```PS
minikube.exe --memory 2048 --cpus 2 start
```
its not working with existing cluster!


### result screen
![N|1](https://thumb.cloud.mail.ru/weblink/thumb/xw1/3Dyz/4q9VajuN4?x-email=maildrop%40mail.ru)

