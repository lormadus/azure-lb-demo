resource "azurerm_resource_group" "david-rg" {
    name     = "davidrg"
    location = "koreacentral"

    tags = {
        environment = "Terraform Demo"
    }
}
