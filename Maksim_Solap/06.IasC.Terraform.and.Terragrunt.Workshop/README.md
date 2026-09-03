# 06.IasC.Terraform.and.Terragrunt.Workshop
---

### 📁 Final Repository Directory Structure

```text
06.IasC.Terraform.and.Terragrunt.Workshop/
├── README.md                          # Этот отчет по лабораторной работе
├── root.hcl                           # Корневой конфигурационный файл Terragrunt
├── modules/                           # Переиспользуемый модуль хостов
│   └── proxmox-hosts/
│       ├── containers.tf
│       ├── locals.tf
│       ├── outputs.tf
│       ├── variables.tf
│       ├── versions.tf
│       └── vms.tf
├── terraform/                         # Корневая конфигурация чистого OpenTofu
│   ├── main.tf
│   ├── providers.tf
│   ├── terraform.tfstate
│   ├── variables.tf
│   └── versions.tf
└── terragrunt/                        # Конфигурационный юнит Terragrunt студента
    └── terragrunt.hcl
```

---

### 📋 Homework Assignment 1: Naming and Addressing Scheme

### Исходные данные студента
* **Student ID:** 4
* **Pool ID:** student-04
* **Расчет индекса n:** n = 4 × 2 - 1 = 7

### Инвентарная таблица созданных хостов
Все хосты используют маску сети `/16` и сетевой шлюз `192.168.37.1`.

| Ресурс (Тип) | Имя хоста | VMID | IP-адрес | Назначение / Будущий воркшоп |
| :--- | :--- | :--- | :--- | :--- |
| LXC Container | `ws-4` | **2004** | **192.168.201.4** | 08. Ansible. Workshop |
| LXC Container | `sa-7` | **3007** | **192.168.202.7** | sandbox |
| LXC Container | `sa-8` | **3008** | **192.168.202.8** | sandbox |
| VM (Клон) | `k3s-4` | **1304** | **192.168.203.4** | 11. Kubernetes installation (k3s) |
| VM (Клон) | `k8s-7` | **1807** | **192.168.208.7** | 11. Kubernetes installation (kubespray) |
| VM (Клон) | `k8s-8` | **1808** | **192.168.208.8** | 11. Kubernetes installation (kubespray) |

### Ответы на теоретические вопросы:
1. **Explain in your README why the sandbox and k8s hosts are numbered in pairs (n, n+1) while ws and k3s use the plain student_id**
   * Хосты `ws` (Ansible) и `k3s` (легковесный Kubernetes) создаются в единственном экземпляре на каждого студента для выполнения персональных однонодовых задач. 
   * Хосты `k8s` (ноды для полноценного кластера Kubespray) требуются в количестве **двух штук** на студента для отработки многонодовых конфигураций, распределения ролей (master/worker), настройки репликации и сетевого взаимодействия внутри кластеров.

2. **Explain why each student needs a separate VMID block and a separate pool, and which of the two is the hard limit.**
   * **Разделение пулов (Pools):** Используется для разграничения прав доступа (RBAC) на уровне Proxmox VE. API-токен студента имеет права `VM.Allocate` и `VM.Audit` только внутри конкретного пула `student-04`. Это логическое ограничение видимости ресурсов.
   * **Разделение блоков VMID:** Это **жесткое ограничение (hard limit)** на уровне всего кластера Proxmox. Идентификаторы VMID должны быть абсолютно уникальными в рамках всей системы. Если бы два студента попытались создать виртуальную машину с одинаковым VMID, произошел бы критический конфликт на уровне конфигурации гипервизора, и Proxmox API отклонил бы запрос.

---

## 🛠️ Homework Assignment 2: Provision the hosts with OpenTofu

1. Выполнена инициализация в папке `terraform/`: `tofu init`.
2. Запущен предварительный просмотр плана: `tofu plan -var student_id=4 -var pool_id=student-04` (План показал создание **6 ресурсов**).


### Проверка идемпотентности
При повторном вызове команды `tofu apply` инфраструктура осталась без изменений, что подтверждает свойство идемпотентности декларативного подхода IaaC:
```
No changes. Your infrastructure matches the configuration.

OpenTofu has compared your real infrastructure against your configuration and found no differences, so no changes are needed

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

```

### Вывод команды `tofu output`

```
terraform$ tofu output
ansible_target = {
  "ip" = "192.168.201.4"
  "name" = "ws-4"
  "vmid" = 2004
}
inventory_table = <<EOT
| host | vmid | ip | purpose |
| --- | --- | --- | --- |
| ws-4 | 2004 | 192.168.201.4 | Ansible workshop target (08) |
| sa-7 | 3007 | 192.168.202.7 | sandbox |
| sa-8 | 3008 | 192.168.202.8 | sandbox |
| k3s-4 | 1304 | 192.168.203.4 | k3s cluster (11) |
| k8s-7 | 1807 | 192.168.208.7 | kubespray cluster (11) |
| k8s-8 | 1808 | 192.168.208.8 | kubespray cluster (11) |
EOT
k3s_nodes = [
  {
    "ip" = "192.168.203.4"
    "name" = "k3s-4"
    "vmid" = 1304
  },
]
k8s_nodes = [
  {
    "ip" = "192.168.208.7"
    "name" = "k8s-7"
    "vmid" = 1807
  },
  {
    "ip" = "192.168.208.8"
    "name" = "k8s-8"
    "vmid" = 1808
  },
]
sandboxes = [
  {
    "ip" = "192.168.202.7"
    "name" = "sa-7"
    "vmid" = 3007
  },
  {
    "ip" = "192.168.202.8"
    "name" = "sa-8"
    "vmid" = 3008
  },
]
```

---

## 📦 Homework Assignment 3: Terragrunt Integration

### Часть вывода команды `terragrunt plan`
```text
/06.IasC.Terraform.and.Terragrunt.Workshop/terragrunt$ terragrunt plan
16:51:00.595 STDOUT tofu: OpenTofu used the selected providers to generate the following execution
16:51:00.595 STDOUT tofu: plan. Resource actions are indicated with the following symbols:
16:51:00.595 STDOUT tofu:   + create
16:51:00.595 STDOUT tofu: OpenTofu will perform the following actions:
16:51:00.596 STDOUT tofu:   # proxmox_virtual_environment_container.aws will be created
16:51:00.596 STDOUT tofu:   + resource "proxmox_virtual_environment_container" "aws" {
16:51:00.596 STDOUT tofu:       + id             = (known after apply)
16:51:00.596 STDOUT tofu:       + ipv4           = (known after apply)
16:51:00.596 STDOUT tofu:       + ipv6           = (known after apply)
16:51:00.596 STDOUT tofu:       + node_name      = "pve"
16:51:00.596 STDOUT tofu:       + pool_id        = "student-04"
16:51:00.597 STDOUT tofu:       + protection     = false
16:51:00.597 STDOUT tofu:       + start_on_boot  = true
16:51:00.597 STDOUT tofu:       + started        = true
16:51:00.597 STDOUT tofu:       + template       = false
16:51:00.597 STDOUT tofu:       + timeout_clone  = 1800
16:51:00.597 STDOUT tofu:       + timeout_create = 1800
16:51:00.598 STDOUT tofu:       + timeout_delete = 60
16:51:00.598 STDOUT tofu:       + timeout_start  = 300
16:51:00.598 STDOUT tofu:       + timeout_update = 1800
16:51:00.598 STDOUT tofu:       + unprivileged   = true
16:51:00.598 STDOUT tofu:       + vm_id          = 2004
16:51:00.598 STDOUT tofu:       + cpu {
16:51:00.598 STDOUT tofu:           + architecture = "amd64"
16:51:00.598 STDOUT tofu:           + cores        = 2
16:51:00.598 STDOUT tofu:           + limit        = 0
16:51:00.598 STDOUT tofu:           + units        = (known after apply)
16:51:00.598 Extracted...
```

### Ответы на архитектурные вопросы:


1. ** Run terragrunt init and terragrunt plan. If your resources are already created by Assignment 2, explain in your README why the plan is not empty (different state file) and how you would avoid managing the same resources twice.**
   * Terragrunt использует **свой собственный независимый файл состояния (state file)**, хранящийся по умолчанию в локальном кэше директории (`.terragrunt-cache/`), и на данный момент ничего «не знает» про стейт, созданный чистым OpenTofu.
   * **Как избежать:** Чтобы не создавать дубликаты ресурсов, необходимо перенести (скопировать) существующий `terraform.tfstate` файл в рабочую директорию Terragrunt, либо выполнить команду импорта ресурсов `terragrunt import ...` для каждого созданного хоста.


2. **Explain what include and the generate block in the root config give you, and why the difference between two students is only in inputs**
   * Блок `include` в `terragrunt.hcl` позволяет автоматически наследовать общие настройки, конфигурацию провайдеров и бэкенда для хранения стейта из родительских файлов (`root.hcl`), соблюдая принцип DRY.
   * Блок `generate` в `root.hcl` динамически создает `.tf`-файлы (например, описание провайдеров `providers.tf` и требуемых версий `versions.tf`) на лету перед запуском Tofu.
   * Разница между студентами заключается только в `inputs`, так как сама **логика и архитектура кода (модуль) абсолютно идентичны для всех**. Меняются только параметры конфигурации (ID пула, ID студента, IP подсети).
3. **Explain why pool_id lives in each student's unit and not in the shared root.hcl.**
   * Переменная `pool_id` является уникальным параметром окружения конкретного пользователя (студента). Размещение ее в общем `root.hcl` нарушило бы изоляцию конфигураций и сделало бы невозможным совместное использование центрального шаблона.

---

## 🛡️ Homework Assignment 4: Infrastructure Readiness Check

### Доступ по SSH и механизм беспарольного root-входа
Вход по SSH под пользователем `root` работает, несмотря на стандартные ограничения дистрибутивов Debian/Ubuntu.

**Два ключевых файла, задействованных в процессе:**
В файлах container.tf и vms.tf есть ```provisioner "remote-exec"```, который выполняет скрипт настройки доступа.


### Соответствие IP-адресов
Конфигурация сетевых интерфейсов виртуальных машин успешно применилась из настроек Cloud-Init (что подтверждено во вкладке Cloud-Init в UI Proxmox). 


---

## 🧪 Homework Assignment 5: Configuration Changes (Optional)

1. **Change one parameter of a container (for example, memory or the number of cores) and show the plan diff: is the resource updated in place or replaced?**
   * При изменении параметров памяти/ядер в контейнере LXC, OpenTofu выполняет обновление **in-place** (на лету), так как Proxmox поддерживает горячее изменение (hotplug) этих ресурсов без уничтожения контейнера.

2. **Change a parameter of a VM that comes from the template (for example, the disk) and explain what lifecycle { ignore_changes = [disk] } in the module does and why it is there.**
   * Данный блок указывает OpenTofu игнорировать любые расхождения в конфигурации диска между кодом и реальным состоянием VM после её создания.
   * **Зачем он нужен:** Виртуальная машина разворачивается из готового шаблона (template), у которого уже есть фиксированный размер диска. Без этой строчки OpenTofu при каждом запуске `plan/apply` пытался бы пересоздать или изменить диск, что привело бы к ошибкам провайдера или потере данных.

3. **Try to create a machine outside your VMID block (for example -var student_id=<someone else's id>) and show the error you get. Explain in your README what mechanism stopped you.**
   * При попытке указать чужой `student_id` Proxmox API возвращает ошибку `403 Forbidden` (Permission check failed).
   * **Механизм защиты:** Ограничение права пользователя (ACL / RBAC) на токене студента в Proxmox VE. Токен имеет строгий scope полномочий, привязанный исключительно к диапазону VMID и пулу конкретного аккаунта.
