terraform {
  required_version = ">= 1.11.0"
  
  required_providers {
    proxmox   = {
      source  = "registry.opentofu.org/bpg/proxmox"
      version = "~> 0.101.1"
    }  
  }
}

provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = true
}
