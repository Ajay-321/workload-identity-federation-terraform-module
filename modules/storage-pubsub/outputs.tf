# modules/storage-pubsub/outputs.tf
output "bucket_name" {
  description = "Name of the created GCS bucket"
  value       = google_storage_bucket.datastream_bucket.name
}

output "bucket_url" {
  description = "URL of the created GCS bucket"
  value       = google_storage_bucket.datastream_bucket.url
}

output "topic_name" {
  description = "Name of the created Pub/Sub topic"
  value       = google_pubsub_topic.pubsub_topic.name
}

output "topic_id" {
  description = "ID of the created Pub/Sub topic"
  value       = google_pubsub_topic.pubsub_topic.id
}

output "dlq_topic_name" {
  description = "Name of the Dead Letter Queue topic"
  value       = google_pubsub_topic.pubsub_topic_dlq.name
}

output "subscription_name" {
  description = "Name of the created Pub/Sub subscription"
  value       = google_pubsub_subscription.pubsub_topic_sub.name
}