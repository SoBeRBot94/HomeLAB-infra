module "control-plane" {
  source              = "../../modules/proxmox-vm"

  name                = "cp.homelab.local"
  node_name           = "pve1"
  vm_id               = 1501 
  description         = "Draugr control plane node"
  tags                = ["plane-control", "service-thesis", "tier-temp"]
  
  cpu_cores           = 4
  disk_size           = 100
  memory              = 8192

  ipv4_address        = var.service_ips.control-plane
  gateway             = var.gateway
  nameservers         = var.nameservers
}
