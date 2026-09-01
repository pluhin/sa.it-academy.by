# Homework 06.IasC

## Homework Assignment 1: Understand the naming and addressing scheme

* ws VMID **2003** IP 192.168.201.3/16 GW 192.168.37.1
* sa VMID **3005/3006** IP 192.168.202.5-6/16 GW 192.168.37.1
* k3s VMID **1303** IP 192.168.203.3 GW 192.168.37.1
* k8s VMID **1805/1806** IP 192.168.208.5-6/16 GW 192.168.37.1

> 3. Explain in your README why the sandbox and k8s hosts are numbered in pairs (n, n+1) while ws and k3s use the plain student_id.

Для К8с два хоста необходимы для вынесения control-plane на отдельный хост, в свое время К3с это специальный минимальный дистрибутив большого К8с, созданный для тестирования и разработки и роли control и worker в нем совмещены в одной физической ноде для экономии и удобства

> 4. Explain why each student needs a separate VMID block and a separate pool, and which of the two is the hard limit.

Пул VMID необходим для исключения конфликтов в наименовании ВМ, т.к. проксмокс не даст создать еще одну ВМ с таким же VMID или наоборот обезопасить свои машины от удаления кем-то другим. Отдельный пул ВМ это логическое разделение, которое позволяет каждому стеденту выделить его личный пул с правами только на него и недопустить вмешивание в разработки коллег

## Homework Assignment 2: Provision the hosts with OpenTofu

```
tofu output
ansible_target = {
  "ip" = "192.168.201.3"
  "name" = "ws-3"
  "vmid" = 2003
}
inventory_table = <<EOT
| host | vmid | ip | purpose |
| --- | --- | --- | --- |
| ws-3 | 2003 | 192.168.201.3 | Ansible workshop target (08) |
| sa-5 | 3005 | 192.168.202.5 | sandbox |
| sa-6 | 3006 | 192.168.202.6 | sandbox |
| k3s-3 | 1303 | 192.168.203.3 | k3s cluster (11) |
| k8s-5 | 1805 | 192.168.208.5 | kubespray cluster (11) |
| k8s-6 | 1806 | 192.168.208.6 | kubespray cluster (11) |
EOT
k3s_nodes = [
  {
    "ip" = "192.168.203.3"
    "name" = "k3s-3"
    "vmid" = 1303
  },
]
k8s_nodes = [
  {
    "ip" = "192.168.208.5"
    "name" = "k8s-5"
    "vmid" = 1805
  },
  {
    "ip" = "192.168.208.6"
    "name" = "k8s-6"
    "vmid" = 1806
  },
]
sandboxes = [
  {
    "ip" = "192.168.202.5"
    "name" = "sa-5"
    "vmid" = 3005
  },
  {
    "ip" = "192.168.202.6"
    "name" = "sa-6"
    "vmid" = 3006
  },
]
```
## Homework Assignment 3: The same set through Terragrunt

> 3. Run terragrunt init and terragrunt plan. If your resources are already created by Assignment 2, explain in your README why the plan is not empty (different state file) and how you would avoid managing the same resources twice.

Должен быть общий файл состояния

> 4. Explain what include and the generate block in the root config give you, and why the difference between two students is only in inputs.

Все данные и ID генерируются исходя из номера студента

> 5. Explain why pool_id lives in each student's unit and not in the shared root.hcl.

- 

## Homework Assignment 4: Check that the hosts are ready for the next workshops

> 1. Explain in your README why root login with a password works even though neither the LXC template nor the Debian cloud image allows it by default. Name the two files involve

В файлах container.tf и vms.tf есть ```provisioner```, который выполняет скрипт настройки root доступа в контйнере. Но в реально созданном контйнере этих файлов я не нашел и согласно документации в прицнипе раздел ```user_account``` в ```resource "proxmox_virtual_environment_container"``` принимает пароль и ключ для пользователя root. Если выполнить ```sshd -T``` в консоли контейнера/ВМ, можно увидеть, что по умолчанию вход сразу в root учетную запись разрешен по ключу, но не паролю 
```bash
sshd -T | grep root
permitrootlogin without-password
```

| Тип | Имя | VMID | IP | Зачем дальше |
| --- | --- | --- | --- | --- |
| LXC | `ws-3` | `2003` | `192.168.201.3` | цель Ansible-воркшопа → **08** |
| LXC | `sa-5` | `3005` | `192.168.202.5` | рабочая песочница |
| LXC | `sa-6` | `3006` | `192.168.202.6` | рабочая песочница |
| VM | `k3s-3` | `1303` | `192.168.203.3` | установка k3s → **11** |
| VM | `k8s-5` | `1805` | `192.168.208.5` | kubespray, нода 1 → **11** |
| VM | `k8s-6` | `1805` | `192.168.208.6` | kubespray, нода 2 → **11** |

