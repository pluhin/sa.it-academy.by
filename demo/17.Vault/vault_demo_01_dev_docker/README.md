# Demo 1 — Vault dev-mode (Docker Compose)

## Start

```bash
docker compose up -d
docker compose ps
```

Everything below runs inside the Vault container:

```bash
docker compose exec vault sh
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=root
vault status
```

UI: http://localhost:8200 — token `root`.

## kv v2

```bash
vault kv put secret/app/db username=alice password=s3cret
vault kv get secret/app/db
vault kv get -field=password secret/app/db

vault kv put secret/app/db username=alice password=n3w-s3cret
vault kv get -version=1 secret/app/db
vault kv metadata get secret/app/db
```

## delete / undelete / destroy

```bash
vault kv delete secret/app/db
vault kv get secret/app/db

vault kv undelete -versions=2 secret/app/db
vault kv get secret/app/db

vault kv destroy -versions=1 secret/app/db
vault kv get -version=1 secret/app/db
```

## Policy

```bash
cat > /tmp/app-read.hcl <<'EOF'
path "secret/data/app/*" {
  capabilities = ["read"]
}
path "secret/metadata/app/*" {
  capabilities = ["read", "list"]
}
EOF

vault policy write app-read /tmp/app-read.hcl
vault policy read app-read
```

> The policy is written on the API path (`secret/data/...`), not on the CLI path.

## AppRole

```bash
vault auth enable approle

vault write auth/approle/role/app \
  token_policies=app-read \
  token_ttl=20m \
  token_max_ttl=1h

ROLE_ID=$(vault read -field=role_id auth/approle/role/app/role-id)
SECRET_ID=$(vault write -f -field=secret_id auth/approle/role/app/secret-id)

APP_TOKEN=$(vault write -field=token auth/approle/login \
  role_id="$ROLE_ID" secret_id="$SECRET_ID")
```

Switch to that token and check what it can do:

```bash
export VAULT_TOKEN="$APP_TOKEN"

vault token lookup
vault kv get secret/app/db
vault kv put secret/app/db password=hacked
vault kv get secret/other/key

export VAULT_TOKEN=root
```

Read works, the other two return `permission denied`.

## Dynamic database credentials

```bash
vault secrets enable database

vault write database/config/appdb \
  plugin_name=postgresql-database-plugin \
  allowed_roles="app-readonly" \
  connection_url="postgresql://{{username}}:{{password}}@postgres:5432/appdb?sslmode=disable" \
  username="postgres" \
  password="postgres"

vault write database/roles/app-readonly \
  db_name=appdb \
  creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; \
                       GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";" \
  default_ttl="5m" \
  max_ttl="1h"

vault read database/creds/app-readonly
vault read database/creds/app-readonly
```

Two calls, two different users. On the host:

```bash
docker compose exec postgres psql -U postgres -d appdb -c '\du'
```

Then revoke, inside the container:

```bash
vault list sys/leases/lookup/database/creds/app-readonly
vault lease revoke -prefix database/creds/app-readonly
```

Run `\du` again — the users are gone.

## Clean up

```bash
docker compose down -v
```
