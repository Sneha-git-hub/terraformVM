provider "azurerm" {
  features {}
}
resource "azurerm_storage_account" "storageacct" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name1
  location                 = var.resource_group_location1
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "production"
  }
}
resource "azurerm_storage_container" "storagectr" {
  name                  = var.storage_acct_cntr_name
  storage_account_name  = azurerm_storage_account.storageacct.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blobstor" {
  name                   = var.storage_acct_blob_name
  storage_account_name   = azurerm_storage_account.storageacct.name
  storage_container_name = azurerm_storage_container.storagectr.name
  type                   = "Block"
  //source                 = "some-local-file.zip"
}