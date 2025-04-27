# 12. Kubernetes. Data. Security

## Homework Assignment 1. Config maps and secrets
1. I've modified my previous file - nginx-deployment.yaml. Add init-container block which performs command and creates index.html for each pod
2. Run nginx-deployment.yaml
```
debian@vbox ~/i/12.K8s (master)> kubectl apply -f nginx-deployment.yaml
deployment.apps/nginx-deployment configured
service/nginx-service unchanged
ingress.networking.k8s.io/nginx-ingress unchanged
```
3. Check changes.
```
debian@vbox ~/i/12.K8s (master)> curl nginx-test.k8s-19.sa                                                                                                                                               
<h1>nginx-deployment-84b8778f85-4b29g</h1>
debian@vbox ~/i/12.K8s (master)> curl nginx-test.k8s-19.sa                                                                                                                                               
<h1>nginx-deployment-84b8778f85-flzl4</h1>
debian@vbox ~/i/12.K8s (master)> curl nginx-test.k8s-19.sa                                                                                                                                               
<h1>nginx-deployment-84b8778f85-4b29g</h1>
debian@vbox ~/i/12.K8s (master)> curl nginx-test.k8s-19.sa                                                                                                                                               
<h1>nginx-deployment-84b8778f85-kgv57</h1>
debian@vbox ~/i/12.K8s (master)> curl nginx-test.k8s-19.sa                                                                                                                                               
<h1>nginx-deployment-84b8778f85-flzl4</h1>
debian@vbox ~/i/12.K8s (master)> curl nginx-test.k8s-19.sa                                                                                                                                               
<h1>nginx-deployment-84b8778f85-kgv57</h1>
```
You may notice that the request goes to different pods  
4. Install sealed-secrets on client and claster side. 
5. Create init_secret.yaml and add private and pub keys (base64)
6. Create sealed secret file.
```
cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml 
```
7. Run sealed_secret.yaml
```
debian@vbox ~/i/12.K8s (master)> kubectl apply -f sealed_secret.yaml                                                                                                                                     
sealedsecret.bitnami.com/ssh-key-secret created
```
8. Add volume regarding secrets to nginx_deployment.yaml
9. Check root folder on pod before running
```
<<K9s-Shell>> Pod: default/nginx-deployment-84b8778f85-4b29g | Container: nginx 
root@nginx-deployment-84b8778f85-4b29g:/# ls
bin  boot  dev  docker-entrypoint.d  docker-entrypoint.sh  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@nginx-deployment-84b8778f85-4b29g:/# cd root
root@nginx-deployment-84b8778f85-4b29g:~# ls ./ssh
ls: cannot access './ssh': No such file or directory
```
10. Run nginx_deployment.yaml
```
debian@vbox ~/i/12.K8s (master)> kubectl apply -f nginx-deployment.yaml
deployment.apps/nginx-deployment configured
service/nginx-service unchanged
ingress.networking.k8s.io/nginx-ingress unchanged
```

11. Check root folder after changes
```
<<K9s-Shell>> Pod: default/nginx-deployment-665fcc4b6f-6dzhg | Container: nginx 
root@nginx-deployment-665fcc4b6f-6dzhg:/# ls ./root/.ssh
id_rsa  id_rsa.pub
```

