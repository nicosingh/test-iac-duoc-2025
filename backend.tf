terraform {
  backend "azurerm" {
    resource_group_name  = "AreaInfraestructura"
    storage_account_name = "testiacduoc2025"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}
