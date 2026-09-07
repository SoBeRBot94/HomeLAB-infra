module "ha-proxy" {
  source              = "../../modules/proxmox-lxc"

  node_name           = "pve1"
  template_id         = 3000
  vm_id               = 3002
  name                = "haproxy.homelab.local"
  description         = "Displacable Draugr ha-proxy node"
  tags                = ["plane-control", "service-thesis", "tier-temp"]

  cpu_cores           = 1
  memory              = 512
  swap                = 512
  disk_size           = 10

  unprivileged        = false

  ipv4_address        = var.service_ips.ha-proxy
  gateway             = var.gateway
  nameservers         = var.nameservers
}
