locals {
  opnsense_template_id = 1200
}

resource "proxmox_network_linux_bridge" "lab" {
  node_name           = "pve1"
  name                = "vmbr1"
  comment             = "Draugr OPNsense network"
}

resource "proxmox_virtual_environment_vm" "opnsense" {
  name                = "opnsense.homelab.local"
  node_name           = "pve1"
  vm_id               = 1201
  description         = "Draugr OPNsense router"
  tags                = ["plane-control", "service-thesis", "tier-temp"]
  on_boot             = true
  bios                = "seabios"
  stop_on_destroy     = true

  clone {
    vm_id             = local.opnsense_template_id
    full              = true
  }

  cpu {
    cores             = 2
    type              = "host"
  }

  memory {
    dedicated         = 4096
  }

  disk {
    datastore_id      = "local-lvm"
    interface         = "virtio0"
    size              = 20
    discard           = "on"
  }

  # vtnet0 → WAN
  network_device {
    bridge            = "vmbr0"
    firewall          = false
  }

  # vtnet1 → LAN
  network_device {
    bridge            = proxmox_network_linux_bridge.lab.name
    firewall          = false
  }

  serial_device {
    device            = "socket"
  }

  agent {
    enabled           = true
  }
}
