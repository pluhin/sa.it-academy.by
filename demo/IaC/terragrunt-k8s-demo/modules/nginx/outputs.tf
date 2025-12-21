output "namespace" {
  description = "Namespace where nginx is deployed"
  value       = var.namespace
}

output "service_name" {
  description = "Nginx service name"
  value       = kubernetes_service.nginx.metadata[0].name
}

output "ingress_host" {
  description = "Nginx ingress host"
  value       = var.host
}
