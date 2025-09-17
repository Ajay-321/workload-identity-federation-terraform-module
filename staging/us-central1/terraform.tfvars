# terraform.tfvars.example - Example variable values

# Project Configuration
project_id     = "staging-demo-project"
region         = "us-central1"
project_number = "1234567899"

# Storage and Pub/Sub Configuration
gcs_bucket_name          = "staging-demo-bucket-new"
pubsub_topic_name        = "staging-demo-pubsub-topic-new"
dlq_pubsub_topic_name    = "dlq-staging-demo-pubsub-topic-new"
dlq_subscription_name    = "dlq-staging-demo-pubsub-topic-sub-new"
enable_gcs_notifications = false


# Workload Identity Federation Configuration
pool_id                        = "staging-demo-aws-pool-2-new" #globally unique name
wif_pool_display_name          = "staging-demo-aws-pool-2-new" #globally unique name
provider_id                    = "aws-provider"
wif_pool_provider_display_name = "aws-provider"

# AWS Configuration
aws_account_id = "123456789"
aws_role_name  = ["dev-wif-lambda-function-role"]

# Workload Identity Service Account
service_account_id       = "staging-demo-sa"
wif_service_account_name = "staging-demo-sa"
