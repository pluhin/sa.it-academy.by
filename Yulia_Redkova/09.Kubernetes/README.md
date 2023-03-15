# 09. Kubernetus Hw
New repository was created: [K8s](https://github.com/julietredk/K8s_git_action)

Dockerfile: [Dockerfile](https://github.com/julietredk/K8s_git_action/blob/main/Dockerfile)
Deployment file: [deployment.yaml](https://github.com/julietredk/K8s_git_action/blob/main/deployment.yaml)

Github action for KinD: [KinD](https://github.com/julietredk/K8s_git_action/blob/main/.github/workflows/CI_kind.yaml)
Result:
```
Run echo -e "\n$(kubectl get node)" 

NAME                 STATUS   ROLES           AGE   VERSION
kind-control-plane   Ready    control-plane   25s   v1.25.3
Flag --short has been deprecated, and will be removed in the future. The --short output will become the default.

Client Version: v1.26.2
Kustomize Version: v4.5.7
Server Version: v1.25.3
```
Github action for minicube: [Minicube](https://github.com/julietredk/K8s_git_action/blob/main/.github/workflows/pr.yml)
```
Run echo -e "\n$(kubectl get node)" 

NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   33s   v1.26.1
Flag --short has been deprecated, and will be removed in the future. The --short output will become the default.

Client Version: v1.26.2
Kustomize Version: v4.5.7
Server Version: v1.26.1
```
We can see that for both KinD and minicube we have 1 node, but run time is less for Kind (~1 minute for Kind nd ~2 minutes for minicube)
 
![alt text](https://github.com/julietredk/K8s_git_action/blob/main/k8s.jpg "Logo Title Text 1")
