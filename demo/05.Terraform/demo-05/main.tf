locals {
  vm_id     = 990000 + var.demo_id
  ipv4_addr = "192.168.210.${var.demo_id}"
  ipv4_cidr = "${local.ipv4_addr}/16"
}

resource "proxmox_virtual_environment_container" "ci" {
  node_name    = "pve"
  vm_id        = local.vm_id
  pool_id      = "SA"
  unprivileged = true
  started      = true

  operating_system {
    template_file_id = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
    type             = "ubuntu"
  }

  cpu {
    cores = 1
  }

  memory {
    dedicated = 512
    swap      = 512
  }

  disk {
    datastore_id = "local-st1"
    size         = 4
  }

  network_interface {
    name   = "eth0"
    bridge = "vmbr1"
  }

  initialization {
    hostname = "tf-ci"

    ip_config {
      ipv4 {
        address = local.ipv4_cidr
        gateway = "192.168.37.1"
      }
    }

    dns {
      servers = ["8.8.8.8"]
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
