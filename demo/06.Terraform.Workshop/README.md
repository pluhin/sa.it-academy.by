# 06. IasC. Terraform (OpenTofu) — workshop

Воркшоп после демо [`../05.Terraform/`](../05.Terraform/). Там мы разбирали
`provider` / `resource` / `variables` / `outputs` / `module` по частям — здесь
каждый **сам** раскатывает себе инфраструктуру, которой будет пользоваться
дальше: на занятии 08 (Ansible) и 11 (Kubernetes).

В этой папке **только OpenTofu, без Terragrunt** — Terragrunt смотрели отдельно
в [`../05.Terraform/demo-04/`](../05.Terraform/demo-04/).

> ⚠️ Запускаем через **`tofu`**, а не `terraform`: домены HashiCorp
> (`releases.hashicorp.com`, `registry.terraform.io`) из нашей сети недоступны,
> поэтому `terraform` нельзя ни поставить, ни сделать `init`. Синтаксис `.tf`
> идентичен, в командах просто `tofu`.
>
> Установка: [OpenTofu](https://opentofu.org/docs/intro/install/) —
> [deb](https://opentofu.org/docs/intro/install/deb/) ·
> [Homebrew](https://opentofu.org/docs/intro/install/homebrew/) ·
> [standalone](https://opentofu.org/docs/intro/install/standalone/) ·
> [релизы](https://github.com/opentofu/opentofu/releases)

## Что вы получаете

Шесть гостей на ноде `pve`, в своём пуле `student-NN`:

| Тип | Имя | VMID | IP | Зачем дальше |
| --- | --- | --- | --- | --- |
| LXC | `ws-<id>` | `200<id>` | `192.168.201.<id>` | цель Ansible-воркшопа → **08** |
| LXC | `sa-<n>` | `300<n>` | `192.168.202.<n>` | рабочая песочница |
| LXC | `sa-<n+1>` | `300<n+1>` | `192.168.202.<n+1>` | рабочая песочница |
| VM | `k3s-<id>` | `130<id>` | `192.168.203.<id>` | установка k3s → **11** |
| VM | `k8s-<n>` | `180<n>` | `192.168.208.<n>` | kubespray, нода 1 → **11** |
| VM | `k8s-<n+1>` | `180<n+1>` | `192.168.208.<n+1>` | kubespray, нода 2 → **11** |

где `n = id * 2 - 1`. **Студент 3:** `ws-3`/201.3, `sa-5`+`sa-6`/202.5-6,
`k3s-3`/203.3, `k8s-5`+`k8s-6`/208.5-6.

Сеть плоская `192.168.0.0/16`, бридж `vmbr1`, шлюз `192.168.37.1`, DNS `8.8.8.8`.
Статический IP выдаётся сразу из кода: контейнерам нативно, виртуалкам через
cloud-init шаблона `709`.

## Структура папки

```
modules/proxmox-hosts/     модуль: 3 LXC + 3 VM на студента
├── containers.tf          LXC: ws-<id> и две песочницы sa-*
├── vms.tf                 VM: клоны шаблона 709 под k3s и k8s
├── locals.tf              вычисление VMID и адресов из student_id
├── variables.tf           все параметры лабы вынесены сюда
└── outputs.tf             готовый inventory для домашки
terraform/                 корневой модуль — отсюда запускаем
├── main.tf                вызов модуля + outputs
├── providers.tf           provider "proxmox" {} — креды только из окружения
├── variables.tf           student_id и pool_id, оба обязательны
└── terraform.tfvars.example
```

## Предусловия

**1. SSH-ключ** — обязателен: модуль кладёт публичный ключ в каждого гостя.

```bash
ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
```

Пути переопределяются переменными `ssh_public_key_path` / `ssh_private_key_path`.

**2. Токен Proxmox** — свой у каждого, выдаётся на занятии. Кладём **в окружение**,
не в код и не в git:

```bash
export PROXMOX_VE_ENDPOINT='https://<proxmox>:8006/'
export PROXMOX_VE_API_TOKEN='studentN@pve!tf=ВАШ-UUID'
export PROXMOX_VE_INSECURE=true
```

> ⚠️ **Кавычки одинарные, угловые скобки убрать.** В двойных кавычках bash
> развернёт `!tf` как обращение к истории и ответит `event not found` — токен не
> экспортируется. А `<uuid>` в шаблоне это placeholder: скобки уедут в API вместе
> с токеном и дадут 401.

Проверка — должно быть ровно три строки:

```bash
env | grep PROX
```

**3. Бастион.** Сети `192.168.x` снаружи не маршрутизируются, вход только через
бастион; хост, порт и пароль выдаёт преподаватель. Свой ключ туда:

```bash
ssh-copy-id -p <port> <user>@<bastion>
```

Если в ssh-агенте уже лежат другие ключи, `ssh-copy-id` может упереться в
`Too many authentication failures`, не дойдя до пароля — тогда принудительно:

```bash
ssh-copy-id -o PubkeyAuthentication=no -i ~/.ssh/id_ed25519.pub -p <port> <user>@<bastion>
```

И в `~/.ssh/config`, чтобы дальше ходить на лабораторные адреса напрямую:

```
Host ec_bastion
        User <user>
        Port <port>
        HostName <bastion>

Host 192.168.37.* 192.168.201.* 192.168.202.* 192.168.203.* 192.168.204.* 192.168.205.* 192.168.208.*
        ProxyJump ec_bastion
```

> `ProxyJump` работает только для системного клиента `ssh`. Провижнер внутри
> OpenTofu использует свою реализацию SSH и `~/.ssh/config` **не читает**,
> поэтому `tofu apply` запускаем из лабораторной сети.

## Запуск

```bash
cd terraform
tofu init
tofu plan  -var student_id=<N> -var pool_id=student-0<N>
tofu apply -var student_id=<N> -var pool_id=student-0<N>
```

Обе переменные **обязательны и сверяются между собой**: `student_id=1` работает
только с `pool_id=student-01`. Дефолтов у них нет намеренно — чтобы нельзя было
случайно раскатать чужие номера или залить всё в общий пул.

`plan` и `apply` — две независимые команды, каждой нужны оба `-var`. Успешный
`plan` не запоминает переменные для `apply`. Кто не хочет повторять флаги:

```bash
cp terraform.tfvars.example terraform.tfvars   # и вписать свои значения
```

**Один каталог — одно состояние.** `terraform.tfstate` лежит рядом с кодом,
поэтому в одном каталоге живёт инфраструктура одного студента. Запустить в нём
`apply` с чужим `student_id` — значит попросить OpenTofu превратить свои машины в
чужие, то есть удалить и создать заново.

## Заходим на свои хосты

Пользователь **разный** в зависимости от типа гостя:

```bash
ssh root@192.168.201.<N>        # LXC ws-<N>
ssh root@192.168.202.<M>        # LXC песочницы sa-<M>
ssh student@192.168.203.<N>     # VM k3s
ssh student@192.168.208.<M>     # VM k8s
```

Контейнеры пускают `root` по ключу и по паролю. Виртуалки создаются из
cloud-образа, где у `root` пароля нет вообще — его заводит cloud-init для
пользователя `student`, поэтому по SSH заходим им. Пароль `root` внутри ВМ
включает `remote-exec` при создании, но входить всё равно удобнее под `student`.

> Пароли по умолчанию в `variables.tf` (`lxc_password`, `vm_password`) —
> демонстрационные. Рабочие значения для лабы выдаются на занятии.

## Масштабирование

Квота — **5 машин на каждый тип**, базовый набор занимает не всё. Добираем
счётчиками, код менять не надо:

```bash
tofu apply -var student_id=<N> -var pool_id=student-0<N> -var k8s_node_count=4
```

| Переменная | По умолчанию | Максимум |
| --- | --- | --- |
| `k8s_node_count` | 2 | 5 |
| `env_host_count` | 2 | 5 |
| `k3s_node_count` | 1 | 5 |

Машины сверх базовых получают VMID из запасной полосы (не следующие по порядку —
те принадлежат соседу), адреса считаются автоматически. Выход за пятёрку
отклоняется до обращения к API:

```
k8s_node_count must be 0..5: the onboarding grants VM.Allocate on 5 VMIDs per type.
```

> ⚠️ Понизить счётчик — значит **удалить** машину, а удаление снимает права на её
> VMID. Вернуть её потом сможет только преподаватель, восстановив права. Повышаем
> охотно, понижаем осознанно.

## Частые ошибки

**`Unsuitable value for var.student_id ... a number is required`**
Запустили без `-var`, OpenTofu спросил интерактивно, а в промпт ушло не число.
Не пользуйтесь промптом — передавайте `-var`.

**`Provider "bpg/proxmox" requires explicit configuration`** или
**`Unable to create Proxmox VE API credentials`**
Либо команда дана не из каталога `terraform/` (там `providers.tf`), либо `export`
сделан в другой оболочке. Проверить: `env | grep PROX`.

**`403 Permission check failed`** на создании контейнера или клонировании ВМ
Права на ваши VMID сняты — обычно после `destroy`. Обратиться к преподавателю,
восстанавливается одной командой.

**`Still creating... [9m1s elapsed]`**
Норма. Контейнер поднимается ~3 минуты, клон ВМ — минутами; весь `apply` на шесть
гостей около десяти минут. Ctrl+C не нажимать.

**`(output suppressed due to sensitive value in config)`**
Норма: провижнер получает пароль, поэтому вывод шага скрыт целиком.

**`Warning: Redundant ignore_changes element`**
Предупреждение, не ошибка. `apply` проходит.

## ⛔ Машины не удаляем

`destroy` в конце занятия **не делаем**: эти хосты нужны на занятиях 08 и 11.
Заодно удаление снимает права на VMID, и вернуть их сможет только преподаватель.
