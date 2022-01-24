resource "azurerm_subnet" "user20-subnet1" {
    name                = "user20-mysubnet1"
    resource_group_name = azurerm_resource_group.user20-rg.name
    virtual_network_name= azurerm_virtual_network.user20-net.name
    address_prefixes    = ["20.0.1.0/24"]
}
