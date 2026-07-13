# 11. Kubernetes basic objects

## Result

Nginx is deployed to the Kubespray cluster with four replicas and is available
through the academy bastion at:

- `http://nginx-test.k8s-3.sa`
- `http://nginx-test.k8s-4.sa`

The manifests provide:

- four Nginx replicas;
- CPU and memory requests and limits;
- readiness and liveness probes;
- a rolling update strategy with `maxUnavailable: 0`;
- a graceful shutdown delay for endpoint propagation;
- pod spreading between cluster nodes;
- a PodDisruptionBudget that keeps at least three replicas available;
- a ClusterIP Service and Istio Gateway/VirtualService routing.

Istio `1.30.2` was installed with the `demo` profile after a successful
`istioctl x precheck`. The ingress gateway HTTP service uses NodePort `30001`,
which is the port forwarded by the academy bastion.

## Deploy

```bash
kubectl apply --context k8s -k .
kubectl rollout status --context k8s -n homework-11 deployment/nginx
kubectl get pods --context k8s -n homework-11 -o wide
```

## Validate

```bash
kubectl get deployment,service,pdb --context k8s -n homework-11
curl --resolve nginx-test.k8s-3.sa:80:178.124.206.53 \
  http://nginx-test.k8s-3.sa/
```

## Availability check

During an image update Kubernetes creates a new ready pod before removing an old
one. The following commands can be used to watch the update and continuously
check that the service remains available:

```bash
kubectl rollout restart --context k8s -n homework-11 deployment/nginx
kubectl rollout status --context k8s -n homework-11 deployment/nginx
```

Validation output from the completed deployment is recorded below.

```text
deployment.apps/nginx   4/4   4   4

pod distribution:
node1: 2
node2: 2

service/nginx endpoints: 4
poddisruptionbudget/nginx min available: 3

nginx-test.k8s-3.sa HTTP status: 200
nginx-test.k8s-4.sa HTTP status: 200

rolling update availability test:
deployment "nginx" successfully rolled out
requests=111 failures=0
```
