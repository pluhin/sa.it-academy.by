## Overview
Improved Nginx deployment with:
- Init container generating `index.html` showing Pod hostname
- SealedSecret storing SSH key pair mounted into `/root/.ssh`

## Steps Performed

1. **Install Sealed Secrets controller**
```bash
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.33.1/controller.yaml
```
2. **Install kubeseal**
```bash
curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.33.1/kubeseal-0.33.1-linux-amd64.tar.gz"
tar -xvzf kubeseal-0.33.1-linux-amd64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal
```
3. **Generate SSH key pair**
```bash
ssh-keygen -t rsa -b 4096 -m PEM -f id_rsa -N ""
```
4. **Create Kubernetes Secret from keys**
```bash
kubectl create secret generic nginx-ssh-keys \
  --from-file=id_rsa=./id_rsa \
  --from-file=id_rsa.pub=./id_rsa.pub \
  --dry-run=client -o yaml > secret-ssh-keys.yaml
```
5. **Seal the Secret**
```bash
kubeseal --format yaml < secret-ssh-keys.yaml > sealedsecret-ssh-keys.yaml
kubectl apply -f sealedsecret-ssh-keys.yaml
```
file: `sealedsecret-ssh-keys.yaml`

6. **Update Deployment** (file: `nginx-server.yaml`)
	- Added init container to generate `index.html` with Pod hostname.
	- Mounted Secret `nginx-ssh-keys` into `/root/.ssh`.
	```bash
	kubectl apply -f nginx-server.yaml
	```

7. Validation
	-  Check keys inside Pod:
	```bash
	kubectl exec -it <pod_name> -- ls -l /root/.ssh
	```
	Result: file: `keys.png`
	- Check generate index.html with pod-name head:
	files:
		- `pod1.png`
		- `pod2.png`
		- `pod3.png`
		- `pod4.png`