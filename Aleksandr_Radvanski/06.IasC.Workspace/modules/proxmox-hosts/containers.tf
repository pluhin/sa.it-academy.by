resource "proxmox_virtual_environment_container" "aws" {
  node_name     = var.node_name
  vm_id         = local.aws_vmid
  pool_id       = var.pool_id
  unprivileged  = true
  started       = var.start_containers
  start_on_boot = true

  operating_system {
    template_file_id = var.aws.template
    type             = "ubuntu"
  }

  cpu {
    cores = var.aws.cores
  }

  memory {
    dedicated = var.aws.memory
    swap      = var.aws.swap
  }

  disk {
    datastore_id = var.aws.storage
    size         = var.aws.disk
  }

  network_interface {
    name   = "eth0"
    bridge = var.bridge
  }

  initialization {
    hostname = "${var.aws.hostname}-${var.student_id}"

    ip_config {
      ipv4 {
        address = local.aws_ip
        gateway = var.gateway
      }
    }

    dns {
      servers = [var.dns_server]
    }

    user_account {
      password = var.lxc_password
      keys     = local.ssh_keys
    }
  }

  connection {
    type        = "ssh"
    host        = local.aws_addr
    user        = "root"
    private_key = local.ssh_privkey
    timeout     = "3m"
  }

  provisioner "remote-exec" {
    on_failure = continue

    inline = [
      <<-EOT
        for i in $(seq 1 30); do systemctl is-system-running 2>/dev/null | grep -qE "running|degraded" && break; sleep 2; done
        mkdir -p /etc/ssh/sshd_config.d
        grep -qF "Include /etc/ssh/sshd_config.d/" /etc/ssh/sshd_config || sed -i "1i Include /etc/ssh/sshd_config.d/*.conf" /etc/ssh/sshd_config
        printf "PermitRootLogin yes\nPasswordAuthentication yes\n" > /etc/ssh/sshd_config.d/99-lab-root-login.conf
        sshd -t
        systemctl restart ssh 2>/dev/null || systemctl restart sshd 2>/dev/null || true
        systemctl is-active --quiet ssh || systemctl start ssh || true
      EOT
    ]
  }
}

resource "proxmox_virtual_environment_container" "env" {
  count = var.env_host_count

  node_name     = var.node_name
  vm_id         = local.env_vmids[count.index]
  pool_id       = var.pool_id
  unprivileged  = true
  started       = var.start_containers
  start_on_boot = true

  operating_system {
    template_file_id = var.env_hosts.template
    type             = "ubuntu"
  }

  cpu {
    cores = var.env_hosts.cores
  }

  memory {
    dedicated = var.env_hosts.memory
    swap      = var.env_hosts.swap
  }

  disk {
    datastore_id = var.env_hosts.storage
    size         = var.env_hosts.disk
  }

  network_interface {
    name   = "eth0"
    bridge = var.bridge
  }

  initialization {
    hostname = "${var.env_hosts.hostname}-${local.pair[count.index]}"

    ip_config {
      ipv4 {
        address = local.env_ips[count.index]
        gateway = var.gateway
      }
    }

    dns {
      servers = [var.dns_server]
    }

    user_account {
      password = var.lxc_password
      keys     = local.ssh_keys
    }
  }

  connection {
    type        = "ssh"
    host        = local.env_addrs[count.index]
    user        = "root"
    private_key = local.ssh_privkey
    timeout     = "3m"
  }

  provisioner "remote-exec" {
    on_failure = continue

    inline = [
      <<-EOT
        for i in $(seq 1 30); do systemctl is-system-running 2>/dev/null | grep -qE "running|degraded" && break; sleep 2; done
        mkdir -p /etc/ssh/sshd_config.d
        grep -qF "Include /etc/ssh/sshd_config.d/" /etc/ssh/sshd_config || sed -i "1i Include /etc/ssh/sshd_config.d/*.conf" /etc/ssh/sshd_config
        printf "PermitRootLogin yes\nPasswordAuthentication yes\n" > /etc/ssh/sshd_config.d/99-lab-root-login.conf
        sshd -t
        systemctl restart ssh 2>/dev/null || systemctl restart sshd 2>/dev/null || true
        systemctl is-active --quiet ssh || systemctl start ssh || true
      EOT
    ]
  }
}
