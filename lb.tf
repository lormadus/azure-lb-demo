resource "azurerm_lb" "david-lb" {
name = "davidlb"
location = azurerm_resource_group.david-rg.location
resource_group_name = azurerm_resource_group.david-rg.name
frontend_ip_configuration {
  name = "davidPublicIPAddress"
  public_ip_address_id = azurerm_public_ip.david-publicip.id
}
}
