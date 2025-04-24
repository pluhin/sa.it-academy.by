# 11. Kubernetes. Basic objects

## Homework Assignment 1. Nginx deployment
1. Create ingress-controller.yaml and make some changes (Port 30001)
2. Create nginx-deployment.yaml
3. Run ingress-controller.yaml
```
debian@vbox ~/i/11.K8s (master)> kubectl apply -f ingress-controller.yaml
namespace/ingress-nginx created
serviceaccount/ingress-nginx created
serviceaccount/ingress-nginx-admission created
role.rbac.authorization.k8s.io/ingress-nginx created
role.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrole.rbac.authorization.k8s.io/ingress-nginx created
clusterrole.rbac.authorization.k8s.io/ingress-nginx-admission created
rolebinding.rbac.authorization.k8s.io/ingress-nginx created
rolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
configmap/ingress-nginx-controller created
service/ingress-nginx-controller created
service/ingress-nginx-controller-admission created
deployment.apps/ingress-nginx-controller created
job.batch/ingress-nginx-admission-create created
job.batch/ingress-nginx-admission-patch created
ingressclass.networking.k8s.io/nginx created
validatingwebhookconfiguration.admissionregistration.k8s.io/ingress-nginx-admission created
```
4. Make some changes in /etc/hosts.
5. Run nginx-deployment.yaml
```
debian@vbox ~/i/11.K8s (master)> kubectl apply -f nginx-deployment.yaml
deployment.apps/nginx-deployment created
service/nginx-service created
ingress.networking.k8s.io/nginx-ingress created
```
6. Open a browser (in my case Mozila) and go to: nginx-test.k8s-19.sa  
Actual result: Welcome nginx window was opened. Evidence of testing are attached in my commit.
