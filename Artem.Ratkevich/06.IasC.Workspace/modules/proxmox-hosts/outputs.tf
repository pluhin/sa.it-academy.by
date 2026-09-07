output "ansible_target" {
  description = "LXC for the Ansible workshop"
  value = {
    name = proxmox_virtual_environment_container.aws.initialization[0].hostname
    vmid = proxmox_virtual_environment_container.aws.vm_id
    ip   = "${var.aws.subnet}${var.student_id}"
  }
}

output "sandboxes" {
  description = "Work sandbox LXC containers"
  value = [
    for i, c in proxmox_virtual_environment_container.env : {
      name = "${var.env_hosts.hostname}-${local.pair[i]}"
      vmid = c.vm_id
      ip   = "${var.env_hosts.subnet}${local.pair[i]}"
    }
  ]
}

output "k3s_nodes" {
  description = "k3s VM(s). ip = address to set inside the guest after first boot."
  value = [
    for i, v in proxmox_virtual_environment_vm.k3s : {
      name = v.name
      vmid = v.vm_id
      ip   = local.k3s_ips[i]
    }
  ]
}

output "k8s_nodes" {
  description = "k8s VMs for kubespray. ip = address to set inside the guest after first boot."
  value = [
    for i, v in proxmox_virtual_environment_vm.k8s : {
      name = v.name
      vmid = v.vm_id
      ip   = local.k8s_ips[i]
    }
  ]
}

output "inventory_table" {
  description = "Ready-to-paste inventory for the homework README"
  value = join("\n", concat(
    ["| host | vmid | ip | purpose |", "| --- | --- | --- | --- |"],
    ["| ${var.aws.hostname}-${var.student_id} | ${local.aws_vmid} | ${var.aws.subnet}${var.student_id} | Ansible workshop target (08) |"],
    [for i, n in local.pair : "| ${var.env_hosts.hostname}-${n} | ${local.env_vmids[i]} | ${var.env_hosts.subnet}${n} | sandbox |"],
    [for i, n in local.k3s_index : "| k3s-${n} | ${local.k3s_vmids[i]} | ${local.k3s_ips[i]} | k3s cluster (11) |"],
    [for i, n in local.k8s_index : "| k8s-${n} | ${local.k8s_vmids[i]} | ${local.k8s_ips[i]} | kubespray cluster (11) |"],
  ))
}
