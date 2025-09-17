# Enable required APIs
module "apis" {
  source     = "../../modules/apis"
  project_id = var.project_id
}

# Storage and Pub/Sub infrastructure
module "storage_pubsub" {
  source                   = "../../modules/storage-pubsub"
  project_id               = var.project_id
  region                   = var.region
  gcs_bucket_name          = var.gcs_bucket_name
  pubsub_topic_name        = var.pubsub_topic_name
  dlq_pubsub_topic_name    = var.dlq_pubsub_topic_name
  dlq_subscription_name    = var.dlq_subscription_name
  project_number           = var.project_number
  enable_gcs_notifications = var.enable_gcs_notifications

  depends_on = [module.apis]
}

# Workload Identity Federation for AWS
module "workload_identity" {
  source = "../../modules/workload-identity"

  project_id = var.project_id

  # Pool Configuration
  pool_id                        = var.pool_id
  wif_pool_display_name          = var.wif_pool_display_name
  provider_id                    = var.provider_id
  wif_pool_provider_display_name = var.wif_pool_provider_display_name

  # AWS Configuration
  aws_account_id = var.aws_account_id
  aws_role_name  = var.aws_role_name

  # Service Account
  service_account_id       = var.service_account_id
  wif_service_account_name = var.wif_service_account_name

  depends_on = [module.apis]
}

