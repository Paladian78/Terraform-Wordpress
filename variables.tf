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
variable "mysql_server_name" {
  description = "Name of the MySQL server"
  type        = string
}
variable "sql_administrator_login" {
  description = "Administrator login for MySQL server"
  type        = string
}
variable "sql_administrator_login_password" {
  description = "Administrator login password for MySQL server"
  type        = string
}
variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for MySQL server"
  type        = bool
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