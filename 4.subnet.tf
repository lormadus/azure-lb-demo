resource "azurerm_subnet" "david-subnet1" {
    name = "david-mysubnet1"
    resource_group_name = azurerm_resource_group.david-rg.name
    virtual_network_name = azurerm_virtual_network.david-net.name
    address_prefixes = ["40.0.1.0/24"]
}
