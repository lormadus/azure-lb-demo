resource "azurerm_virtual_machine" "web2" {
    name                  = "davidweb2"
    location              = azurerm_resource_group.david-rg.location
    resource_group_name   = azurerm_resource_group.david-rg.name
    availability_set_id   = azurerm_availability_set.avset.id
    network_interface_ids = ["${azurerm_network_interface.nic2.id}"]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "myOsDisk2"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }
    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

 os_profile {
        computer_name  = "davidweb2"
        admin_username = "azureuser"
        admin_password = "PassW0rd1!"
	custom_data= file("web.sh")
    }

 os_profile_linux_config {
        disable_password_authentication = false
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJ8fBKU2PfFgEpbALeFQwMgMGTg6adjgSnpT+3y9Y4IKXgcR6Qjpo56ccjL4gHm3wRg1GbMPxgYvLboOr5AyqTvyFvPuUujf1RF2BlI6SJyTBd+vaxID8MBfWUj3sOX7knvTY6CKWI084Zjm2JVVhZYFbrXhVzVZa0upLeyic1ayDVqm1MmQMilB1WLW9X6NSt5StzvDy/86Zq9/EfQTkRS9vl/mv2C25XOprV2lYi/ecQ8R0DtJ2enEJKrTw6AkDNPd1KrS4QD3vffHvGqACvpGXkEwM/tfhPYHnAY6V6adC7yi6lzT5QfCDrA8c01X8enxVclEGFa/NzL0kXkFNV david@davidadmin"
        }
    }
    boot_diagnostics {
        enabled     = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

    tags = {
        environment = "Terraform Demo"
    }
}

