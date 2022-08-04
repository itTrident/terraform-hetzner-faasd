variable "basic_auth_user" {
  description = "The basic auth user name."
  type        = string
  default     = "admin"
}

variable "basic_auth_password" {
  description = "The basic auth password, if left empty, a random password is generated."
  type        = string
  default     = null
  sensitive   = true
}

variable "ssh_key_name" {
  description = "Key name of the Key Pair to use for the instance."
  type        = string
  default     = ""
}

variable "ssh_pub_key" {
  description = "Public Key Pair to use for the instance."
  type        = string
  default     = ""
}

variable "hcloud_api_key" {
  description = "API key for hetzner"
  type        = string
  default     = ""
}

variable "location" {
  description = "The name of the location to deploy the faasd into."
  type        = string
  default     = "nbg1"
}

variable "name" {
  description = "The name of the faasd instance."
  type        = string
  default     = "faasd"
}

variable "os_type" {
  description = "The name is to set the os_type."
  type        = string
  default     = "ubuntu-20.04"
}

variable "server_type" {
  description = "The server type to use for the server."
  type        = string
  default     = "cpx21"
}

variable "labels" {
  description = "A map of key/value labels."
  type        = map(string)
}

variable "port" {
  description = "Assign the port number and protocall to allow in Firewall Rules"
  type        = string
  default     = "22-8080"
}

variable "email" {
  description = "Email used to order a certificate from Let's Encrypt."
  type        = string
  default     = ""
}

variable "domain" {
  description = "A public domain for the faasd instance. This will be consumed by Caddy and install a Let's Encrypt certificate."
  type        = string
  default     = ""
}

variable "volume_name" {
  description = "The name of the volume."
  type        = string
  default     = ""
}

variable "volume_size" {
  description = "The size of the volume."
  type        = string
  default     = ""
}

variable "volume_format" {
  description = "The format of the volume."
  type        = string
  default     = ""
}

variable "ip_type" {
  description = "The ip type of the volume."
  type        = string
  default     = ""
}