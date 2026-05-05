terraform {
  required_version = ">= 1.11.0"

  required_providers {
    proxmox   = {
      source  = "registry.opentofu.org/bpg/proxmox"
      version = "~> 0.101"
    }
  }
}
