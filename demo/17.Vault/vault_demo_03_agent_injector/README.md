# Demo 3 — Vault Agent Injector

Needs demo 2 done: Vault unsealed, `kubernetes` auth and `kv-v2` on `secret`.

## Prepare Vault

The root token is in `vault-init.json` from demo 2 — it was printed once and
there is nowhere else to get it.

```bash
export VAULT_TOKEN=$(python3 -c "import json;print(json.load(open('vault-init.json'))['root_token'])")
v() { kubectl -n vault exec vault-0 -- env VAULT_TOKEN="$VAULT_TOKEN" VAULT_ADDR=http://127.0.0.1:8200 "$@"; }

v vault write auth/kubernetes/role/app \
  bound_service_account_names=app \
  bound_service_account_namespaces=demo \
  policies=app-read ttl=1h
```

> Do not `exec -it ... sh` into the Pod: the variable lives on your machine and
> will not be there. The `v` helper passes it to every command.

## Apply

```bash
kubectl apply -f vault-agent-injector-demo.yaml
kubectl -n demo get pods
kubectl -n demo exec deploy/app -c app -- cat /vault/secrets/db.env
```

The Pod is `2/2` — the app container plus the injected `vault-agent`.

## The file path

`/vault/secrets` is the default, not a fixed location. The injector mounts an
`emptyDir` there; the file name comes from the annotation suffix
(`agent-inject-secret-db.env` → `db.env`).

To change it for all secrets of the Pod:

```yaml
vault.hashicorp.com/secret-volume-path: "/etc/app/secrets"
```

Or for one file only:

```yaml
vault.hashicorp.com/secret-volume-path-db.env: "/etc/app"
```

## Clean up

```bash
kubectl delete -f vault-agent-injector-demo.yaml
```
