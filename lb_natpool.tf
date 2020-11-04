resource "azurerm_lb_nat_pool" "lbnatpool" {
    resource_group_name = azurerm_resource_group.david-rg.name
    name = "ssh"
    loadbalancer_id = azurerm_lb.david-lb.id
    protocol = "Tcp"
    frontend_port_start = 50000
    frontend_port_end = 50119
    backend_port = 22
    frontend_ip_configuration_name = "davidPublicIPAddress"
}

## VMSS 설정 하는 경우 사용
