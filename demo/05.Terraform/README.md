# 05. IasC. Terraform and Terragrunt — demo

Демо с занятия по IaC. Всё показано на **Proxmox** — он для нас учебный облачный
провайдер: VM/LXC, storage, сеть, API и токены, как в AWS/GCP, только на своём
железе.

> ⚠️ Запускаем через **`tofu`** (OpenTofu), а не `terraform`: домены HashiCorp
> (`releases.hashicorp.com`, `registry.terraform.io`) из нашей сети недоступны,
> поэтому `terraform` нельзя ни поставить, ни сделать `init`. Синтаксис `.tf`
> идентичен. Установка `tofu`/`terragrunt` без root — в
> [вики занятия](https://github.com/pluhin/sa.it-academy.by/wiki/05.-IasC.-Terraform-and-Terragrunt).

| Папка | Тема | Что смотреть |
| --- | --- | --- |
| [`demo-01`](./demo-01/) | первый ресурс | `provider` + `resource`, цикл `init → plan → apply → destroy`, идемпотентность |
| [`demo-02`](./demo-02/) | variables / outputs | `variables.tf` с `validation` и `sensitive`, `locals`, `outputs`, `tfvars`, diff при смене переменной |
| [`demo-03`](./demo-03/) | модули | модуль `modules/lab-host`, вызванный дважды — два хоста из одного кода |
| [`demo-04`](./demo-04/) | Terragrunt | `dev` + `prod` из одного модуля, `root.hcl` с `include`/`generate`, `run --all` |
| [`demo-05`](./demo-05/) | Terraform в CI/CD | `.gitlab-ci.yml` и GitHub Actions: `fmt → validate → plan`, `apply` по кнопке |

## Как запускать

```bash
# креды провайдера — только из окружения, в код не попадают
export PROXMOX_VE_ENDPOINT="https://<proxmox>:8006/"
export PROXMOX_VE_API_TOKEN="<user>@pve!tf=<uuid>"
export PROXMOX_VE_INSECURE=true

cd demo-01
tofu init
tofu plan
tofu apply
tofu destroy        # всегда убираем за собой
```

Для `demo-04` дополнительно:

```bash
export TG_TF_PATH=tofu        # иначе Terragrunt ищет бинарь terraform
cd demo-04/live
terragrunt run --all plan    --non-interactive
terragrunt run --all apply   --non-interactive
terragrunt run --all destroy --non-interactive
```

## На что обратить внимание

- **Провайдер закреплён на `bpg/proxmox` 0.111.1** — ради воспроизводимости, чтобы
  у всех был один и тот же `plan`. Раньше пин был вынужденным: Proxmox VE 7.x
  отвергал `/pools?poolid=` с HTTP 400, и приходилось держать 0.98.0. После
  апгрейда ноды до PVE 8 ограничение исчезло.
- **`state` защищаем**: `terraform.tfstate` содержит данные ресурсов (включая
  пароль контейнера) — в git не коммитим, `.gitignore` обязателен.
- В `demo-04` при параллельном скачивании провайдера один из юнитов иногда ловит
  `Failed to resolve provider packages` — Terragrunt делает retry сам.

Домашнее задание — [вики: 05. IasC. Terraform and Terragrunt](https://github.com/pluhin/sa.it-academy.by/wiki/05.-IasC.-Terraform-and-Terragrunt).
