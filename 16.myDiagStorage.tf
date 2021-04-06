resource "azurerm_storage_account" "mystorageaccount" {
    name                = "davidvm1diagestorage1"
    resource_group_name = azurerm_resource_group.david-rg.name
    location = azurerm_resource_group.david-rg.location
    account_replication_type = "LRS"
    account_tier = "Standard"

    tags = {
        environment = "Terraform Demo"
    }
}

