resource "proxmox_virtual_environment_vm" "this" {
  name              = var.name
  node_name         = var.node_name
  vm_id             = var.vm_id
  description       = var.description
  tags              = var.tags
  start_on_boot     = local.on_boot
  started           = local.started
  stop_on_destroy   = !local.agent_enabled
  bios              = local.bios
  machine           = local.machine_type

  clone {
    vm_id  = var.template_id
    full          = local.full_clone_enabled
  }

  agent {
    enabled = local.agent_enabled
  }

  cpu {
    cores   = var.cpu_cores
    sockets = local.cpu_sockets
    type    = local.cpu_type
  }

  disk {
    datastore_id  = local.disk_datastore
    discard       = local.discard_enabled
    file_format   = local.disk_fileformat
    interface     = local.disk_interface
    size          = var.disk_size
  }

  memory {
    dedicated = var.memory
  }

  network_device {
    bridge    = var.network_bridge
    firewall  = var.network_firewall
  }

  initialization {
    ip_config {
      ipv4{
        address = var.ipv4_address
        gateway = var.gateway
      }
    }

    dns {
      servers = length(var.nameservers) > 0 ? var.nameservers : null
    }
  }

  serial_device {
    device = local.serial_device
  }

  lifecycle {
    ignore_changes = [
      disk[0].import_from,
    ]
  }
}
