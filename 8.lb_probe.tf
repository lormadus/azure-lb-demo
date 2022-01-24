resource "azurerm_lb_probe" "user20-lb-probe" {
    resource_group_name = azurerm_resource_group.user20-rg.name
    loadbalancer_id     = azurerm_lb.user20-lb.id
    name                = "http-probe"
    protocol            = "Http"
    request_path        = "/"
    port                = 80
}
