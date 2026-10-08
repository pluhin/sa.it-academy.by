# Vault CLI cheatsheet

Все примеры предполагают, что переменные окружения заданы:

```bash
export VAULT_ADDR=http://127.0.0.1:8200
export VAULT_TOKEN=root   # только для dev-mode!
```

## Состояние и здоровье

```bash
vault status
vault read sys/health
vault audit list
```

## KV v2 (key-value)

```bash
# В dev-mode "secret/" — это уже kv v2
vault kv put secret/app/db user=alice password=s3cret
vault kv get secret/app/db
vault kv get -field=password secret/app/db
vault kv list secret/app
vault kv get -version=1 secret/app/db        # старая версия
vault kv delete secret/app/db                # soft delete
vault kv undelete -versions=2 secret/app/db
vault kv destroy -versions=1 secret/app/db   # hard delete версии
vault kv metadata get secret/app/db
```

Включить отдельный mount kv v2:

```bash
vault secrets enable -path=apps -version=2 kv
vault kv put apps/web/api token=abc123
```

## Policies

```bash
cat > read-only.hcl <<'EOF'
path "secret/data/app/*" {
  capabilities = ["read", "list"]
}
path "secret/metadata/app/*" {
  capabilities = ["read", "list"]
}
EOF

vault policy write app-read read-only.hcl
vault policy list
vault policy read app-read
```

## AppRole auth

```bash
vault auth enable approle

vault write auth/approle/role/app \
  token_policies="app-read" \
  token_ttl=1h \
  token_max_ttl=4h

ROLE_ID=$(vault read -field=role_id auth/approle/role/app/role-id)
SECRET_ID=$(vault write -f -field=secret_id auth/approle/role/app/secret-id)

# Логин по AppRole — получаем client token:
vault write auth/approle/login \
  role_id=$ROLE_ID \
  secret_id=$SECRET_ID
```

## Database secret engine (динамические креды для Postgres)

```bash
vault secrets enable database

# Если запускаем через docker-compose из этой папки — Postgres доступен по hostname "postgres"
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
  default_ttl="30m" \
  max_ttl="2h"

vault read database/creds/app-readonly
# каждый вызов выдаёт нового пользователя/пароль с TTL 30m
```

## Kubernetes auth method (для пода в кластере)

```bash
# Внутри пода Vault или с правами kubectl + service account токеном
vault auth enable kubernetes

vault write auth/kubernetes/config \
  kubernetes_host="https://kubernetes.default.svc:443" \
  kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt \
  token_reviewer_jwt=@/var/run/secrets/kubernetes.io/serviceaccount/token

vault write auth/kubernetes/role/app \
  bound_service_account_names=app \
  bound_service_account_namespaces=default \
  policies=app-read \
  ttl=1h
```

После этого pod c serviceAccount=`app` в namespace=`default` сможет получить
токен Vault через Vault Agent Injector.

## Аудит

```bash
vault audit enable file file_path=/vault/logs/audit.log
vault audit list
vault audit disable file
```

## Полезные команды для занятия

```bash
# Что лежит на этом mount-пути?
vault list secret/

# Что разрешено текущему токену?
vault token capabilities <PATH>

# Информация по токену
vault token lookup
```
