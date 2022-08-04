output "gateway_url" {
  description = "The url of the faasd gateway"
  value       = var.domain == null || var.domain == "" ? format("http://%s:8080", hcloud_server.faasd.ipv4_address) : format("https://%s", var.domain)
}

output "basic_auth_user" {
  value = var.basic_auth_user
}

output "basic_auth_password" {
  sensitive = true
  value     = "/var/lib/faasd/secrets/basic-auth-password"
}

output "ipv4_address" {
  value = hcloud_server.faasd.ipv4_address
}