# modules/workload-identity/variables.tf
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "pool_id" {
  description = "Workload Identity Pool ID"
  type        = string
}

variable "project_number" {
  description = "gcp project number"
  type        = any
}

variable "wif_pool_display_name" {
  description = "Workload Identity Pool display name"
  type        = string
}

variable "provider_id" {
  description = "Workload Identity Pool Provider ID"
  type        = string
}

variable "wif_pool_provider_display_name" {
  description = "Workload Identity Pool Provider display name"
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "aws_role_name" {
  description = "AWS Role names"
  type        = list(string)
}

variable "service_account_id" {
  description = "Service account ID for Workload Identity"
  type        = string
}

variable "wif_service_account_name" {
  description = "Service account name for Workload Identity"
  type        = string
}
