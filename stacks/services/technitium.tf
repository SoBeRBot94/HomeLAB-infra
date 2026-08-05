module "technitium" {
  source              = "../../modules/proxmox-vm"
  name                = "dns.homelab.local"
  node_name           = "pve1"
  vm_id               = 1002
  description         = "Technitium DNS server"
  tags                = ["plane-infra", "service-dns", "tier-critical"]

  cpu_cores           = 2
  disk_size           = 20
  memory              = 2048
  ipv4_address        = var.service_ips.technitium
  gateway             = var.gateway
  nameservers         = var.nameservers
}
