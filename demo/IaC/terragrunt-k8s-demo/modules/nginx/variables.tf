variable "namespace" {
  type        = string
  description = "Kubernetes namespace for the application"
}

variable "app_name" {
  type        = string
  description = "Application name"
}

variable "host" {
  type        = string
  description = "Ingress hostname"
}

variable "replicas" {
  type        = number
  description = "Number of replicas"
  default     = 2
}

variable "image" {
  type        = string
  description = "Nginx image"
  default     = "nginx:1.27-alpine"
}
