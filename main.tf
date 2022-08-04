locals {
  generate_password   = var.basic_auth_password == null || var.basic_auth_password == ""
  basic_auth_user     = var.basic_auth_user
  basic_auth_password = local.generate_password ? random_password.faasd[0].result : var.basic_auth_password

  user_data_vars = {
    basic_auth_user     = local.basic_auth_user
    basic_auth_password = local.basic_auth_password
    domain              = var.domain
    email               = var.email
  }
}

resource "random_password" "faasd" {
  count   = local.generate_password ? 1 : 0
  length  = 16
  special = false
}

resource "hcloud_ssh_key" "faasd-key-pair" {
  name       = var.ssh_key_name
  public_key = var.ssh_pub_key
}

resource "hcloud_firewall" "myfirewall" {
  name = "my-firewall"
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = var.port
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

}

resource "hcloud_server" "faasd" {
  name         = var.name
  image        = var.os_type
  server_type  = var.server_type
  location     = var.location
  ssh_keys     = [hcloud_ssh_key.faasd-key-pair.id]
  firewall_ids = [hcloud_firewall.myfirewall.id]
  labels       = var.labels
  user_data    = templatefile("${path.module}/templates/startup.sh", local.user_data_vars)
}

resource "hcloud_volume" "faasd" {
  name      = var.volume_name
  size      = var.volume_size
  server_id = hcloud_server.faasd.id
  automount = true
  format    = var.volume_format
}

resource "hcloud_floating_ip" "faasd_ip" {
  type      = var.ip_type
  server_id = hcloud_server.faasd.id
}