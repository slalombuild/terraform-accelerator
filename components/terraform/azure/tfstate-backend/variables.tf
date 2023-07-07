variable "storage_account_tier" {
  type        = string
  default     = "Standard"
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium"
}

variable "storage_account_replication_type" {
  type        = string
  default     = "GRS"
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
}

variable "key_vault_key_type" {
  type        = string
  default     = "RSA"
  description = "Specifies the Key Type to use for this Key Vault Key. For Terraform state, supply RSA or RSA-HSM."
}

variable "key_vault_sku_name" {
  type        = string
  default     = "standard"
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
}

variable "key_vault_key_expiration_date" {
  type        = string
  default     = "2025-12-30T20:00:00Z"
  description = "Expiration of the Key Vault Key, in UTC datetime (Y-m-d'T'H:M:S'Z')."
}

variable "create_resource_group" {
  type        = bool
  description = "If true, a new resource group will be created using resource_group_name. If false, resource_group_name must be an existing resource group."
  default     = true
  nullable    = false
}

variable "location" {
  type        = string
  description = "The Azure location to create resources in."
}

variable "resource_group_name" {
  type        = string
  description = "(Optional) Resource group to use when creating resources."
  default     = null
}

variable "storage_account_name" {
  type        = string
  default     = null
  description = "(Optional) Storage account name. If not provided, the name will be generated by the label module in the format namespace-stage-name. Must be 3-24	characters, with lowercase letters and numbers only."
}

variable "key_vault_name" {
  type        = string
  default     = null
  description = "(Optional) Key Vault account name. If not provided, the name will be generated by the label module in the format namespace-stage-name. Must be 3-24 characters, alphanumerics and hyphens."
}

variable "key_vault_firewall_bypass_ip_cidr" {
  type        = string
  description = "IP range to allow access to Keyvault. If null, the requesting IP address will be added to enable resource provisioning."
  default     = null
}

variable "storage_account_network_rules" {
  description = "(Optional) A network_rules block"
  default     = {}
}

variable "enable_storage_account_network_rules" {
  description = "Enable storage account network rules usage"
  default     = false
}

variable "storage_account_network_rules_default_action" {
  description = "Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow"
  default     = "Deny"
}

variable "storage_account_network_rules_bypass" {
  description = "(Optional) Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None."
  default     = null
}

variable "storage_account_network_rules_ip_rules" {
  description = "(Optional) List of public IP or IP ranges in CIDR Format. Only IPv4 addresses are allowed. Private IP address ranges (as defined in RFC 1918) are not allowed."
  default     = null
}

variable "storage_account_network_rules_virtual_network_subnet_ids" {
  description = "(Optional) A list of virtual network subnet ids to to secure the storage account."
  default     = null
}

variable "storage_account_network_rules_private_link_access" {
  description = "(Optional) One or More private_link_access block"
  default     = {}
}

variable "storage_account_network_rules_timeouts" {
  description = "Set timeouts for storage account network rules"
  default     = {}
}
