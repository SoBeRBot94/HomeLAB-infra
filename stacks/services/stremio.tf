module "stremio" {
  source              = "../../modules/proxmox-lxc"

  node_name           = "pve1"
  template_id         = 3000
  vm_id               = 3001
  name                = "stremio.homelab.local"
  description         = "Stremio streaming server"
  tags                = ["plane-infra", "service-media", "tier-utility"]

  cpu_cores           = 4
  memory              = 8192
  swap                = 2048 
  disk_size           = 50

  unprivileged        = false

  ipv4_address        = var.service_ips.stremio
  gateway             = var.gateway
  nameservers         = var.nameservers
}
