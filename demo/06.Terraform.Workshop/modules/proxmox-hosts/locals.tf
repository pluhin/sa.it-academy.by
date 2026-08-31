locals {
  spare_base    = 100
  cap_per_type  = 5
  spares_single = local.cap_per_type - 1
  spares_pair   = local.cap_per_type - 2

  idx_single = concat(
    [var.student_id],
    [for i in range(local.spares_single) : local.spare_base + (var.student_id - 1) * local.spares_single + i + 1]
  )

  idx_pair = concat(
    [var.student_id * 2 - 1, var.student_id * 2],
    [for i in range(local.spares_pair) : local.spare_base + (var.student_id - 1) * local.spares_pair + i + 1]
  )

  pair      = slice(local.idx_pair, 0, var.env_host_count)
  k8s_index = slice(local.idx_pair, 0, var.k8s_node_count)
  k3s_index = slice(local.idx_single, 0, var.k3s_node_count)

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
