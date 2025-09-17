# terraform.tfvars.example - Example variable values

# Project Configuration
project_id     = "dev-wif-demo-project"
region         = "us-central1"
project_number = "714577039665"
#terraform_service_account = "dev-terraform-service-account@staging-wif-demo-project.iam.gserviceaccount.com"

# Storage and Pub/Sub Configuration
gcs_bucket_name          = "staging-wif-demo-bucket"
pubsub_topic_name        = "staging-wif-demo-pubsub-topic"
dlq_pubsub_topic_name    = "dlq-staging-wif-demo-pubsub-topic"
dlq_subscription_name    = "dlq-staging-wif-demo-pubsub-topic-sub"
enable_gcs_notifications = false


# Workload Identity Federation Configuration
pool_id                        = "staging-wif-demo-aws-pool-213" #globally unique name
wif_pool_display_name          = "staging-wif-demo-aws-pool-213" #globally unique name
provider_id                    = "aws-provider"
wif_pool_provider_display_name = "aws-provider"

# AWS Configuration
aws_account_id = "214408080534"
aws_role_name  = ["dev-lambda-function-role"]

# Workload Identity Service Account
service_account_id       = "staging-wif-demo-aws-sa"
wif_service_account_name = "staging-wif-demo-aws-sa"
