
## Log monitoring

### Metric server changes

```yaml
...
spec:
      containers:
      - args:
        - --cert-dir=/tmp
        - --secure-port=4443
        - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
        - --kubelet-use-node-status-port
        - --metric-resolution=15s
        - --kubelet-insecure-tls    #### <==  this line was added
        image: k8s.gcr.io/metrics-server/metrics-server:v0.6.1
        imagePullPolicy: IfNotPresent
        livenessProbe:
          failureThreshold: 3
          httpGet:
            path: /livez
            port: https
            scheme: HTTPS
          periodSeconds: 10
...
```


### Grafana changes

```json
            {
               "access":"proxy",
                "editable": true,
                "name": "loki-helm",
                "orgId": 1,
                "type": "loki",
                "url": "http://loki-helm:3100",
                "version": 1
            }
```

here `loki-helm` - name of your service in namespace which you deployed grafana

### History

```bash
843  kubectl get pods
  844  kubectl logs webserver-9bd599dfb-r7766
  845  kubectl get pods -n ci-cd
  846  kubectl logs jenkins-565d77b6b9-7j2r5 -n ci-cd
  847  kubectl logs jenkins-565d77b6b9-7j2r5 -n ci-cd  | grep "WARNING"
  848  cd ../
  849  mkdir log
  850  cd log
  851  kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/metrics-server-helm-chart-3.8.2/components.yaml
  852  kubectl delete -f https://github.com/kubernetes-sigs/metrics-server/releases/download/metrics-server-helm-chart-3.8.2/components.yaml
  853  wget https://github.com/kubernetes-sigs/metrics-server/releases/download/metrics-server-helm-chart-3.8.2/components.yaml -O ms.yaml
  854  vim ms.yaml
  855  kubectl apply -f  ms.yaml
  856  cp ms.yaml /vagrant/
  857  kubectl apply -f  ms.yaml
  858  vim ms.yaml
  859  history | grep  argo
  860  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  861  :ns
  862  vim ../monitor/grafana.yaml
  863  kubectl apply -f ../monitor/grafana.yaml
  864  kubectl logs webserver-9bd599dfb-r7766
  865  cp -r ../log /vagrant/
  866  history
```