# 13. K8s. Structure

 - Install minikube on your bare/virtual host
 - Provide access to the dashboard from your workstation
 - Automate it (bash/ansible/Jenkinsfile) Your code and printscreen of dachboard put into folder 13. K8s.
 - Structure add to your repository, then prepare PR (Pull Request)

### Automation of the installation of minikube

1. Install VM

![Vagrantfile](Vagrantfile)

![Console output](./log/VM_instal.log)

2. Install minikube

Installation was performed using ansible

![tasks](./roles/minikube/tasks/main.yaml)

![Console output](./log/minikube_install.log)

Dashboard

![](./screens/minikube.png)