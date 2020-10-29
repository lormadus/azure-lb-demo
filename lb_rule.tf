resource "azurerm_lb_rule" "lbrule" {
    resource_group_name = azurerm_resource_group.david-rg.name
    loadbalancer_id = azurerm_lb.david-lb.id
    name = "http"
    protocol = "Tcp"
    frontend_port = 80
    backend_port = 80
    backend_address_pool_id = azurerm_lb_backend_address_pool.david-bpepool.id
    frontend_ip_configuration_name = "davidPublicIPAddress"
    probe_id = azurerm_lb_probe.david-lb-probe.id
}
