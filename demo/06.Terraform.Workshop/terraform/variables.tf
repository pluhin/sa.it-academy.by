variable "student_id" {
  description = "Your identifier (1..99). Required: there is no default on purpose"
  type        = number

  validation {
    condition     = var.student_id >= 1 && var.student_id <= 99
    error_message = "student_id must be a number between 1 and 99."
  }
}

variable "pool_id" {
  description = "Your pool: student-NN. Required, and must match student_id"
  type        = string

  validation {
    condition     = var.pool_id == format("student-%02d", var.student_id) || var.pool_id == "SA"
    error_message = "pool_id must match student_id: student_id=1 pairs with student-01. SA is reserved for the trainer."
  }
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
