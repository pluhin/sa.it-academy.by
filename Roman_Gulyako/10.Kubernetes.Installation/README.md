##### Pods list from k9s:
files: `all_pods_k3s.jpg`, `all_pods_k8s.jpg`

##### Deploy shell pod in default namespace
file: `shell-pod.yaml`
command: 
```bash
kubectl --context=k8s apply -f shell-pod.yaml
```

##### Monitoring of cluster:
file: `pod-monitor.yaml`
GitHub repository: https://github.com/romangulyako/k8s-homework