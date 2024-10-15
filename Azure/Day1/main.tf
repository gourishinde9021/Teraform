resource "azurerm_resource_group" "my_rg" {
  name = "my_resource_group "
  location = "westus"
}

resource "azurerm_virtual_network" "a_vn" {
  name = "a_vnet"
  resource_group_name = azurerm_resource_group.my_rg.name
  location = azurerm_resource_group.my_rg.location
  address_space = ["10.0.0.0/16"]
}

