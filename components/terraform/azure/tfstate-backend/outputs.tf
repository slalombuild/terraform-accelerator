output "resource_group_name" {
  value       = local.resource_group.name
  description = "The name of the resource group"
}

output "storage_account_id" {
  value       = azurerm_storage_account.tfstate.id
  description = "The ID of the Storage Account"
}

output "storage_account_primary_location" {
  value       = azurerm_storage_account.tfstate.primary_location
  description = "The primary location of the storage account."
}

output "storage_account_primary_blob_endpoint" {
  value       = azurerm_storage_account.tfstate.primary_blob_endpoint
  description = "The endpoint URL for blob storage in the primary location."
}

output "storage_account_primary_access_key" {
  value       = azurerm_storage_account.tfstate.primary_access_key
  description = "The primary access key for the storage account. This value is sensitive and masked from Terraform output."
  sensitive   = true
}

output "storage_container_id" {
  value       = azurerm_storage_container.tfstate.id
  description = "The ID of the Storage Container."
}

output "storage_container_has_immutability_policy" {
  value       = azurerm_storage_container.tfstate.has_immutability_policy
  description = "Is there an Immutability Policy configured on this Storage Container?"
}

output "storage_container_has_legal_hold" {
  value       = azurerm_storage_container.tfstate.has_legal_hold
  description = "Is there a Legal Hold configured on this Storage Container?"
}

output "storage_container_resource_manager_id" {
  value       = azurerm_storage_container.tfstate.resource_manager_id
  description = "The Resource Manager ID of this Storage Container."
}

output "key_vault_id" {
  value       = azurerm_key_vault.tfstate.id
  description = ""
}

output "key_vault_key_id" {
  value       = azurerm_key_vault_key.tfstate.id
  description = "The Key Vault Key ID"
}

output "key_vault_key_version" {
  value       = azurerm_key_vault_key.tfstate.version
  description = "The current version of the Key Vault Key."
}

output "z_instructions" {
  value = <<INSTRUCTIONS
If you just ran this for the first time, you are using local Terraform state. Let's move the local Terraform state into the storage account that we just created.

Create a file called backend.tf with the following contents:

terraform {
  backend "azurerm" {
    resource_group_name  = "${local.resource_group.name}"
    storage_account_name = "${azurerm_storage_account.tfstate.name}"
    container_name       = "${azurerm_storage_container.tfstate.name}"
    key                  = "statebucket/terraform.tfstate"
    subscription_id      = "${data.azurerm_client_config.current.subscription_id}"
    tenant_id            = "${data.azurerm_client_config.current.tenant_id}"
  }
}

Then run "terraform init -force-copy" to copy the current state to your new storage account.

INSTRUCTIONS
}
