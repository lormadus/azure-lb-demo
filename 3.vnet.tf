resource "azurerm_virtual_network" "david-net" {
    name = "david-vnet"
    address_space = ["40.0.0.0/16"]
    location = azurerm_resource_group.david-rg.location
    resource_group_name = azurerm_resource_group.david-rg.name
}
