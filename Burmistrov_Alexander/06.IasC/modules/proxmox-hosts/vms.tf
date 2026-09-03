resource "proxmox_virtual_environment_vm" "k3s" {
  count     = var.k3s_node_count
  node_name = var.node_name
  vm_id     = local.k3s_vmids[count.index]
  name      = "k3s-${local.k3s_index[count.index]}"
  pool_id   = var.pool_id
  started   = var.start_vms
  on_boot   = true

  clone {
    vm_id        = var.vm_template_id
    full         = true
    datastore_id = var.vm_datastore
  }

  cpu {
    cores = var.vm_cores
  }

  memory {
    dedicated = var.vm_memory
  }

  agent {
    enabled = true
  }

  initialization {
    datastore_id = var.vm_datastore

    ip_config {
      ipv4 {
        address = "${local.k3s_ips[count.index]}/${var.netmask}"
        gateway = var.gateway
      }
    }

    dns {
      domain  = var.dns_domain
      servers = [var.dns_server]
    }

    user_account {
      username = var.vm_user
      password = var.vm_password
      keys     = concat(var.vm_ssh_keys, local.ssh_keys)
    }
  }

  lifecycle {
    ignore_changes = [disk, ipv4_addresses, ipv6_addresses, network_interface_names]
  }

  connection {
    type        = "ssh"
    host        = local.k3s_ips[count.index]
    user        = var.vm_user
    private_key = local.ssh_privkey
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    on_failure = continue

    inline = [
      <<-EOT
        cloud-init status --wait >/dev/null 2>&1 || true
        sudo sh -c 'mkdir -p /etc/ssh/sshd_config.d
        grep -qF "Include /etc/ssh/sshd_config.d/" /etc/ssh/sshd_config || sed -i "1i Include /etc/ssh/sshd_config.d/*.conf" /etc/ssh/sshd_config
        printf "PermitRootLogin yes\nPasswordAuthentication yes\n" > /etc/ssh/sshd_config.d/99-lab-root-login.conf
        echo "root:${var.vm_password}" | chpasswd
        sshd -t
        systemctl restart ssh 2>/dev/null || systemctl restart sshd 2>/dev/null || true'
      EOT
    ]
  }
}

resource "proxmox_virtual_environment_vm" "k8s" {
  count     = var.k8s_node_count
  node_name = var.node_name
  vm_id     = local.k8s_vmids[count.index]
  name      = "k8s-${local.k8s_index[count.index]}"
  pool_id   = var.pool_id
  started   = var.start_vms
  on_boot   = true

  clone {
    vm_id        = var.vm_template_id
    full         = true
    datastore_id = var.vm_datastore
  }

  cpu {
    cores = var.vm_cores
  }

  memory {
    dedicated = var.vm_memory
  }

  agent {
    enabled = true
  }

  initialization {
    datastore_id = var.vm_datastore

    ip_config {
      ipv4 {
        address = "${local.k8s_ips[count.index]}/${var.netmask}"
        gateway = var.gateway
      }
    }

    dns {
      domain  = var.dns_domain
      servers = [var.dns_server]
    }

    user_account {
      username = var.vm_user
      password = var.vm_password
      keys     = concat(var.vm_ssh_keys, local.ssh_keys)
    }
  }

  lifecycle {
    ignore_changes = [disk, ipv4_addresses, ipv6_addresses, network_interface_names]
  }

  connection {
    type        = "ssh"
    host        = local.k8s_ips[count.index]
    user        = var.vm_user
    private_key = local.ssh_privkey
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    on_failure = continue

    inline = [
      <<-EOT
        cloud-init status --wait >/dev/null 2>&1 || true
        sudo sh -c 'mkdir -p /etc/ssh/sshd_config.d
        grep -qF "Include /etc/ssh/sshd_config.d/" /etc/ssh/sshd_config || sed -i "1i Include /etc/ssh/sshd_config.d/*.conf" /etc/ssh/sshd_config
        printf "PermitRootLogin yes\nPasswordAuthentication yes\n" > /etc/ssh/sshd_config.d/99-lab-root-login.conf
        echo "root:${var.vm_password}" | chpasswd
        sshd -t
        systemctl restart ssh 2>/dev/null || systemctl restart sshd 2>/dev/null || true'
      EOT
    ]
  }
}
