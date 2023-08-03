variable "mysql_server_name" {
  description = "Name of the MySQL server"
  type        = string
}
variable "location" {
  description = "Location of the resource group"
  type        = string    
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "administrator_login" {
  description = "Administrator login for MySQL server"
  type        = string
}
variable "administrator_login_password" {
  description = "Administrator login password for MySQL server"
  type        = string
}
variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for MySQL server"
  type        = bool
}
variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}
