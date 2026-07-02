1. ✅ Создан Deployment, который генерирует логи.
2. ✅ Собраны логи с помощью `kubectl logs`.
3. ✅ Создан падающий под, проверены его логи.
4. ✅ Посмотрены логи на уровне ноды.
  nano logging-deployment.yaml
  kubectl apply -f logging-deployment.yaml
  kubectl get pods
  kubectl logs log-generator-856b67c548-tptrs
  kubectl logs -l app=log-generator --all-containers=true
  kubectl logs -f deploy/log-generator
  kubectl logs log-generator-856b67c548-tptrs | head -10
  nano failing-pod.yaml
  kubectl apply -f failing-pod.yaml
  kubectl get pod failing-pod
  kubectl logs failing-pod
  kubectl logs failing-pod --previous
  kubectl get nodes
  ssh -J jump_sa@178.124.206.53:32511 root@192.168.208.11
  ls
  kubectl get pods > pods.txt
  ls
  kubectl logs -l app=log-generator --all-containers=true | head -10 > logs-app.txt
  ls
  cat logs-app.txt
  kubectl logs failing-pod > failing-pod-logs.txt 2>&1
  kubectl logs failing-pod --previous 2>&1 | head -10 > failing-pod-previous.txt  
  nano failing-pod-previous.txt
