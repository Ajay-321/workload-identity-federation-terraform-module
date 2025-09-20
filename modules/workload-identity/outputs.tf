# modules/workload-identity/outputs.tf
output "pool_name" {
  description = "Name of the Workload Identity Pool"
  value       = google_iam_workload_identity_pool.aws_pool.name
}

output "provider_name" {
  description = "Name of the Workload Identity Provider"
  value       = google_iam_workload_identity_pool_provider.aws_provider.name
}

output "service_account_email" {
  description = "Email of the Workload Identity service account"
  value       = google_service_account.wif_service_account.email
}


