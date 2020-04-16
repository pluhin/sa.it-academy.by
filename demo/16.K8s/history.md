```bash
2900  cd /tmp/sa.it-academy.by
 2901  git pull
 2902  cd  demo
 2903  ls
 2904  mkdir 16.K8s
 2905  cd 16.K8s
 2906  minikube
 2907  minikube start
 2908* kubectl get srv
 2909* kubectl get services
 2910* kubectl proxy --address='0.0.0.0' --disable-filter=true
 2911* kubectl proxy --address='0.0.0.0' --disable-filter=true &
 2912  pwd
 2913  vim web.yaml
 2914  kubectl create -f web.yaml
 2915  kubectl get pods
 2916  kubectl describe pod webserver-6fd9bcf886-bctf5
 2917  vim web.yaml
 2918  kubectl apply -f web.yaml
 2919  kubectl get pods
 2920  vim web.yaml
 2921  kubectl apply -f web.yaml
 2922  kubectl get pods
 2923  vim web.yaml
 2924  vim web-service.yaml
 2925  vim web.yaml
 2926  kubectl apply -f web-service.yaml
 2927  kubectl get servises
 2928  kubectl get services
 2929  vim web.yaml
 2930  vim web-service.yaml
 2931  vim web-ingress.yaml
 2932  vim web-service.yaml
 2933  vim web-ingress.yaml
 2934  kubectl apply -f web-ingress.yaml
 2935  vim web-ingress.yaml
 2936  sudo vim /etc/hosts
 2937  kubectl describe ing ingress-sa
 2938  kubectl cluster-info
 2939  sudo vim /etc/hosts
 2940  curl myminikube.plu
 2941  ping  myminikube.plu 
 2942  ping  http://myminikube.plu 
 2943  curl  http://myminikube.plu 
 2944  curl  http://192.168.99.101
 2945  curl  http://myminikube.plu  -vvvv
 2946  ifconfig
 2947  vim web.yaml
 2948  vim web-service.yaml
 2949  minikube service list
 2950  vim web.yaml
 2951  vim web-service.yaml
 2952  vim web-ingress.yaml
 2953  curl  http://myminikube.plu/  -vvvv
 2954  curl  http://myminikube.plu/
 2955  sudo service nginx restart
 2956  curl  http://myminikube.plu/
 2957  ping 192.168.99.101
 2958  ping 192.168.99.100
 2959  nmap  192.168.99.101
 2960  nmap -p -  192.168.99.101
 2961  minikube service list
 2962  cult http://192.168.99.101:31255
 2963  curl http://192.168.99.101:31255
 2964  vim /etc/nginx/conf.d/web-app.conf
 2965  minikube stop
 2966  minikube start
 2967  curl  http://myminikube.plu/
 2968  curl http://192.168.99.101:31255
 2969  vim /etc/nginx/conf.d/web-app.conf
 2970  sudo service nginx reload
 2971  curl http://myminikube.plu
 2972  sudo vim /etc/hosts
 2973  curl http://myminikube.plu
 2974  ping myminikube.plu
 2975  sudo vim /etc/hosts
 2976  curl http://myminikube.plu
 2977  vim /etc/nginx/conf.d/web-app.conf
 2978  ls -l 
 2979  minikube ssh
 2980  vim web-pv.yaml
 2981  kubectl apply -f web-pv.yaml
 2982  vim web-pvc.yaml
 2983  kubectl apply -f web-pvc.yaml
 2984  vim web.yaml
 2985  kubectl apply -f web.yaml
 2986  kubectl get pods
 2987  vim jenkins.yaml
 2988* echo "c3VwZXJfcGFzcw==" | base64 -d
 2989  kubectl apply -f jenkins.yaml
 2990  kubectl get pods
 2991  kubectl get pods -n ci-cd
 2992  sudo vim /etc/nginx/conf.d/jenkins_app.conf
 2993  kubectl get pods -n ci-cd
 2994  sudo vim /etc/nginx/conf.d/jenkins_app.conf
 2995  sudo service nginx reload
 2996  minikube stop
 2997  cp /etc/nginx/conf.d/jenkins_app.conf ./
 2998  cp /etc/nginx/conf.d/web-app.conf ./
```

