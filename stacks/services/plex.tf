module "plex" {
  source              = "../../modules/proxmox-vm"

  name                = "plex.homelab.local"
  node_name           = "pve1"
  vm_id               = 1001 
  description         = "Plex media server"
  tags                = ["plane-infra", "service-media", "tier-utility"]
  
  cpu_cores           = 4
  disk_size           = 500
  memory              = 8192

  ipv4_address        = var.service_ips.plex
  gateway             = var.gateway
  nameservers         = var.nameservers
}
