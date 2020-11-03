resource "azurerm_lb_backend_address_pool" "david-bpepool" {
    resource_group_name = azurerm_resource_group.david-rg.name
    loadbalancer_id = azurerm_lb.david-lb.id
    name = "david-BackEndAddressPool"
}

## 이 파일은 VMSS 설정시에만 사용
