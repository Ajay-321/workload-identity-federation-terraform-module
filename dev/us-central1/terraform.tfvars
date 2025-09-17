# terraform.tfvars.example - Example variable values

# Project Configuration
project_id     = "dev-wif-demo-project"
region         = "us-central1"
project_number = "714577039665"

# Storage and Pub/Sub Configuration
gcs_bucket_name          = "dev-wif-demo-bucket-new"
pubsub_topic_name        = "dev-wif-demo-pubsub-topic-new"
dlq_pubsub_topic_name    = "dlq-dev-wif-demo-pubsub-topic-new"
dlq_subscription_name    = "dlq-dev-wif-demo-pubsub-topic-sub-new"
enable_gcs_notifications = false


# Workload Identity Federation Configuration
pool_id                        = "dev-wif-demo-aws-pool-2-new" #globally unique name
wif_pool_display_name          = "dev-wif-demo-aws-pool-2-new" #globally unique name
provider_id                    = "aws-provider"
wif_pool_provider_display_name = "aws-provider"

# AWS Configuration
aws_account_id = "214408080534"
aws_role_name  = ["dev-lambda-function-role"]

# Workload Identity Service Account
service_account_id       = "dev-wif-demo-sa"
wif_service_account_name = "dev-wif-demo-sa"
