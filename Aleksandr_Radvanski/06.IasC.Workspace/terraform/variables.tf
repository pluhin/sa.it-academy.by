variable "student_id" {
  description = "Per-student identifier (1..99)"
  type        = number
}

variable "pool_id" {
  description = "Proxmox pool. Students pass their own: student-NN"
  type        = string
  default     = "SA"
}

variable "env_host_count" {
  description = "Sandbox containers (the course gives everyone two)"
  type        = number
  default     = 2
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
  type    = bool
  default = true
}

variable "start_vms" {
  type    = bool
  default = true
}
