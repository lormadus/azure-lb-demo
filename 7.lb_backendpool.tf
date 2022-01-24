resource "azurerm_lb_backend_address_pool" "user20-bep" {
    loadbalancer_id = azurerm_lb.user20-lb.id
    name = "user20-bep"
}
