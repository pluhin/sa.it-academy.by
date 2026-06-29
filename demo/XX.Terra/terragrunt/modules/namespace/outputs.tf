output "name" {
  description = "Created namespace name"
  value       = kubernetes_namespace.this.metadata[0].name
}
