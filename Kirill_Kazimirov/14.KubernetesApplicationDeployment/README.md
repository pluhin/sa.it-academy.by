# 1.Homework Assignment 1. Transform Jenkins deployment to Helm

В папках сформированы чарты для хельма

Добавили namespace 
```
kubectl create namespace helm-jenkins
```
Затем выполнили команду 
```
helm install jenkins-helm . --namespace=helm-jenkins
```
Для передеплоя

```
helm upgrade jenkins-helm . --namespace=helm-jenkins
```
