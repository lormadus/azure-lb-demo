resource "azurerm_resource_group" "user20-rg" {
    name     = "user20-rg"
    location = "koreacentral"

    tags = {
        environment = "Terraform Demo"
    }
}
