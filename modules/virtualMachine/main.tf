resource "azurerm_virtual_machine" "example" {
  name                  = "${var.prefix}-${var.location}-01"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.network_interface_id]
  vm_size               = "Standard_F2"

  # This means the OS Disk will be deleted when Terraform destroys the Virtual Machine
  # NOTE: This may not be optimal in all cases.
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.prefix}-osdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.prefix}-${var.location}-01"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "null_resource" "wordpress" {
    provisioner "remote-exec" {
      connection {
        type     = "ssh"
        host     = var.public_ip_address
        user     = var.admin_username
        password = var.admin_password
      }
        inline = [
            "sudo apt-get update",
            "sudo apt-get install -y docker.io",
            "sudo systemctl start docker",
            "sudo apt install snapd",
            "sudo snap install --classic certbot",
            "sudo ln -s /snap/bin/certbot /usr/bin/certbot",
            "sudo certbot certonly --standalone --non-interactive --agree-tos -m syogendar14378@gmail.com -d ${var.domain_name_label}.eastus.cloudapp.azure.com",
            "sleep 120",
            "sudo docker run -d --name wordpress -p 80:80 ${var.wordpress_image}"
        ]
    }
    depends_on = [ azurerm_virtual_machine.example]
  
}



# ***************************************************************************************
# The script above will create the following resources:
# 1- Install Docker
# 2- Install snapd
# 3- Install Certbot
# 4- Create a certificate for the domain name label
# 5- Install WordPress
# ***************************************************************************************

# **** NOTE ****
# Currently, the script above is successfully installing the certificates and WordPress, but it is not able to access https for the domain name label.
# I am still working on it. Will further update the repo once I am able to fix it.

