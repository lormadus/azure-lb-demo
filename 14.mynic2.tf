resource "azurerm_network_interface" "web2-nic1" {
    name                = "web2-nic1"
    location = azurerm_resource_group.user20-rg.location
    resource_group_name = azurerm_resource_group.user20-rg.name

    ip_configuration {
        name                          = "web2-nic1-ip"
        subnet_id                     = azurerm_subnet.user20-subnet1.id
        private_ip_address_allocation = "Dynamic"
#        public_ip_address_id          = azurerm_public_ip.user20-publicip.id
    }

    tags = {
        environment = "Terraform Demo"
    }
}

resource "azurerm_network_interface_security_group_association" "nic-nsg-association2" {
  network_interface_id      = azurerm_network_interface.web2-nic1.id
  network_security_group_id = azurerm_network_security_group.user20-nsg.id
}

resource "azurerm_network_interface_backend_address_pool_association" "backendPool2" {
  network_interface_id    = azurerm_network_interface.web2-nic1.id
  ip_configuration_name   = "web2-nic1-ip"
  backend_address_pool_id = azurerm_lb_backend_address_pool.user20-bep.id
}
resource "azurerm_network_interface_nat_rule_association" "natrule2" {
  network_interface_id  = azurerm_network_interface.web2-nic1.id
  ip_configuration_name = "web2-nic1-ip"
  nat_rule_id           = azurerm_lb_nat_rule.natrule2.id
}
