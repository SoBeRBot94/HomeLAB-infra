output "vm_id" {
  value = proxmox_virtual_environment_vm.this.vm_id
}

output "name" {
  value = proxmox_virtual_environment_vm.this.name
}

output "ipv4_addresses" {
  value = proxmox_virtual_environment_vm.this.network_ipv4_addresses
}

output "mac_address" {
  value = proxmox_virtual_environment_vm.this.network_device[0].mac_address
}
