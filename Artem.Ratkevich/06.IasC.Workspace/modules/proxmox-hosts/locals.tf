locals {
  pair = [for i in range(var.env_host_count) : var.student_id * 2 - 1 + i]

  k8s_index = [for i in range(var.k8s_node_count) : var.student_id * 2 - 1 + i]
  k3s_index = [for i in range(var.k3s_node_count) : var.student_id + i]

  aws_vmid  = tonumber("${var.vmid_prefix_aws}${var.student_id}")
  env_vmids = [for n in local.pair : tonumber("${var.vmid_prefix_env}${n}")]
  k3s_vmids = [for n in local.k3s_index : tonumber("${var.vmid_prefix_k3s}${n}")]
  k8s_vmids = [for n in local.k8s_index : tonumber("${var.vmid_prefix_k8s}${n}")]

  aws_addr  = "${var.aws.subnet}${var.student_id}"
  env_addrs = [for n in local.pair : "${var.env_hosts.subnet}${n}"]

  aws_ip  = "${local.aws_addr}/${var.netmask}"
  env_ips = [for n in local.env_addrs : "${n}/${var.netmask}"]

  ssh_pubkey_path = pathexpand(var.ssh_public_key_path)
  ssh_keys        = fileexists(local.ssh_pubkey_path) ? [trimspace(file(local.ssh_pubkey_path))] : []

  ssh_privkey_path = pathexpand(var.ssh_private_key_path)
  ssh_privkey      = fileexists(local.ssh_privkey_path) ? file(local.ssh_privkey_path) : ""

  k3s_ips = [for n in local.k3s_index : "${var.k3s_subnet}${n}"]
  k8s_ips = [for n in local.k8s_index : "${var.k8s_subnet}${n}"]
}
