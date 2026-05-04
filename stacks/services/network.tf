variable "service_ips" {
  type = map(string)
}

variable "gateway" {
  type = string
}

variable "nameservers" {
  type = list(string)
}
