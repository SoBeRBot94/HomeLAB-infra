variable "node_name" {
  type = string
}

variable "vm_id" {
  type = number
}

variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "tags" {
  type = list(string)
}

variable "unprivileged" {
  type    = bool
  default = true
}

variable "nesting" {
  type    = bool
  default = true
}

variable "on_boot" {
  type    = bool
  default = true
}

variable "started" {
  type    = bool
  default = true
}

variable "template_id" {
  type    = number
  default = 2000
}

variable "cpu_cores" {
  type    = number
  default = 1
}

variable "memory" {
  type    = number
  default = 512
}

variable "swap" {
  type    = number
  default = 512
}

variable "disk_size" {
  type    = number
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

  validation {
    condition     = can(cidrhost(var.ipv4_address, 0))
    error_message = "Must be a valid CIDR, e.g. 192.168.x.x/24"
  }
}

variable "gateway" {
  type    = string

  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$", var.gateway))
    error_message = "Must be a valid IP address, e.g. 192.168.x.x"
  }
}

variable "nameservers" {
  type    = list(string)
  default = []

  validation {
    condition     = alltrue([
      for ip in var.nameservers :
      can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$", ip))
    ])
    error_message = "Must be a valid list of IP address, e.g. 192.168.x.x"
  }
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

variable "device_passthrough" {
  type = list(object({
    path       = string
    mode       = optional(string)
    uid        = optional(number)
    gid        = optional(number)
    deny_write = optional(bool)
  }))
  default = []
}
