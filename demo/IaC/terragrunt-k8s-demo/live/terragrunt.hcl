    locals {
      kubeconfig_path = "~/.kube/config-k8s"
      cluster_context = "k8s"
    }

    generate "provider" {
      path      = "provider.tf"
      if_exists = "overwrite_terragrunt"
      contents  = <<EOF
    terraform {
      required_providers {
        kubernetes = {
          source  = "hashicorp/kubernetes"
          version = "~> 2.29"
        }
      }
    }

    provider "kubernetes" {
      config_path = "${local.kubeconfig_path}"
      config_context = "${local.cluster_context}"
    }
    EOF
    }
