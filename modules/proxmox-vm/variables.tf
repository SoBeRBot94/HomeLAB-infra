variable "name" {
  type  = string
}

variable "node_name" {
  type  = string
}

variable "vm_id" {
  type    = number
  default = null
}

variable "description" {
  type    = string
  default = null
}

variable "tags" {
  type  = list(string)
}

variable "template_id" {
  type    = number
  default = 1000
}

variable "tags" {
  type  = list(string)
}

variable "cpu_cores" {
  type    = number
  default = 1
}

variable "disk_size" {
  type    = number
  default = 40 
}

variable "memory" {
  type    = number
  default = 2048 
}

variable "network_bridge" {
  type    = string
  default = "vmbr0" 
}

variable "network_ipv4_address" {
  type    = string

  validation {
    condition     = can(cidrhost(var.network_ipv4_address, 0))
    error_message = "Must be a valid CIDR, e.g. 192.168.x.x/24"
  }
}

variable "network_gateway" {
  type    = string

  validation {
    condition     = can(regex("^\\d{1,3}.\\d{1,3}.\\d{1,3}.\\d{1,3}$", var.network_gateway))
    error_message = "Must be a valid IP address, e.g. 192.168.x.x"
  }
}

variable "dns_nameservers" {
  type    = list(string)

  validation {
    condition     = alltrue([
      for ip in vars.dns_nameservers :
      can(regex("^\\d{1,3}.\\d{1,3}.\\d{1,3}.\\d{1,3}$", ip))
    ])
    error_message = "Must be a valid list of IP address, e.g. 192.168.x.x"
  }
}
