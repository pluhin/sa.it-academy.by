# 1.Homework Assignment 1. ArgoCD deployment and application
## 1.1 deploy ArgoCD into your cluster

Скачиваем argocd
```
 wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

```
Изменеяем скачанный install.yaml. Изменённый файл находится здесь: [https://github.com/Kirilllka1993/argoDeploy]

Устанавливаем в кластер предварительно создва namespace agrocd
Ссылка на документацию [https://argo-cd.readthedocs.io/en/stable/]

```
kubectl create namespace argocd
kubectl apply -f install.yaml -n argocd
```
Получим пароль для первого входа

```
kirill@ubuntudev:~$ kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
kirill@ubuntudev:~$
```
![image](https://github.com/Kirilllka1993/sa.it-academy.by/assets/31740297/06767a45-0232-4170-bf93-4111d833d6da)

![image](https://github.com/Kirilllka1993/sa.it-academy.by/assets/31740297/4ad53562-76a6-4007-a1c9-bfd9d87da2c3)


![image](https://github.com/Kirilllka1993/sa.it-academy.by/assets/31740297/df428ec7-f877-4e92-be0d-d5bbd9232e39)


## 1.2.add your repositories with helm packages as source for deployment
Гит репозиторий с приложениями

[https://github.com/Kirilllka1993/helmjenkins]

Нужно было создать архивы с нашими чартами для jenkins перебросив их в нужну папку (helm-releases)

```
root@ubuntudev:/home/kirill/14.HelmJenkins# tar -cvzf jenkins-helm-0.2.0.tgz jenkins-helm
root@ubuntudev:/home/kirill/14.HelmJenkins/helm-sources# mv jenkins-helm-0.2.0.tgz /home/kirill/14.HelmJenkins/helm-rele
ases
```
Для того,чтобы был коннект с argocd создаём index.yaml для нашего репозитория
```
helm add index .  

```
только после этого появится коннект с argocd

Удаляем secret-sealed

```
kubectl delete -f  https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.27.0/controller.yaml
```
И попробуем его установить с помощью argocd

repository для чартов sealed-secrets

```
https://bitnami-labs.github.io/sealed-secrets
```
![image](https://github.com/Kirilllka1993/sa.it-academy.by/assets/31740297/928ba6be-b063-4e80-a542-ba8185af9acf)

## 1.3. add this repository as project for your applications

Ссылка на репозиторий: [https://github.com/Kirilllka1993/argoapps]

Из полученных приложений создадим yaml файлы
```
kirillubuntudev: kubectl get applications -A
NAMESPACE   NAME           SYNC STATUS   HEALTH STATUS
argocd      helm-jenkins   OutOfSync     Healthy
argocd      seled-secret   Synced        Healthy
kubectl get applications helm-jenkins -n argocd  -o yaml  helm-jenkins.yaml
kubectl get applications seled-secret -n argocd  -o yaml  sealed-secret.yaml
```

