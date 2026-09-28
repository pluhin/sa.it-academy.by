# https://github.com/aionfiend/13.K8S.Data

```
492  cd 13.K8S.Data/
498  kubectl apply -f https://github.com/bitnami/sealed-secrets/releases/download/v0.40.0/controller.yaml
499  kubectl get svc -A | grep sealed
500  kubeseal --controller-namespace=kube-system --controller-name=sealed-secrets-controller --fetch-cert > main.pem
504  kubectl create secret generic root-ssh-secret   --from-file=sealk8s=./seal   --from-file=sealk8s.pub=./seal.pub   --dry-run=client -o yaml | kubeseal --format=yaml --cert main.pem > sealedsecret.yaml
505  kubectl get secret root-ssh-secret
506  kubectl apply -f sealedsecret.yaml
507  kubectl get secret root-ssh-secret
509  kubectl apply -f deployment.yaml
510  POD_NAME=$(kubectl get pods -l app=nginx -o jsonpath="{.items.metadata.name}")
511  kubectl exec -it $POD_NAME -- curl localhost
512  kubectl exec -it $POD_NAME -- ls -la /root/.ssh
513  ls -a
514  kubectl get pods -l app=nginx
515  kubectl describe pod nginx-deployment-b49d698d6-hgjtv
516  kubectl get nodes
517  colima stop
518  colima start
519  kubectl get nodes
520  kubectl get pods -l app=nginx
522  POD_NAME=$(kubectl get pods -l app=nginx -o jsonpath="{.items.metadata.name}")
524  kubectl exec -it $POD_NAME -- curl localhost
525  kubectl exec -it $POD_NAME -- ls -la /root/.ssh
526  kubectl exec -it $POD_NAME -- ls -la /root/.seal

530  kubectl logs nginx-deployment-9475c97b5-fmf5d -c init-html
531  kubectl logs nginx-deployment-9475c97b5-fmf5d -c istio-init

536  kubectl logs -n kube-system -l app.kubernetes.io/name=sealed-secrets-controller
537  POD_NAME=nginx-deployment-9475c97b5-lf5rt
538  kubectl exec -it $POD_NAME -- curl localhost
539  kubectl exec -it $POD_NAME -- ls -la /root/.ssh
540  kubectl exec -it nginx-deployment-9475c97b5-fmf5d -c nginx -- sh -c "echo '=== INDEX.HTML ===' && curl -s localhost && echo '=== SSH KEYS ===' && ls -la /root/.ssh"
543  kubectl get endpoints nginx-service
546  colima list
548  kubectl apply -f app.yaml
549  kubectl apply -f sealedsecret.yaml
550  kubectl apply -f gateway.yaml
551  kubectl apply -f virtualservice.yaml
552  kubectl port-forward -n istio-system svc/istio-ingressgateway 8080:80
553  kubectl port-forward -n istio-system svc/istio-ingressgateway 8080:80
```