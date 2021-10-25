## Test ingress:
app.k8s-21.sa(browser) -> bastion(nginx) -> |k8s -> ingress_k8s -> service -> pod(s) -> container

```
curl --header "Host: app.k8s-21.sa" 192.168.203.21:30001
```

## History

```bash
  156  mkdir first-app
  157  cd first-app/
  158  ls
  159  kubectl get nodes
  160  vim app.yaml
  161  kubectl apply -f app.yaml
  162  kubectl get pods
  163  kubectl get deploy
  164  kubectl delete deploy/webserver
  165  kubectl apply -f app.yaml
  166  kubectl get pods
  167  kubectl describe pod webserver-5fbbfb7956-5844j
  168  kubectl exec webserver-5fbbfb7956-5844j -- bash
  169  kubectl exec it webserver-5fbbfb7956-5844j -- bash
  170  kubectl exec -it webserver-5fbbfb7956-5844j -- bash
  171  kubectl scale deployment webserver --replicas=0
  172  kubectl scale deployment webserver --replicas=3
  173  vim app.yaml
  174  kubectl apply -f app.yaml
  175  kubectl get services
  176  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/baremetal/deploy.yaml  -O ingress.yaml
  177  ls -l
  178  vim ingress.yaml
  179  kubectl apply -f ingress.yaml
  180  vim app.yaml
  181  kubectl apply -f app.yaml
  182  vim app.yaml
  183  kubectl apply -f app.yaml
  184  vim app.yaml
  185  kubectl apply -f app.yaml
  186  vim app.yaml
  187  kubectl apply -f app.yaml
  188  vim app.yaml
  189  kubectl apply -f app.yaml
  190  kubectl exec -it webserver-b88578684-5n2mg bash
  191  vim app.yaml
  192  echo "aW1wYXNzd29yZAo=" | base64 -d
  193  echo "aW1wYXNzd29yZAo=" | base64
  194  kubectl apply -f app.yaml
  195  kubectl exec -it  webserver-dbc47fbc4-w48zf -- bash
  196  mkdir helm_demo
  197  cd helm_demo
  198  helm
  199  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  200  sh get_helm.sh
  201  bash get_helm.sh
  202  helm version
  203  helmcreate demo-app
  204  helm create demo-app
  205  ls -l
  206  rm get_helm.sh
  207  ls -l demo-app/
  208  ls -l demo-app/templates/
  209  vim demo-app/templates/deployment.yaml
  210  vim demo-app/values.yaml
  211  vim ../app.yaml
  212  vim demo-app/values.yaml
  213  helm package demo-app
  214  ls -l
  215  helm install demo-app demo-app-0.1.0.tgz
  216  vim demo-app/values.yaml
  217  helm package demo-app
  218  helm install demo-app demo-app-0.1.0.tgz
  219  helm uninstall demo-app
  220  helm install demo-app demo-app-0.1.0.tgz
  221  vim demo-app/values.yaml
  222  history
```

## Local host (browser)

➜  ~ cat vim /etc/hosts
178.124.206.53 app.k8s-21.sa app.k8s-22.sa helm.k8s-21.sa