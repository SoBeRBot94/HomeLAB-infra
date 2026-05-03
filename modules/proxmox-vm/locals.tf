locals {
  on_boot             = true
  started             = true
  agent_enabled       = true
  bios                = "seabios"
  machine_type        = "pc"
  
  full_clone_enabled  = true
  
  cpu_sockets         = 1
  cpu_type            = "host"

  disk_datastore      = "local-lvm"
  disk_interface      = "virtio0"
  disk_fileformat     = "raw"
  discard_enabled     = "on"

  serial_device       = "socket"
}
