provider "vsphere" {
  user           = "${var.vsphere_login}"
  password       = "${var.vsphere_password}"
  vsphere_server = "10.50.80.10"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Cedoni.corp"
}

data "vsphere_datastore" "datastore" {
  name          = "Datastore_QNAP_Cedoni"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "Cluster"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_resource_pool" "pool" {
  name          = "Cluster/Resources/Cedoni-dev"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "Cedoni.res"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "coreos"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
resource "vsphere_virtual_machine" "dev" {
  name             = "jenkins_dev"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 4
  memory   = 4048
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }
cdrom {
    client_device = true
  }
  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
#  linked_clone  = true  
  template_uuid = "${data.vsphere_virtual_machine.template.id}"
  }
vapp {
    properties {
      "guestinfo.coreos.config.data" = "${data.ignition_config.example_ignition_config.rendered}"
    }
  }
connection {
      type        = "ssh"
      user        = "root"
      private_key = "${tls_private_key.example_provisioning_ssh_key.private_key_pem}"
    }
  provisioner "file" {
    source      = "${path.module}/pkg/${var.server_binary_name}"
    destination = "${var.service_directory}/${var.server_binary_name}"

  }
 provisioner "file" {
    source      = "${path.module}/script/${var.script_name}"
    destination = "${var.jenkins_home}/${var.script_name}"

  }
  provisioner "remote-exec" {
    inline = [
      "chmod 755 ${var.service_directory}/${var.server_binary_name}",
      "chown ${var.service_user}:${var.service_user} ${var.service_directory}/${var.server_binary_name}",
      "systemctl enable ovf-example.service",
      "systemctl start ovf-example.service",
      "mkdir /root/.ssh/",
      "update-ssh-keys -u root -d coreos-ignition || /bin/true",
      "sh ${var.jenkins_home}/${var.script_name}",
    ]
    }
 provisioner "file" {
    source      = "/root/.ssh/authorized_keys"
    destination = "/root/.ssh/authorized_keys"
  }
}
