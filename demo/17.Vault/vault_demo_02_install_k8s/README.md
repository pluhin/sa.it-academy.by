# Demo 2 — Vault in Kubernetes (Helm)

## Install

`helm repo add hashicorp` returns `403` from the academy network, so the chart
comes from GitHub:

```bash
git clone --depth 1 --branch v0.34.1 https://github.com/hashicorp/vault-helm.git

helm install vault ./vault-helm \
  -n vault --create-namespace \
  -f vault-helm-values.yaml

kubectl -n vault get pods
```

`vault-0` stays `0/1 Running` — it is sealed, not broken.

> No default StorageClass in the cluster. Check yours with `kubectl get sc` and
> put it in the values, otherwise the PVC stays `Pending`. Ours is `nfs-client`.

## Init and unseal

```bash
kubectl -n vault exec vault-0 -- vault operator init \
  -key-shares=5 -key-threshold=3 -format=json > vault-init.json
chmod 600 vault-init.json
```

The keys and the root token are printed **once**. Keep `vault-init.json` out of git.

```bash
for i in 0 1 2; do
  KEY=$(python3 -c "import json;print(json.load(open('vault-init.json'))['unseal_keys_b64'][$i])")
  kubectl -n vault exec vault-0 -- vault operator unseal "$KEY" >/dev/null
done

kubectl -n vault get pods
kubectl -n vault exec vault-0 -- vault status
```

Pod goes `1/1`, `Sealed false`, `HA Mode active`.

## kv-v2 and kubernetes auth

```bash
export VAULT_TOKEN=$(python3 -c "import json;print(json.load(open('vault-init.json'))['root_token'])")
v() { kubectl -n vault exec vault-0 -- env VAULT_TOKEN="$VAULT_TOKEN" VAULT_ADDR=http://127.0.0.1:8200 "$@"; }

v vault secrets enable -path=secret -version=2 kv
v vault kv put secret/app/db username=alice password=s3cret
v vault kv get secret/app/db
```

> In Vault 2.x `secret/` is not mounted by default. Skip `secrets enable` and you
> get `403 preflight capability check` — it looks like a permissions problem but
> the path simply does not exist.

Policy:

```bash
kubectl -n vault exec -i vault-0 -- env VAULT_TOKEN="$VAULT_TOKEN" VAULT_ADDR=http://127.0.0.1:8200 sh -c 'cat > /tmp/p.hcl <<HCL
path "secret/data/app/*"     { capabilities = ["read"] }
path "secret/metadata/app/*" { capabilities = ["read","list"] }
HCL
vault policy write app-read /tmp/p.hcl'
```

Kubernetes auth — the API address is read inside the Pod, so it goes through `sh -c`:

```bash
v vault auth enable kubernetes

kubectl -n vault exec vault-0 -- env VAULT_TOKEN="$VAULT_TOKEN" VAULT_ADDR=http://127.0.0.1:8200 \
  sh -c 'vault write auth/kubernetes/config kubernetes_host="https://$KUBERNETES_PORT_443_TCP_ADDR:443"'

v vault write auth/kubernetes/role/vso-app \
  bound_service_account_names=vso-app \
  bound_service_account_namespaces=vso-demo \
  policies=app-read ttl=1h
```

The role command answers with an `audience` warning — the role is created anyway.

## Check

```bash
v vault secrets list
v vault auth list
v vault read auth/kubernetes/role/vso-app
```

## UI

```bash
kubectl -n vault port-forward svc/vault 8200:8200
```
