```bash
3098  cd /tmp/sa.it-academy.by
 3099  git pull
 3100  cd demo
 3101  ls
 3102  mkdir 16.K8s
 3103  cd 16.K8s/
 3104  ls
 3105  minikube start
 3106  kubectl proxy --address='0.0.0.0' --disable-filter=true
 3107  kubectl proxy --address='0.0.0.0' --disable-filter=true &
 3108  clear
 3109  vim app.yaml
 3110  kubectl cluster-info
 3111  vim app.yaml
 3112  kubectl create -f app.yaml
 3113  vim app.yaml
 3114  kubectl apply -f app.yaml
 3115  kubectl get deployment
 3116  kubectl delete deployment/webserver
 3117  kubectl get pads
 3118  kubectl get pods
 3119  kubectl apply -f app.yaml
 3120  kubectl get pods
 3121  kubectl describe pod webserver-c4fdb687c-c5vdm
 3122  kubectl exec -it
 3123  kubectl exec -it webserver-c4fdb687c-c5vdm bash
 3124  vim app.yaml
 3125  kubectl apply -f app.yaml
 3126  kubectl get svc
 3127  vim app.yaml
 3128  kubectl apply -f app.yaml
 3129  kubectl get ingress
 3130  ifconfig | grep 'inet '
 3131  kubectl cluster-info
 3132  sudo vim /etc/hosts
 3133  curl http://myminikube.plu
 3134  sudo vim /etc/nginx/conf.d/web-app.conf
 3135  sudo service nginx reload
 3136  vim app.yaml
 3137  kubectl apply -f app.yaml
 3138  kubectl ger pv
 3139  kubectl get pv
 3140  minikube ssh
 3141  vim app.yaml
 3142  kubectl apply -f app.yaml
 3143  vim app.yaml
 3144  kubectl apply -f app.yaml
 3145  kubectl get pods
 3146  minikube ssh
 3147  docker php
 3148  docker search php
 3149  vim app.yaml
 3150  kubectl apply -f app.yaml
 3151  kubectl get pods
 3152  kubectl exec -it webserver-84dd984ddb-7zs24 bash
 3153  kubectl exec -it webserver-84dd984ddb-9bzsn bash
 3154  vim app.yaml
 3155  kubectl apply -f app.yaml
 3156  kubectl get pods
 3157  vim jenkins.yaml
 3158  kubectl apply -f jenkins.yaml
 3159  vim jenkins.yaml
 3160  kubectl apply -f jenkins.yaml
 3161  vim jenkins.yaml
 3162  kubectl apply -f jenkins.yaml
 3163  vim jenkins.yaml
 3164  kubectl apply -f jenkins.yaml
 3165  vim jenkins.yaml
 3166  echo "c3VwZXJfcGFzcw==" | base64 -d
 3167  q
 3168  vim jenkins.yaml
 3169  kubectl get pods -n ci-cd
 3170  kubectl get pods -n default
 3171  vim /etc/nginx/conf.d/jenkins.conf
 3172  sudo vim /etc/nginx/conf.d/jenkins.conf
 3173  sudo service nginx reload
 3174  minikube service list
```
