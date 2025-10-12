## 2 kubectl get pods

![Alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/17.Kubernetes.Log/screenshots/k8s.log_01.png "kubectl get pods")


### kubectl logs log-app-5d6b9d7d-25pdf

![Alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/17.Kubernetes.Log/screenshots/k8s.log_02.png "kubectl logs pod")


### kubectl logs -l app=log-app --all-containers=true

![Alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/17.Kubernetes.Log/screenshots/k8s.log_03.png "kubectl logs -l ap")


### kubectl logs -f deploy/log-app

![Alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/17.Kubernetes.Log/screenshots/k8s.log_06.png "logs from a failing Pod")


## 3 Investigate logs from a failing Pod

![Alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/17.Kubernetes.Log/screenshots/k8s.log_04.png "logs from a failing Pod")


## 4 Explore node-level logs

### tail -n 10 /var/log/containers/[pod-hash].log

![Alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/17.Kubernetes.Log/screenshots/k8s.log_05.png "node-level logs")

