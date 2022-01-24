resource "azurerm_lb" "user20-lb" {
  name                  = "user20-lb"
  location              = azurerm_resource_group.user20-rg.location
  resource_group_name   = azurerm_resource_group.user20-rg.name

  frontend_ip_configuration {
        name = "user20-pip"
  public_ip_address_id = azurerm_public_ip.user20-publicip.id
  }
}
