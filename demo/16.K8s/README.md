## MINIKUBE demo

```bash

 4780  vim Vagrantfile
 4781  vagrant up
 4782  minikube start
 4783  minikube addons list
 4784  minikube addons enable ingress
 4785  kubectl set nodes
 4786  kubectl get nodes
 4787  minikube addons list
 4788  cd  sa
 4789  ls
 4790  mkdir manifests
 4791  cd manifests
 4792  vim web-app.yaml
 4793  kubectl create -f web-app.yaml
 4794  kubectl stop
 4795  minikube stop
 4796  minikube delete
 4797  minikube start
 4798  minikube addons enable ingress
 4799  kubectl create -f web-app.yaml
 4800  kubectl get deployments
 4801  kubectl get pods
 4802  kubectl exec webserver-6fd9bcf886-4px9b bash
 4803  kubectl exec --stdin --tty webserver-6fd9bcf886-4px9b bash
 4804  kubectl proxy --address='0.0.0.0' --disable-filter=true
 4805  kubectl proxy --address='0.0.0.0' --disable-filter=true &
 4806  kubectl get pods -n kube-system
 4807  minikube addons list
 4808  minikube addons enable dashboard
 4809  vim web-service.yaml
 4810  vim web-app.yaml
 4811  vim web-service.yaml
 4812  kubectl create -f web-service.yaml
 4813  kubectl get services
 4814  vim web-service.yaml
 4815  minikube services list
 4816  minikube service list
 4817  curl http://192.168.99.102:31696
 4818  minikube addons list
 4819  vim web-ingress.yaml
 4820  vim web-service.yaml
 4821  vim web-ingress.yaml
 4822  kubectl create -f web-ingress.yaml
 4823  kubectl get ingress
 4824  curl myminikube.plu 
 4825  sudo vim /etc/hosts
 4826  curl myminikube.plu 
 4827  curl 192.168.99.102
 4828  sudo vim /etc/hosts
 4829  curl 192.168.99.102:80
 4830  sudo vim /etc/nginx/conf.d/web-app.conf
 4831  sudo service nginx reload
 4832  vim web-pv.yaml
 4833  minikube ssh
 4834  vim web-pv.yaml
 4835  kubectl create -f web-pv.yaml
 4836  vim web-pvc.yaml
 4837  vim web-app.yaml
 4838  kubectl create -f web-pvc.yaml
 4839  kubectl apply -f web-app.yaml
 4840  kubectl get pods
 4841  ls -l
 4842  vim web-app.yaml
 4843  kubectl delete -f web-app.yaml
 4844  kubectl get pods
 4845  kubectl create -f web-app.yaml
 4846  kubectl get deployment
 4847  kubectl edit webserver
 4848  kubectl edit deployments.apps/webserver
 4849  kubectl get pods
 4850  kubectl edit deployments.apps/webserver
 4851  kubectl get pods
 4852  vim jenkins.yaml
 4853  kubectl create -f jenkins.yaml
 4854  kubectl get pods
 4855  kubectl get pods -n ci-cd
 4856  vim jenkins.yaml
 4857  kubectl get pods -n ci-cd
 4858  vim jenkins.yaml
 4859  kubectl get services -n ci-cd
 4860  minikube service list
 4861  sudo vim /etc/nginx/conf.d/jenkins_app.conf
 4862  curl http://192.168.99.102:31456
 4863  sudo service nginx reload

```

Node port

```
server {
  listen 80;
  listen [::]:80;

  server_name jenkins.plu;

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.99.102:31456/;
  }
}
```

Ingress

```
server {
  listen 80;
  listen [::]:80;

  server_name myminikube.plu;

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.99.102;
  }
}
```


## Full k8s

https://127.0.0.1:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#/login


```
 8887  kubectl create -f kube-state-metric.yaml
 8888  kubectl create namespace monitoring
 8889  kubectl create -f kube-state-metric.yaml
 8890  kubectl create -f metric-server.yaml
 8891  k9s
 8892  kubectl create -f app_prometheus\ copy.yaml
 8893  kubectl get pods -n monitoring
 8894  kubectl get services -n monitoring
 8895  kubectl get pods -n monitoring
 8896  k9s
 8897  kubectl create -f app_ingress.yaml
 8898  kubectl apply -f app_prometheus\ copy.yaml
 8899  k9s
 8900  history | grep local
 8901  ssh -L 30001:localhost:30001 root@192.168.254.7 -f -N
 8902  ssh -L 30001:localhost:30001 user@192.168.254.7 -f -N
 8903  sudo vim /etc/hosts
 8904  ssh -L 30001:localhost:30001 user@192.168.254.7 -f -N
 8905  ps aux | grep  local
 8906  kill -9 284048
 8907  kill -9 284428
 8908  ssh -L 30001:localhost:30001 user@192.168.254.7 -f -N
 8909  k9s
 8910  curl http://prometheus.plu:30001
 8911  sudo vim /etc/hosts
 8912  ps aux | grep  local
 8913  kill -9 284740
 8914  ssh -L 8080:localhost:30001 user@192.168.254.7 -f -N
 8915  ps aux | grep  local
 8916  kill -9 285867
 8917  ssh -L 30001:localhost:30001 user@192.168.254.8 -f -N
 8918  ps aux | grep  local
 8919  kill -9 286348
 8920  ssh -L 30001:localhost:30001 user@192.168.254.8  -N -v -v
 8921* ec_ssh_jump
 8922  sudo vim /etc/hosts
 8923  kubectl create -f app_grafana.yaml
 8924  sudo vim /etc/hosts
```