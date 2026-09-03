variable "node_name" {
  description = "Proxmox node to deploy on"
  type        = string
  default     = "pve"
}

variable "pool_id" {
  description = "Proxmox resource pool for created guests (must already exist)"
  type        = string
  default     = "SA"
}

variable "student_id" {
  description = "Per-student identifier (1..99). Drives names, VMIDs and IPs."
  type        = number

  validation {
    condition     = var.student_id >= 1 && var.student_id <= 99
    error_message = "student_id must be between 1 and 99."
  }
}

variable "vmid_prefix_aws" {
  description = "VMID prefix for the Ansible workshop container"
  type        = string
  default     = "200"
}

variable "vmid_prefix_env" {
  description = "VMID prefix for the sandbox containers"
  type        = string
  default     = "300"
}

variable "vmid_prefix_k3s" {
  description = "VMID prefix for the k3s VM"
  type        = string
  default     = "130"
}

variable "vmid_prefix_k8s" {
  description = "VMID prefix for the k8s VMs"
  type        = string
  default     = "180"
}

variable "bridge" {
  type    = string
  default = "vmbr1"
}

variable "gateway" {
  type    = string
  default = "192.168.37.1"
}

variable "dns_server" {
  type    = string
  default = "8.8.8.8"
}

variable "dns_domain" {
  description = "Search domain baked into template 709; declared so the plan converges"
  type        = string
  default     = "sa"
}

variable "netmask" {
  description = "Prefix length used for the flat /16 lab network"
  type        = number
  default     = 16
}

variable "aws" {
  type = object({
    subnet   = string
    template = string
    storage  = string
    cores    = number
    memory   = number
    swap     = number
    disk     = number
    hostname = string
  })
  default = {
    subnet   = "192.168.201."
    template = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
    storage  = "local-st1"
    cores    = 2
    memory   = 2048
    swap     = 2048
    disk     = 8
    hostname = "ws"
  }
}

variable "env_hosts" {
  type = object({
    subnet   = string
    template = string
    storage  = string
    cores    = number
    memory   = number
    swap     = number
    disk     = number
    hostname = string
  })
  default = {
    subnet   = "192.168.202."
    template = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
    storage  = "local-st2"
    cores    = 2
    memory   = 2048
    swap     = 2048
    disk     = 10
    hostname = "sa"
  }
}

variable "env_host_count" {
  description = "Sandbox containers per student (the course gives everyone two)"
  type        = number
  default     = 2
}

variable "ssh_public_key_path" {
  description = "Public key injected into every guest so the provisioner can log in"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_private_key_path" {
  description = "Matching private key used by the remote-exec provisioner"
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "lxc_password" {
  description = "Root password baked into the LXC containers"
  type        = string
  default     = "QwertY_13"
  sensitive   = true
}

variable "vm_template_id" {
  description = "VMID of the template to clone (deb-12-cloudinit, has cloud-init + guest agent)"
  type        = number
  default     = 709
}

variable "vm_datastore" {
  description = "Datastore for cloned VM disks"
  type        = string
  default     = "local-st3"
}

variable "vm_cores" {
  type    = number
  default = 2
}

variable "vm_memory" {
  type    = number
  default = 4096
}

variable "k3s_subnet" {
  type    = string
  default = "192.168.203."
}

variable "k8s_subnet" {
  type    = string
  default = "192.168.208."
}

variable "k3s_node_count" {
  type    = number
  default = 1
}

variable "k8s_node_count" {
  type    = number
  default = 2
}

variable "start_containers" {
  description = "Boot the LXC containers right after creation"
  type        = bool
  default     = true
}

variable "start_vms" {
  description = "Boot the cloned VMs right after creation"
  type        = bool
  default     = true
}

variable "vm_user" {
  description = "Cloud-init user created on the VMs"
  type        = string
  default     = "student"
}

variable "vm_password" {
  description = "Password for the cloud-init user"
  type        = string
  default     = "QwertY_13"
  sensitive   = true
}

variable "vm_ssh_keys" {
  description = "Optional public keys for the cloud-init user"
  type        = list(string)
  default     = []
}
