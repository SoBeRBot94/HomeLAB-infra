locals {
  talos_template_id = 1100

  talos_nodes = {
    "talos-cp-01" = {
      vm_id     = 1101
      role      = "controlplane"
      tags      = ["plane-control", "service-talos", "tier-lab"]
      cpu_cores = 2
      memory    = 4096
      disk_size = 20
    }
    "talos-worker-01" = {
      vm_id     = 1111
      role      = "worker"
      tags      = ["plane-worker", "service-talos", "tier-lab"]
      cpu_cores = 2
      memory    = 4096
      disk_size = 50
    }
    "talos-worker-02" = {
      vm_id     = 1112
      role      = "worker"
      tags      = ["plane-worker", "service-talos", "tier-lab"]
      cpu_cores = 2
      memory    = 4096
      disk_size = 50
    }
  }
}

module "talos" {
  source              = "../../modules/proxmox-vm"
  for_each            = local.talos_nodes

  name                = each.key
  node_name           = "pve1"
  vm_id               = each.value.vm_id
  template_id         = local.talos_template_id
  description         = "Talos ${each.value.role} node"
  tags                = each.value.tags

  cpu_cores           = each.value.cpu_cores
  disk_size           = each.value.disk_size
  memory              = each.value.memory

  ipv4_address        = var.talos_ips[each.key]
  gateway             = var.gateway
  nameservers         = var.nameservers

  user_data_file      = null
}
