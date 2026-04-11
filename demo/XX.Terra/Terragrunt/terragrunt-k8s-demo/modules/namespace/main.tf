resource "kubernetes_namespace" "this" {
  metadata {
    name = var.name
  }
}
