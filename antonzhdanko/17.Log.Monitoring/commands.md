# Commands used for Homework 17

```bash
# Deploy the resources
kubectl apply -k . --context k8s

# Check the Pods
kubectl get pods -n homework-17 -o wide --context k8s

# Read logs from one Pod
kubectl logs -n homework-17 <log-generator-pod> --context k8s | head -n 10

# Read logs from every Pod selected by the label
kubectl logs -n homework-17 -l app=log-generator \
  --all-containers=true --prefix=true --context k8s

# Follow Deployment logs in real time (stop with Ctrl+C)
kubectl logs -n homework-17 -f deployment/log-generator \
  --all-containers=true --prefix=true --context k8s

# Read the logs of the previous failed container
kubectl logs -n homework-17 failing-pod --previous --context k8s

# Run these commands on the Kubernetes node
sudo ls -l /var/log/containers/ | grep homework-17
sudo tail -n 10 /var/log/containers/*homework-17*.log
sudo journalctl -u kubelet -n 20 --no-pager
```
