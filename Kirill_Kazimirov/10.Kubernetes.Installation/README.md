# 1.Homework Assignment 1. K8s Installation
## 1.Инструкция по запуску k3s k8s
1. Проверка конфига
```
cat ~/.kube/config
cat ~/.kube/config-k3s

```
2. Открываем тунель (k8s) 
```
ssh -L 6443:127.0.0.1:6443 root192.168.208.XX -f -N
```

Открываем тунель (k3s)
```
ssh -L 6444:127.0.0.1:6443 root192.168.203.XX -f -N
```
3. Выполняем команду
```
export KUBECONFIG=HOME/.kube/config-k3s:HOME/.kube/config
```

4. Команды для проверки

```
kubectl get pods -A --context "k3s"
kubectl get pods -A --context "k8s"
```

## 2.Make print-screen of k9s with pods in all namespaces



