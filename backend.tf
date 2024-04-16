terraform {
   backend "azurerm" {
     resource_group_name  = "statefile"
     storage_account_name = "stracct8789797987"
     container_name       = "statefile"
     key                  = "terraform.tfstate"

     }
}
  