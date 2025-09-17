# modules/storage-pubsub/variables.tf
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

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
