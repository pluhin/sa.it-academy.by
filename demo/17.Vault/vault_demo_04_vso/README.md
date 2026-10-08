# Demo 4 — Vault Secrets Operator (VSO)

Needs demo 2 done.

## 1. Install VSO

```bash
git clone --depth 1 --branch v1.6.0 https://github.com/hashicorp/vault-secrets-operator.git

helm install vault-secrets-operator ./vault-secrets-operator/chart \
  -n vault-secrets-operator-system --create-namespace

kubectl -n vault-secrets-operator-system get pods
kubectl get crd | grep secrets.hashicorp.com
```

## 2. Prepare Vault

```bash
export VAULT_TOKEN=$(python3 -c "import json;print(json.load(open('vault-init.json'))['root_token'])")
v() { kubectl -n vault exec vault-0 -- env VAULT_TOKEN="$VAULT_TOKEN" VAULT_ADDR=http://127.0.0.1:8200 "$@"; }

v vault kv put secret/app/db username=alice password=s3cret
```

```bash
kubectl -n vault exec -i vault-0 -- env VAULT_TOKEN="$VAULT_TOKEN" VAULT_ADDR=http://127.0.0.1:8200 sh -c 'cat > /tmp/p.hcl <<HCL
path "secret/data/app/*" { capabilities = ["read"] }
HCL
vault policy write app-read /tmp/p.hcl'
```

```bash
v vault write auth/kubernetes/role/vso-app \
  bound_service_account_names=vso-app \
  bound_service_account_namespaces=vso-demo \
  policies=app-read ttl=1h
```

## 3. Apply, in order

```bash
kubectl apply -f 00-namespace.yaml
kubectl apply -f 01-vault-connection.yaml
kubectl apply -f 02-vault-auth.yaml
kubectl apply -f 03-vault-static-secret.yaml
kubectl apply -f 04-app-deployment.yaml
```

## 4. Check

```bash
kubectl -n vso-demo get vaultstaticsecret app-db
kubectl -n vso-demo get secret app-db
kubectl -n vso-demo get secret app-db -o jsonpath='{.data.password}' | base64 -d ; echo
kubectl -n vso-demo exec deploy/vso-app -- printenv | grep -E 'username|password'
```

## 5. Rotation

```bash
kubectl -n vault exec vault-0 -- vault kv put secret/app/db username=alice password=NEWpass

watch -n2 "kubectl -n vso-demo get secret app-db -o jsonpath='{.data.password}' | base64 -d"
```

The k8s Secret updates in about 10 seconds. Now look inside the running Pod:

```bash
kubectl -n vso-demo exec deploy/vso-app -- printenv | grep password
```

Still the old value. Environment variables are fixed when the process starts.

```bash
kubectl -n vso-demo rollout restart deploy/vso-app
kubectl -n vso-demo exec deploy/vso-app -- printenv | grep password
```

## Clean up

```bash
kubectl delete -f 04-app-deployment.yaml -f 03-vault-static-secret.yaml \
  -f 02-vault-auth.yaml -f 01-vault-connection.yaml -f 00-namespace.yaml
```
