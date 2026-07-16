# 12. Kubernetes data and security

## Result

The Nginx deployment from Homework 11 was extended with generated pod-specific
content and a sealed SSH key pair.

- an init container writes an `index.html` page containing the pod hostname;
- an `emptyDir` volume shares the generated page with Nginx;
- an ED25519 key pair is stored in a `SealedSecret`;
- the controller decrypts it to a namespace-scoped Secret inside the cluster;
- the keys are mounted read-only at `/root/.ssh`;
- no plaintext private key or Kubernetes Secret is stored in Git.

The deployment keeps the four replicas, resource limits, health probes,
zero-downtime update strategy and Istio routing from the previous homework.

## Sealed Secrets

Sealed Secrets controller `v0.38.4` was installed in `kube-system`. The key pair
was generated only for this homework and sealed with strict name/namespace scope
for Secret `root-ssh-keys` in namespace `homework-12`.

Public key fingerprint:

```text
SHA256:7rqdRlHFuTEVEcLD/OaFqgxo7or10JrPuoAZxlBVb6k
```

## Deploy

```bash
kubectl apply --context k8s -k .
kubectl rollout status --context k8s -n homework-12 deployment/nginx
```

## Validate

```bash
kubectl get pods --context k8s -n homework-12 -o wide
kubectl get sealedsecret,secret --context k8s -n homework-12

pod=$(kubectl get pods --context k8s -n homework-12 \
  -l app=nginx -o jsonpath='{.items[0].metadata.name}')

kubectl exec --context k8s -n homework-12 "$pod" -c nginx -- \
  cat /usr/share/nginx/html/index.html

kubectl exec --context k8s -n homework-12 "$pod" -c nginx -- \
  stat -Lc '%n mode=%a bytes=%s' \
  /root/.ssh/id_ed25519 /root/.ssh/id_ed25519.pub

curl --resolve nginx-test.k8s-3.sa:80:178.124.206.53 \
  http://nginx-test.k8s-3.sa/
```

## Validation result

All four pods are Running and distributed evenly between `node1` and `node2`.
Each pod generated a different first-level header, for example:

```html
<h1>Pod hostname: nginx-7597bdf457-5cp9h</h1>
<h1>Pod hostname: nginx-7597bdf457-j5tbj</h1>
<h1>Pod hostname: nginx-7597bdf457-jbpgw</h1>
<h1>Pod hostname: nginx-7597bdf457-rpb4j</h1>
```

The controller successfully unsealed a Secret containing two data entries. The
mounted files were checked without printing their contents:

```text
/root/.ssh/id_ed25519 mode=400 bytes=419
/root/.ssh/id_ed25519.pub mode=444 bytes=104
key-format=valid
```

Requests through `nginx-test.k8s-3.sa` returned HTTP 200 and reached all four
pod hostnames.
