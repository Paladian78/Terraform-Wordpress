variable "prefix" {
  description = "Prefix for all resources"
  type        = string  
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string  
}
variable "location" {
  description = "Location of the resource group"
  type        = string  
}
variable "domain_name_label" {
  description = "Domain name label"
  type        = string  
}
variable "network_interface_id" {
  description = "Network interface ID"
  type        = string  
}
variable "public_ip_address" {
  description = "Public IP address"
  type        = string  
}
variable "admin_username" {
  description = "Administrator username"
  type        = string  
}
variable "admin_password" {
  description = "Administrator password"
  type        = string    
}
variable "wordpress_image" {
  description = "WordPress image"
  type        = string
}