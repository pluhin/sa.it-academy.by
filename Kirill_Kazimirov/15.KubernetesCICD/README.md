# 1.Homework Assignment 1. ArgoCD deployment and application
## 1.1 deploy ArgoCD into your cluster

Скачиваем argocd
```
 wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

```
Изменеяем скачанный install.yaml. Изменённый файл находится здесь: [https://github.com/Kirilllka1993/argoDeploy]

Устанавливаем в кластер

```
kubectl apply -f install.yaml -n argocd
```
Получим пароль для первого входа

```
kirill@ubuntudev:~$ kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
k6nwg7O9QtA0dZ9B 
kirill@ubuntudev:~$
```
## 1.2.add your repositories with helm packages as source for deployment
Гит репозиторий с приложениями

[https://github.com/Kirilllka1993/argoapps/tree/main/argo-apps] 
