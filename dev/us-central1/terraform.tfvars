# terraform.tfvars.example - Example variable values

# Project Configuration
#project_id     = "dev-demo-project"    #passing this in github secrets
region = "us-central1"
#project_number = "1234567899"          #passing this in github secrets

# Storage and Pub/Sub Configuration
gcs_bucket_name          = "dev-demo-bucket-new"
pubsub_topic_name        = "dev-demo-pubsub-topic-new"
dlq_pubsub_topic_name    = "dlq-dev-demo-pubsub-topic-new"
dlq_subscription_name    = "dlq-dev-demo-pubsub-topic-sub-new"
enable_gcs_notifications = false


# Workload Identity Federation Configuration
#pool_id                        = "dev-demo-aws-pool-2-new" #globally unique name
wif_pool_display_name = "dev-demo-aws-pool-2-new" #globally unique name
#provider_id                    = "aws-provider"                 #passing this in github secrets
wif_pool_provider_display_name = "aws-provider"

# AWS Configuration
# aws_account_id = "123456789"                                    #passing this in github secrets
# aws_role_name  = ["dev-wif-lambda-function-role"]               #passing this in github secrets

# Workload Identity Service Account
#service_account_id       = "dev-demo-sa"                         #passing this in github secrets
wif_service_account_name = "dev-demo-sa"
