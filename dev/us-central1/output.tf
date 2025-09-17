# outputs.tf - Root module outputs

output "gcs_bucket_name" {
  description = "Name of the created GCS bucket"
  value       = module.storage_pubsub.bucket_name
}

output "pubsub_topic_name" {
  description = "Name of the created Pub/Sub topic"
  value       = module.storage_pubsub.topic_name
}

output "pubsub_subscription_name" {
  description = "Name of the created Pub/Sub subscription"
  value       = module.storage_pubsub.subscription_name
}

output "workload_identity_pool_name" {
  description = "Name of the Workload Identity Pool"
  value       = module.workload_identity.pool_name
}

output "workload_identity_provider_name" {
  description = "Name of the Workload Identity Provider"
  value       = module.workload_identity.provider_name
}

output "wif_service_account_email" {
  description = "Email of the Workload Identity service account"
  value       = module.workload_identity.service_account_email
}

