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
k3s
![image](https://github.com/Kirilllka1993/sa.it-academy.by/assets/31740297/ce064f04-fbe3-4da0-9ae2-6f403399b5a2)



k8s

![image](https://github.com/Kirilllka1993/sa.it-academy.by/assets/31740297/5dc616d2-03f5-4ed1-8cc6-2fc2dff3626c)



