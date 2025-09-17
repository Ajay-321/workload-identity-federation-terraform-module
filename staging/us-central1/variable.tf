# variables.tf - Root module variables

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "terraform_service_account" {
  type = string
}
# Storage and Pub/Sub variables
variable "gcs_bucket_name" {
  description = "Name of the GCS bucket for Datastream"
  type        = string
}

variable "pubsub_topic_name" {
  description = "Name of the Pub/Sub topic"
  type        = string
}

variable "dlq_pubsub_topic_name" {
  description = "Name of the Dead Letter Queue Pub/Sub topic"
  type        = string
}

# Workload Identity Federation variables
variable "pool_id" {
  description = "Workload Identity Pool ID"
  type        = string
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

variable "dlq_subscription_name" {
  type = any
}

variable "project_number" {
  type = any
}

variable "enable_gcs_notifications" {
  description = "If true, create the GCS to Pub/Sub notification. If false, do not."
  type        = bool
  default     = false # Set the default to true or false as needed
}
