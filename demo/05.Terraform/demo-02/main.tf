locals {
  vm_id     = 990000 + var.demo_id
  ipv4_addr = "${var.subnet_prefix}${var.demo_id}"
  ipv4_cidr = "${local.ipv4_addr}/${var.netmask}"
}

resource "proxmox_virtual_environment_container" "demo" {
  node_name    = var.node_name
  vm_id        = local.vm_id
  pool_id      = var.pool_id
  unprivileged = true
  started      = true

  operating_system {
    template_file_id = var.template
    type             = "ubuntu"
  }

  cpu {
    cores = var.cores
  }

  memory {
    dedicated = var.memory
    swap      = var.memory
  }

  disk {
    datastore_id = var.storage
    size         = var.disk_size
  }

  network_interface {
    name   = "eth0"
    bridge = var.bridge
  }

  initialization {
    hostname = var.hostname

    ip_config {
      ipv4 {
        address = local.ipv4_cidr
        gateway = var.gateway
      }
    }

    dns {
      servers = [var.dns_server]
    }

    user_account {
      password = var.lxc_password
      keys     = [trimspace(file("~/.ssh/id_rsa.pub"))]
    }
  }

  connection {
    type        = "ssh"
    host        = local.ipv4_addr
    user        = "root"
    private_key = file("~/.ssh/id_rsa")
    timeout     = "3m"
  }

  provisioner "remote-exec" {
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
