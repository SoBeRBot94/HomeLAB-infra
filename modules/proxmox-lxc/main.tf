resource "proxmox_virtual_environment_container" "this" {
  node_name         = var.node_name
  vm_id             = var.vm_id
  description       = var.description
  tags              = var.tags
  start_on_boot     = var.on_boot
  started           = var.started

  unprivileged      = var.unprivileged

  dynamic "features" {
    for_each = var.nesting != null ? [1] : []
    content {
      nesting = var.nesting
    }
  }

  clone {
    vm_id = var.template_id
    full  = true
  }

  cpu {
    cores = var.cpu_cores
  }

  memory {
    dedicated = var.memory
    swap      = var.swap
  }

  disk {
    datastore_id = var.disk_datastore
    size         = var.disk_size
  }

  network_interface {
    name      = "eth0"
    bridge    = var.network_bridge
    firewall  = var.network_firewall
  }

  initialization {
    hostname  = var.name

    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.gateway
      }
    }

    dns {
      servers = length(var.nameservers) > 0 ? var.nameservers : null
    }

    user_account {
      keys     = var.ssh_keys
      password = var.root_password
    }
  }

  lifecycle {
    ignore_changes = [
      initialization[0].user_account,
      disk[0].size,
    ]
  }

  console {
    enabled   = true
    tty_count = 2 
    type      = "tty"
  }
}
