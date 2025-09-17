# modules/workload-identity/main.tf - Workload Identity Federation for AWS

# Workload Identity Pool
resource "google_iam_workload_identity_pool" "aws_pool" {
  project                   = var.project_id
  workload_identity_pool_id = var.pool_id
  display_name              = var.wif_pool_display_name
  description               = "Identity pool for AWS workloads"
}

# Workload Identity Pool Provider
resource "google_iam_workload_identity_pool_provider" "aws_provider" {
  project                            = var.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.aws_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = var.provider_id
  display_name                       = var.wif_pool_provider_display_name
  description                        = "Identity pool provider for AWS STS"

  attribute_mapping = {
    "google.subject"     = "assertion.arn"
    "attribute.account"  = "assertion.account"
    "attribute.aws_role" = "assertion.arn.extract('assumed-role/{role}/')"
  }

  aws {
    account_id = var.aws_account_id
  }
}

# Service Account for Workload Identity
resource "google_service_account" "wif_service_account" {
  project      = var.project_id
  account_id   = var.service_account_id
  display_name = var.wif_service_account_name
  description  = "Service account for AWS workloads via Workload Identity Federation"
}

# Workload Identity User binding
resource "google_service_account_iam_binding" "wif_binding" {
  service_account_id = google_service_account.wif_service_account.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.aws_pool.name}/attribute.aws_role/${var.aws_role_name[0]}"
  ]
}

# Service Account Token Creator binding
resource "google_service_account_iam_binding" "wif_satocken_binding" {
  service_account_id = google_service_account.wif_service_account.name
  role               = "roles/iam.serviceAccountTokenCreator"

  members = [
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.aws_pool.name}/attribute.aws_role/${var.aws_role_name[0]}"
  ]
}

# Project-level IAM roles for the service account
resource "google_project_iam_member" "service_account_roles" {
  for_each = toset([
    "roles/iam.serviceAccountTokenCreator",
    "roles/pubsub.subscriber",
    "roles/pubsub.publisher",
    "roles/storage.objectViewer",
    "roles/iam.workloadIdentityUser"
  ])

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.wif_service_account.email}"
}
