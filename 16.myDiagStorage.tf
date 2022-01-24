resource "azurerm_storage_account" "user20-diag-storage" {
    name                = "user20diagstorage"
    resource_group_name = azurerm_resource_group.user20-rg.name
    location = azurerm_resource_group.user20-rg.location
    account_replication_type = "LRS"
    account_tier = "Standard"

    tags = {
        environment = "Terraform Demo"
    }
}
