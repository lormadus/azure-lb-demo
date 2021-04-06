resource "azurerm_network_interface" "nic1" {
    name                = "myNIC1"
    location = azurerm_resource_group.david-rg.location
    resource_group_name = azurerm_resource_group.david-rg.name

    ip_configuration {
        name                          = "myNicConfiguration1"
        subnet_id                     = azurerm_subnet.david-subnet1.id
        private_ip_address_allocation = "Dynamic"
#        public_ip_address_id          = azurerm_public_ip.david-publicip.id
    }

    tags = {
        environment = "Terraform Demo"
    }
}

resource "azurerm_network_interface_security_group_association" "nic-nsg-association" {
  network_interface_id      = azurerm_network_interface.nic1.id
  network_security_group_id = azurerm_network_security_group.mynsg.id
}

resource "azurerm_network_interface_backend_address_pool_association" "backendPool" {
  network_interface_id    = azurerm_network_interface.nic1.id
  ip_configuration_name   = "myNicConfiguration1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.david-bpepool.id 
}
resource "azurerm_network_interface_nat_rule_association" "natrule1" {
  network_interface_id  = azurerm_network_interface.nic1.id
  ip_configuration_name = "myNicConfiguration1"
  nat_rule_id           = azurerm_lb_nat_rule.natrule1.id
}
