module "jellyfin" {
  source              = "../../modules/proxmox-vm"

  name                = "jellyfin.homelab.local"
  node_name           = "pve1"
  vm_id               = 1001 
  description         = "Jellyfin free software media system"
  tags                = ["plane-infra", "service-media", "tier-utility"]
  
  cpu_cores           = 4
  disk_size           = 100
  memory              = 8192

  ipv4_address        = var.service_ips.jellyfin
  gateway             = var.gateway
  nameservers         = var.nameservers
}
