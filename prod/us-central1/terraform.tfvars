# terraform.tfvars.example - Example variable values

# Project Configuration
project_id     = "prod-demo-project"
region         = "us-central1"
project_number = "1234567899"

# Storage and Pub/Sub Configuration
gcs_bucket_name          = "prod-demo-bucket-new"
pubsub_topic_name        = "prod-demo-pubsub-topic-new"
dlq_pubsub_topic_name    = "dlq-prod-demo-pubsub-topic-new"
dlq_subscription_name    = "dlq-prod-demo-pubsub-topic-sub-new"
enable_gcs_notifications = false


# Workload Identity Federation Configuration
pool_id                        = "prod-demo-aws-pool-2-new" #globally unique name
wif_pool_display_name          = "prod-demo-aws-pool-2-new" #globally unique name
provider_id                    = "aws-provider"
wif_pool_provider_display_name = "aws-provider"

# AWS Configuration
aws_account_id = "123456789"
aws_role_name  = ["dev-wif-lambda-function-role"]

# Workload Identity Service Account
service_account_id       = "prod-demo-sa"
wif_service_account_name = "prod-demo-sa"
