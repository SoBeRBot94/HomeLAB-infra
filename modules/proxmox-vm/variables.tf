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
    condition     = can(regex("^\\d{1,3}.\\d{1,3}.\\d{1,3}.\\d{1,3}$", var.gateway))
    error_message = "Must be a valid IP address, e.g. 192.168.x.x"
  }
}

variable "nameservers" {
  type    = list(string)

  validation {
    condition     = alltrue([
      for ip in vars.nameservers :
      can(regex("^\\d{1,3}.\\d{1,3}.\\d{1,3}.\\d{1,3}$", ip))
    ])
    error_message = "Must be a valid list of IP address, e.g. 192.168.x.x"
  }
}
