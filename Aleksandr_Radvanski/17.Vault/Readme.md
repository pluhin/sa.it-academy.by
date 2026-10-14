#Task №1

    1.1. docker compose ps
``````
NAME            IMAGE                  COMMAND                  SERVICE    CREATED              STATUS                        PORTS
vault-demo-pg   postgres:16            "docker-entrypoint.s…"   postgres   About a minute ago   Up About a minute (healthy)   0.0.0.0:5432->5432/tcp, [::]:5432->5432/tcp
vault-dev       hashicorp/vault:1.17   "docker-entrypoint.s…"   vault      About a minute ago   Up About a minute (healthy)   0.0.0.0:8200->8200/tcp, [::]:8200->8200/tcp
```

    1.2. docker compose exec vault sh
```
/ # export VAULT_ADDR=http://127.0.0.1:8200
/ # export VAULT_TOKEN=********
/ # vault status

Key             Value
---             -----
Seal Type       shamir
Initialized     true
Sealed          false
Total Shares    1
Threshold       1
Version         1.17.6
Build Date      2024-09-24T19:48:40Z
Storage Type    inmem
Cluster Name    vault-cluster-********
Cluster ID      ********-****-****-****-********
HA Enabled      false
• Vault не герметичен (Sealed: false). В режиме разработки Vault автоматически инициализируется и распечатывается (unsealed) при старте, используя всего 1 ключ (шару), чтобы разработчику не приходилось делать это вручную.
• Используется inmem (In-Memory). Это встроенное хранилище в оперативной памяти. Оно идеально подходит для разработки и тестирования, так как работает максимально быстро,но все данные будут безвозвратно удалены при остановке или перезапуске контейнера.
• Для продуктового акружения требуется использовать регулярное хранилище (Storage Type: file или raft) и провести процедуру распечатывания (Unsealing) с использованием нескольких ключей.
```

    1.3. vault kv put secret/app/db username=******** password=********   | vault kv put secret/app/db username=******** password=********
```
=== Secret Path ===                                                 | === Secret Path ===
secret/data/app/db                                                  | secret/data/app/db


======= Metadata =======                                            | ======= Metadata =======
Key                Value                                            | Key                Value
---                -----                                            | ---                -----
created_time       2026-10-11T12:01:43.405560179Z                   | created_time       2026-10-11T12:05:27.226884315Z
custom_metadata    <nil>                                            | custom_metadata    <nil>
deletion_time      n/a                                              | deletion_time      n/a
destroyed          false                                            | destroyed          false
version            1                                                | version            2
```


    1.4.  vault kv get secret/app/db & vault kv get -version=1 secret/app/db - данные одинаковые. | vault kv get -version=2 secret/app/db
```
=== Secret Path ===
secret/data/app/db

======= Metadata =======
Key                Value
---                -----
created_time       2026-10-11T12:01:43.405560179Z
custom_metadata    <nil>
deletion_time      n/a
destroyed          false
version            1

====== Data ======                                                                              | ====== Data ======
Key         Value                                                                               | Key         Value
---         -----                                                                               | ---         -----
password    ********                                                                            | password    ********
username    ********                                                                            | username    ********
```

    1.5. vault kv get -field=password secret/app/db
```
********
```

    1.6. vault kv metadata get secret/app/db
```
==== Metadata Path ====
secret/metadata/app/db

========== Metadata ==========
Key                     Value
---                     -----
cas_required            false
created_time            2026-10-11T12:01:43.405560179Z
current_version         2
custom_metadata         <nil>
delete_version_after    0s
max_versions            0
oldest_version          0
updated_time            2026-10-11T12:05:27.226884315Z

====== Version 1 ======
Key              Value
---              -----
created_time     2026-10-11T12:01:43.405560179Z
deletion_time    n/a
destroyed        false

====== Version 2 ======
Key              Value
---              -----
created_time     2026-10-11T12:05:27.226884315Z
deletion_time    n/a
destroyed        false
```


    1.7. vault kv delete secret/app/db
Success! Data deleted (if it existed) at: secret/data/app/db
vault kv get secret/app/db
=== Secret Path ===
secret/data/app/db

======= Metadata =======
Key                Value
---                -----
created_time       2026-10-11T12:05:27.226884315Z
custom_metadata    <nil>
deletion_time      2026-10-11T12:19:05.350562634Z
destroyed          false
version            2
```


    1.8. vault kv undelete -versions=2 secret/app/db
```
Success! Data written to: secret/undelete/app/db
vault kv get secret/app/db
=== Secret Path ===
secret/data/app/db

======= Metadata =======
Key                Value
---                -----
created_time       2026-10-11T12:05:27.226884315Z
custom_metadata    <nil>
deletion_time      n/a
destroyed          false
version            2

====== Data ======
Key         Value
---         -----
password    ********
username    ********
```
    1.9. vault kv destroy -versions=1 secret/app/db
```
Success! Data written to: secret/destroy/app/db
vault kv get -version=1 secret/app/db
=== Secret Path ===
secret/data/app/db

======= Metadata =======
Key                Value
---                -----
created_time       2026-10-11T12:01:43.405560179Z
custom_metadata    <nil>
deletion_time      n/a
destroyed          true
version            1

Вывод:
vault kv delete	Данные скрываются (помечаются как удаленные).
vault kv undelete	Секрет возвращается в активное состояние.	Данные снова доступны.
vault kv destroy	Данные физически и навсегда стираются из хранилища.	Восстановить невозможно.
```

    2.1. cat > /tmp/app-read.hcl 
```    
<<'EOF'
> path "secret/data/app/*" {
>   capabilities = ["read"]
> }
> path "secret/metadata/app/*" {
>   capabilities = ["read", "list"]
> }
> EOF

/ # vault policy write app-read /tmp/app-read.hcl
Success! Uploaded policy: app-read
/ # vault policy read app-read
path "secret/data/app/*" {
capabilities = ["read"]
}
path "secret/metadata/app/*" {
capabilities = ["read", "list"]
}
/ # vault token create -policy=app-reader-policy
WARNING! The following warnings were returned from Vault:

* Policy "app-reader-policy" does not exist

Key                  Value
---                  -----
token                hvs.********
token_accessor       ********
token_duration       768h
token_renewable      true
token_policies       ["app-reader-policy" "default"]
identity_policies    []
policies             ["app-reader-policy" "default"]
/ # export VAULT_TOKEN="hvs.********
/ # vault kv get secret/app/my-service
Error making API request.

URL: GET http://127.0.0.1:8200/v1/sys/internal/ui/mounts/secret/app/my-service
Code: 403. Errors:

* preflight capability check returned 403, please ensure client's policies grant access to path "secret/app/my-service/"
  / # vault kv get secret/data/app/
  Error making API request.

URL: GET http://127.0.0.1:8200/v1/sys/internal/ui/mounts/secret/data/app
Code: 403. Errors:

* preflight capability check returned 403, please ensure client's policies grant access to path "secret/data/app/"
  / # vault kv get secret/data/app
  Error making API request.

URL: GET http://127.0.0.1:8200/v1/sys/internal/ui/mounts/secret/data/app
Code: 403. Errors:

* preflight capability check returned 403, please ensure client's policies grant access to path "secret/data/app/"
  / # vault policy list
  Error listing policies: Error making API request.

URL: GET http://127.0.0.1:8200/v1/sys/policies/acl?list=true
Code: 403. Errors:

* 1 error occurred:
    * permission denied


/ # vault kv get /tmp/app-read.hcl
Error making API request.

URL: GET http://127.0.0.1:8200/v1/sys/internal/ui/mounts/tmp/app-read.hcl
Code: 403. Errors:

* preflight capability check returned 403, please ensure client's policies grant access to path "tmp/app-read.hcl/"
  / #
  / # vault kv get app-read
  Error making API request.

URL: GET http://127.0.0.1:8200/v1/sys/internal/ui/mounts/app-read
Code: 403. Errors:

* preflight capability check returned 403, please ensure client's policies grant access to path "app-read/"
  / # vault token create -policy=app-read
  Error creating token: Error making API request.

URL: POST http://127.0.0.1:8200/v1/auth/token/create
Code: 403. Errors:

* 1 error occurred:
    * permission denied


/ # export VAULT_TOKEN="********"
/ # export VAULT_TOKEN="********"
/ # vault token create -policy=app-read

Key                  Value
---                  -----
token                hvs.********
token_accessor       ********
token_duration       768h
token_renewable      true
token_policies       ["app-read" "default"]
identity_policies    []
policies             ["app-read" "default"]
/ # export VAULT_TOKEN="hvs.********"
/ # vault kv get secret/app/config
No value found at secret/data/app/config
/ # vault kv get /tmp/app-read.hcl
Error making API request.

URL: GET http://127.0.0.1:8200/v1/sys/internal/ui/mounts/tmp/app-read.hcl
Code: 403. Errors:

* preflight capability check returned 403, please ensure client's policies grant access to path "tmp/app-read.hcl/"
  / # vault kv put secret/app/config key=value
  Error writing data to secret/data/app/config: Error making API request.

URL: PUT http://127.0.0.1:8200/v1/secret/data/app/config
Code: 403. Errors:

* 1 error occurred:
    * permission denied


/ #
/ # export VAULT_TOKEN="********"
/ # vault kv put secret/app/config key=value
===== Secret Path =====
secret/data/app/config

======= Metadata =======
Key                Value
---                -----
created_time       2026-10-11T13:16:17.555793467Z
custom_metadata    <nil>
deletion_time      n/a
destroyed          false
version            1
/ # vault kv get /tmp/app-read.hcl
Error making API request.

URL: GET http://127.0.0.1:8200/v1/sys/internal/ui/mounts/tmp/app-read.hcl
Code: 403. Errors:

* preflight capability check returned 403, please ensure client's policies grant access to path "tmp/app-read.hcl/"
```

    2.2. vault auth enable approle
```
Success! Enabled approle auth method at: approle/
/ # vault write auth/approle/role/app-role >     secret_id_ttl="10m" >     token_ttl="10m" >     token_max_ttl="20m" >     token_policies="app-read"
Success! Data written to: auth/approle/role/app-role
/ # vault read auth/approle/role/app-role/role-id

Key        Value
---        -----
role_id    ********-****-****-****-********
/ # vault write -f auth/approle/role/app-role/secret-id
Key                   Value
---                   -----
secret_id             ********-****-****-****-********
secret_id_accessor    ********-****-****-****-********
secret_id_num_uses    0
secret_id_ttl         10m
/ # vault write auth/approle/login role_id="********-****-****-****-********" secret_id="********-****-****-****-********"
Key                     Value
---                     -----
token                   hvs.********
token_accessor          ********
token_duration          10m
token_renewable         true
token_policies          ["app-read" "default"]
identity_policies       []
policies                ["app-read" "default"]
token_meta_role_name    app-role
/ # export VAULT_TOKEN="hvs.********"
/ # vault kv get secret/app/db
=== Secret Path ===
secret/data/app/db

======= Metadata =======
Key                Value
---                -----
created_time       2026-10-11T12:05:27.226884315Z
custom_metadata    <nil>
deletion_time      n/a
destroyed          false
version            2

====== Data ======
Key         Value
---         -----
password    ********
username    ********
/ # vault kv put secret/app/db password="123"
Error writing data to secret/data/app/db: Error making API request.

URL: PUT http://127.0.0.1:8200/v1/secret/data/app/db
Code: 403. Errors:

* 1 error occurred:
    * permission denied


/ # vault kv get secret/prod/billing
Error reading secret/data/prod/billing: Error making API request.

URL: GET http://127.0.0.1:8200/v1/secret/data/prod/billing
Code: 403. Errors:

* 1 error occurred:
    * permission denied


/ # vault token lookup
Key                 Value
---                 -----
accessor            ********
creation_time       1791725229
creation_ttl        10m
display_name        approle
entity_id           ********-****-****-****-********
expire_time         2026-10-11T13:37:09.192032411Z
explicit_max_ttl    0s
id                  hvs.********
issue_time          2026-10-11T13:27:09.192037144Z
meta                map[role_name:app-role]
num_uses            0
orphan              true
path                auth/approle/login
policies            [app-read default]
renewable           true
ttl                 7m59s
type                service

Выаод:
1. Запуск Vault в режиме разработчика (vault server -dev) создан исключительно для локального тестирования и автоматизации в CI/CD.
   1.1.Хранение данных в оперативной памяти (inmem).
   1.2.Автоматическое распечатывание (No Unseal).
   1.3.Корневой токен фиксирован и отображается в логах.
   1.4.Отключение TLS (Шифрования трафика).
   2.Корневой токен (Root Token) обладает абсолютными правами (суперпользователь).

Критерий            | Корневой токен (Root Token)	                                                            | Метод аутентификации AppRole
Область доступа 	| Полный доступ ко всей системе (удаление хранилищ, изменение политик, аутентификация).	    | Строго ограниченный доступ (например, только чтение одной папки secret/data/app/*).
Разделение секрета  | Один фактор доступа. Тот, кто украл токен, сразу получает все права.	                    | Два фактора доступа: Role ID и Secret ID. Их можно доставлять в приложение разными независимыми путями.
Время жизни (TTL)	| По умолчанию бессрочный. Никогда не истекает, пока не будет отозван вручную.	            | Короткоживущий. Токен приложения сгорает через заданное время (например, 10 минут) и требует обновления.
Компрометация	    | Катастрофа. Требуется экстренный отзыв токена и перегенерация всей инфраструктуры Vault.	| Минимальный ущерб. Злоумышленник сможет лишь прочитать ограниченный набор секретов приложения в течение очень короткого времени.
```


#Task №2
# Отчет по лабораторной работе: Интеграция HashiCorp Vault и Kubernetes через Vault Secrets Operator (VSO)

## 1. Архитектура и запуск Vault
Vault был успешно развернут в кластере с помощью Helm-диаграммы (`v0.34.1`) в режиме `standalone` с одной репликой и интегрированным хранилищем `Raft`. Для обхода сетевых ограничений (ошибки `403 Forbidden` от внешних Helm-репозиториев HashiCorp) установка производилась из локально клонированных исходников.

### Почему Vault изначально запечатан (Sealed)?
По соображениям безопасности "из коробки" оперативная память запущенного процесса Vault пуста. Главный ключ (Master Key), шифрующий физическую базу данных BoltDB на диске, закриптован ключом барьера (Barrier Key). Согласно алгоритму Шамира (Shamir's Secret Sharing), этот ключ разделен на фрагменты (в нашем случае 5 частей).

Пока администратор вручную не передаст пороговое количество фрагментов (threshold = 3) через команду `vault operator unseal`, Vault физически не способен расшифровать свои данные и не принимает внешние запросы. В этот момент Kubernetes-проба `readinessProbe` отдает ошибку, поэтому Pod находится в состоянии `0/1 Ready`. Только после успешного распечатывания капсула переходит в статус `1/1 Ready`.

*Ключи распечатывания и Initial Root Token были сгенерированы командой `vault operator init` и сохранены вне Git-репозитория.*

---

## 2. Настройка Движка и Авторизации
Внутри контейнера были выполнены следующие шаги конфигурации:
1. Включен движок секретов KV v2 строго по пути `secret` (`vault secrets enable -path=secret -version=2 kv`). Это устранило стандартную ошибку `403 preflight capability check`, указывающую на отсутствие дефолтного пути монтирования в Vault 2.x.
2. Создан секрет `secret/myapp/config` с параметрами `database_url` и `api_key`.
3. Написана и применена политика `myapp-readonly` с правами `capabilities = ["read"]`.
4. Включен метод аутентификации `kubernetes` с каноничным адресом внутреннего API-сервера `https://default.svc`.
5. Создана роль `myapp-role`, связывающая ServiceAccount `myapp-sa` из пространства имен `default` с readonly-политикой.

---

## 3. Синхронизация через Vault Secrets Operator (VSO)
Оператор VSO был развернут из локального чарта в пространство имен `vault-secrets-operator-system`. Были применены манифесты `VaultConnection`, `VaultAuth` и `VaultStaticSecret`.

Кастомный ресурс `VaultStaticSecret` автоматически забирает данные из Vault и генерирует нативный Kubernetes Secret с именем `myapp-k8s-secret`. Приложение импортирует его декларативно через директиву `envFrom`:
```yaml
envFrom:
  - secretRef:
      name: myapp-k8s-secret
```
В манифесте самого приложения Vault нигде напрямую не упоминается.

---

## 4. Поведение переменных окружения при ротации секретов

### Что происходит с переменными окружения уже запущенного Pod после ротации?
Если изменить значение секрета в Vault (например, обновить `database_url` на новую версию), оператор VSO автоматически отследит изменения и мгновенно обновит объект `myapp-k8s-secret` в etcd Kubernetes.

Однако, если зайти в уже работающий Pod приложения и выполнить команду `printenv`, **значения переменных окружения останутся старыми**.

### Причина:
В операционных системах Linux переменные окружения передаются процессу ядром непосредственно в момент его старта (через системный вызов `execve`). После того как процесс инициализировался, операционная система не предоставляет механизмов динамического "push"-обновления его окружения извне. Изменение сущности Secret в Kubernetes никак не заставляет работающий внутри контейнера процесс перечитывать структуру памяти своего окружения.

### Что с этим делать?
1. **Использование встроенного механизма VSO (Реализовано в работе):** В манифест `VaultStaticSecret` добавлена секция `rolloutRestartTargets`. При изменении секрета в Vault оператор самостоятельно инициирует бесшовный `rollout restart` (Rolling Update) для указанного Deployment. Старые поды уничтожаются, а новые стартуют уже с обновленным окружением.
2. **Переход на Volume Mount (Смонтированные файлы):** Если монтировать Kubernetes Secret как файлы (директория с файлами-секретами), Kubelet обновляет их содержимое на лету без перезапуска подов (в течение ~1 минуты). Приложению в таком случае достаточно реализовать паттерн "File Watcher" для перечитывания файлов при их изменении.

---

## 5. Сравнение с "Sealed Secrets" (Из 13-го урока)

| Критерий сравнения | Vault Secrets Operator (VSO) | Sealed Secrets (Bitnami) |
| :--- | :--- | :--- |
| **Безопасность в Git** | **Лучше.** В GitOps-репозитории хранятся только чистые ссылки на пути (например, `path: myapp/config`). Сами секреты никогда не попадут в коммиты. | **Хуже.** Секреты хранятся в Git в зашифрованном асимметричным ключом виде. В случае компрометации приватного ключа контроллера скомпрометирована вся история Git. |
| **Динамическая ротация** | **Лучше.** Изменение пароля в интерфейсе или через API Vault мгновенно доставляется в кластер без необходимости делать коммиты и гонять CI/CD пайплайны. | **Хуже.** Любое изменение данных требует локального перешифрования утилитой `kubeseal` и оформления нового коммита в Git. |
| **Аудит и расширенный контроль** | **Лучше.** На стороне Vault доступен детальный аудит-лог (кто, когда и какой токен запрашивал), поддержка короткоживущих динамических секретов (TTL) для БД и облаков. | **Хуже.** Возможности ограничены базовым RBAC и логированием самого Kubernetes. |
| **Инфраструктурная сложность** | **Хуже.** Требует развертывания, резервного копирования и администрирования полноценного тяжелого Stateful-приложения (кластер Vault/Raft). | **Лучше.** Максимально легковесный Stateless-контроллер, не требующий внешних баз данных и обслуживания. |

---

## 6. Аварийный сценарий: утеря 3 из 5 ключей распечатывания
**Ситуация:** Потеряны 3 ключа распечатывания (осталось 2), но сохранен полный бэкап данных (Raft snapshot).

### Что произойдет и поможет ли бэкап?
Поскольку порог инициализации (threshold) был жестко задан как 3, для сборки мастер-ключа необходимо предоставить **минимум любые 3 фрагмента**. Имея на руках всего 2 ключа, собрать мастер-ключ математически невозможно. Кластер запечатан навсегда.

**Наличие полного бэкапа данных (Raft snapshot) в данной ситуации НЕ ПОМОЖЕТ.**
Данные внутри snapshot-бэкапа находятся в *зашифрованном виде*, и ключом к их дешифрованию является именно тот самый утерянный мастер-ключ. Сам по себе бэкап Vault — это слепок зашифрованного состояния, а не копия ключей администратора. Развертывание этого бэкапа на новом сервере точно так же потребует ввода 3 отсутствующих ключей.

### Алгоритм Disaster Recovery в данном случае:
1. Полное удаление текущего заблокированного инстанса Vault.
2. Развертывание **абсолютно нового, чистого** кластера Vault с выполнением процедуры `vault operator init` с чистого листа (генерация новых 5 ключей и нового root-токена).
3. Восстановление структуры путей, политик доступа и ролей Kubernetes auth.
4. **Ручное или скриптовое пересоздание секретов** из внешних первоисточников (замена паролей в базах данных, перевыпуск токенов сторонних API), так как извлечь старые значения из бэкапа без кворума ключей невозможно.
