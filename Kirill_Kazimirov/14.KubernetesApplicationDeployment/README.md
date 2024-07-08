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

![image](https://github.com/Kirilllka1993/sa.it-academy.by/assets/31740297/fe9e5a76-cd34-4b1a-8400-3dc9d157d8d9)


![image](https://github.com/Kirilllka1993/sa.it-academy.by/assets/31740297/0da6db30-8c99-4316-8101-3da4540ea268)
