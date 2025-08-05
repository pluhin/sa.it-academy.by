## history
```bash
  498  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
  499  chmod 700 get_helm.sh
  500  ./get_helm.sh
  501  helm install --name my-release   --set postgresql.persistence.enabled=false   --set ingress.enabled=true   --set ingress.hosts=[{"host": "wiki.k8s-9.sa", "paths": ["/"]}]
  502      requarks/wiki
  503  helm install --name my-release   --set postgresql.persistence.enabled=false   --set ingress.enabled=true   --set ingress.hosts=[{"host": "wiki.k8s-9.sa", "paths": ["/"]}]     requarks/wiki
  504  helm install wiki --set postgresql.persistence.enabled=false   --set ingress.enabled=true   --set ingress.hosts=[{"host": "wiki.k8s-9.sa", "paths": ["/"]}]     requarks/wiki
  505  helm repo add requarks https://charts.js.wiki
  506  helm repo add requarks https://charts.js.wiki
  507  helm install wiki --set postgresql.persistence.enabled=false   --set ingress.enabled=true   --set ingress.hosts=[{"host": "wiki.k8s-9.sa", "paths": ["/"]}]     requarks/wiki
  508  helm install wiki --set postgresql.persistence.enabled=false   --set ingress.enabled=true   --set ingress.hosts='[{"host": "wiki.k8s-9.sa", "paths": ["/"]}]'     requarks/wiki
  509  ls
  510  ls
  511  nano values.yml
  512  helm install wiki -f values.yml requarks/wiki
  513  nano values.yml
  514  nano values.yml
  515  helm install wiki   --set postgresql.persistence.enabled=false   --set ingress.enabled=true   --set ingress.hosts[0].host=wiki.k8s-9.sa   --set ingress.hosts[0].paths[0].path=/   --set ingress.hosts[0].paths[0].pathType=Prefix   requarks/wiki
  516  kubectl get pods -A
  517  kubectl get pods -A
  518  kubectl get pods -A
  519  kubectl get pods -A
  520  kubectl get pods -A
  521  kubectl get pods -A
  522  kubectl get pods -A
  523  kubectl get pods -A
  524  kubectl get pods -A
  525  kubectl describe pod wiki-8b87c59cf-rnlv8
  526  kubectl get pods -A
  527  curl http://wiki.k8s-9.sa
  528  kubectl get pods -A
  529  kubectl logs wiki-8b87c59cf-rnlv8 -A
  530  kubectl logs wiki-8b87c59cf-rnlv8
  531  kubectl get ingress
  532  kubectl get ingress wiki -o yaml
  533  kubectl get ingress nginx -o yaml
  534  kubectl get ingress nginx-ingress -o yaml
  535  kubectl get ingress wiki -o yaml
  536  kubectl get pods -A
  537  kubectl get pods ingress-nginx -o yaml
  538  kubectl get pods ingress-nginx-controller-5b89d58656-c6jzb -n ingress-nginx -o yaml
  539  kubectl get deployments -A
  540  kubectl get deployment ingress-nginx-controller -n ingress-nginx
  541  kubectl get deployment ingress-nginx-controller -n ingress-nginx -o yaml
  542  kubectl get ingress wiki -o yaml
  543  ls
  544  nano values.yml
  545  kubectl get ingress ingress-nginx -o yaml
  546  kubectl get ingress nginx-ingress -o yaml
  547  helm install wiki   --set postgresql.persistence.enabled=false   --set ingress.enabled=true   --set ingress.hosts[0].host=wiki.k8s-9.sa   --set ingress.hosts[0].paths[0].path=/   --set ingress.hosts[0].paths[0].pathType=Prefix   --set ingress.annotations."kubernetes\.io/ingress\.class"=nginx   requarks/wiki
  548  helm uninstall wiki
  549  helm install wiki   --set postgresql.persistence.enabled=false   --set ingress.enabled=true   --set ingress.hosts[0].host=wiki.k8s-9.sa   --set ingress.hosts[0].paths[0].path=/   --set ingress.hosts[0].paths[0].pathType=Prefix   --set ingress.annotations."kubernetes\.io/ingress\.class"=nginx   requarks/wiki
  550  kubectl get ingress wiki -o yaml
  551  kubectl get ingress wiki -o yaml
  552  kubectl get ingress wiki -o yaml
  553  kubectl get ingress wiki -o yaml
  554  kubectl get controller -A
  555  kubectl get deployments -A
  556  kubectl get deployment ingress-nginx-controller -n ingress-nginx
  557  kubectl get deployment ingress-nginx-controller -n ingress-nginx -o yaml
  558  kubectl get ingress ingress-nginx -o yaml
  559  kubectl get ingress ingres-nginx -o yaml
  560  kubectl get ingress ingress-nginx -o yaml -a ingress-nginx
  561  kubectl get ingress nginx-ingress -o yaml
  562  kubectl get ingress wiki -o yaml
  563  helm uninstall wiki
  564  helm install wiki   --set postgresql.persistence.enabled=false   --set ingress.enabled=true   --set ingress.hosts[0].host=wiki.k8s-9.sa   --set ingress.hosts[0].paths[0].path=/   --set ingress.hosts[0].paths[0].pathType=Prefix   --set ingress.className=nginx   --set ingress.annotations."nginx\.ingress\.kubernetes\.io/server-alias"="nginx-test.k8s-9.sa"
  565    requarks/wiki
  566  helm install wiki   --set postgresql.persistence.enabled=false   --set ingress.enabled=true   --set ingress.hosts[0].host=wiki.k8s-9.sa   --set ingress.hosts[0].paths[0].path=/   --set ingress.hosts[0].paths[0].pathType=Prefix   --set ingress.className=nginx   --set ingress.annotations."nginx\.ingress\.kubernetes\.io/server-alias"="wiki.k8s-9.sa" \
  567    requarks/wiki
  568  ls
  569  kubectl get pods
  570  kubectl get pods -A
  571  kubectl get pods -n ingress-nginx ingress-nginx-controller-5b89d58656-c6jzb
  572  kubectl get pods -n ingress-nginx ingress-nginx-controller-5b89d58656-c6jzb -o yaml
  573  helm install wiki   --set postgresql.persistence.enabled=false   --set ingress.enabled=true   --set ingress.className=nginx   --set ingress.annotations."nginx\.ingress\.kubernetes\.io/server-alias"="wiki.k8s-9.sa"   --set ingress.hosts[0].host=wiki.k8s-9.sa   --set ingress.hosts[0].paths[0].path=/   --set ingress.hosts[0].paths[0].pathType=Prefix   requarks/wiki
  574  kubectl get ingress wiki -o yaml
  575  kubectl get ingress wiki -o yaml
  576  kubectl get ingress wiki -o yaml
  577  kubectl get ingress wiki -o yaml
  578  history
```
## curl
t1wg@DESKTOP-ISPH4QI:~$ curl wiki.k8s-9.sa
<!DOCTYPE html><html><head><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta charset="UTF-8"><meta name="viewport" content="user-scalable=yes, width=device-width, initial-scale=1, maximum-scale=5"><meta name="theme-color" content="#1976d2"><meta name="msapplication-TileColor" content="#1976d2"><meta name="msapplication-TileImage" content="/_assets/favicons/mstile-150x150.png"><title>Wiki.js Setup</title><link rel="apple-touch-icon" sizes="180x180" href="/_assets/favicons/apple-touch-icon.png"><link rel="icon" type="image/png" sizes="192x192" href="/_assets/favicons/android-chrome-192x192.png"><link rel="icon" type="image/png" sizes="32x32" href="/_assets/favicons/favicon-32x32.png"><link rel="icon" type="image/png" sizes="16x16" href="/_assets/favicons/favicon-16x16.png"><link rel="mask-icon" href="/_assets/favicons/safari-pinned-tab.svg" color="#1976d2"><link rel="manifest" href="/_assets/manifest.json"><script>var siteConfig = {"title":"Wiki.js"}
</script><link type="text/css" rel="stylesheet" href="/_assets/css/setup.22871ffac1b643eed4d9.css"><script type="text/javascript" src="/_assets/js/runtime.js?1742780132"></script><script type="text/javascript" src="/_assets/js/setup.js?1742780132"></script></head><body><div id="root"><setup wiki-version="2.5.307"></setup></div></body></html>
