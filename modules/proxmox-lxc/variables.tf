variable "node_name" {
  type = string
}

variable "vm_id" {
  type = string
}

variable "name" {
  type = string
}

variable "description" {
  type = string
  default = ""
}

variable "tags" {
  type = list(string)
}

variable "unprivileged" {
  type = bool
  default = true
}

variable "nesting" {
  type = bool
  default = true
}

variable "on_boot" {
  type = bool
  default = true
}

variable "started" {
  type = bool
  default = true
}

variable "os_type" {
  type = string
  default = "fedora"
}

variable "os_template_file_id" {
  type = string
}

variable "cpu_cores" {
  type = number
  default = 1
}

variable "memory" {
  type = number
  default = 512
}

variable "swap" {
  type = number
  default = 512
}

variable "disk_size" {
  type = number
  default = 10
}

variable "disk_datastore" {
  type    = string
  default = "local-lvm"
}

variable "network_bridge" {
  type    = string
  default = "vmbr0"
}

variable "network_firewall" {
  type    = bool
  default = false
}

variable "ipv4_address" {
  type    = string
  default = "dhcp"
}

variable "gateway" {
  type    = string
  default = null
}

variable "nameserver" {
  type    = string
  default = null
}

variable "ssh_keys" {
  type    = list(string)
  default = []
}

variable "root_password" {
  type      = string
  sensitive = true
  default   = null
}
