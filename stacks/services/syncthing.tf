module "syncthing" {
  source              = "../../modules/proxmox-lxc"

  node_name           = "pve1"
  vm_id               = 2001 
  name                = "syncthing.homelab.local"
  description         = "Syncthing file sync"
  tags                = ["plane-infra", "service-sync", "tier-utility"]

  os_template_file_id = "local:vztmpl/fedora-43-default_20260115_amd64.tar.xz"
  os_type             = "fedora"

  cpu_cores           = 1
  memory              = 512
  swap                = 512
  disk_size           = 10
  disk_datastore      = "local-lvm"

  network_bridge      = "vmbr0"
  network_firewall    = true
  ipv4_address        = "192.168.88.110/24"
  gateway             = "192.168.88.1"
  nameserver          = "192.168.88.1"
}
