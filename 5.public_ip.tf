resource "azurerm_public_ip" "user20-publicip" {
name                = "user20-publicip"
location            = azurerm_resource_group.user20-rg.location
resource_group_name = azurerm_resource_group.user20-rg.name
allocation_method   = "Static"
domain_name_label   = azurerm_resource_group.user20-rg.name

        tags = {
                environment = "staging"
        }

}
