output "publicip" {
  value = module.network.public_ip_address
}

output "dns_name_label" {
  value = "${var.domain_name_label}.${var.location}.cloudapp.azure.com"
}

output "Deployment" {
  value = "You can access the wordpress site at http://${module.network.public_ip_address} or http://${var.domain_name_label}.${var.location}.cloudapp.azure.com"
}