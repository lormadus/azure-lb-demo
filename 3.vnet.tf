resource "azurerm_virtual_network" "user20-vnet" {
	name 			= "user20-vnet"
	address_space 		= ["20.0.0.0/16"]
	location 			= azurerm_resource_group.user20-rg.location
	resource_group_name	= azurerm_resource_group.user20-rg.name
}
