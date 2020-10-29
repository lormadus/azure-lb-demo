resource "azurerm_lb_probe" "david-lb-probe" {
    resource_group_name = azurerm_resource_group.david-rg.name
    loadbalancer_id = azurerm_lb.david-lb.id
    name = "http-probe"
    protocol = "Http"
    request_path = "/"
    port = 80
}
