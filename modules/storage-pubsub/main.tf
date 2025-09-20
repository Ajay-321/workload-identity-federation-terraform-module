# modules/storage-pubsub/main.tf - GCS Bucket and Pub/Sub resources

locals {
  pubsub_sa    = "service-${var.project_number}@gcp-sa-pubsub.iam.gserviceaccount.com"
  gcs_sa_email = "service-${var.project_number}@gs-project-accounts.iam.gserviceaccount.com"
}



# GCS Bucket
resource "google_storage_bucket" "datastream_bucket" {
  name                        = var.gcs_bucket_name
  location                    = var.region
  project                     = var.project_id
  uniform_bucket_level_access = true
}

resource "google_pubsub_subscription" "dead_letter_subscription" {
  name    = var.dlq_subscription_name
  topic   = google_pubsub_topic.pubsub_topic_dlq.name
  project = var.project_id
}

resource "google_pubsub_topic_iam_member" "dlq_publisher" {
  topic  = google_pubsub_topic.pubsub_topic_dlq.name
  role   = "roles/pubsub.publisher"
  member = "serviceAccount:${local.pubsub_sa}"
}

resource "google_pubsub_topic_iam_member" "dlq_subscriber" {
  topic      = google_pubsub_topic.pubsub_topic_dlq.name
  role       = "roles/pubsub.subscriber"
  member     = "serviceAccount:${local.pubsub_sa}"
  depends_on = [google_pubsub_subscription.dead_letter_subscription]
}

resource "google_pubsub_subscription_iam_member" "main_subscriber" {
  subscription = google_pubsub_subscription.pubsub_topic_sub.name
  role         = "roles/pubsub.subscriber"
  member       = "serviceAccount:${local.pubsub_sa}"
}

resource "google_pubsub_topic_iam_member" "main_subscriber" {
  topic      = google_pubsub_topic.pubsub_topic.name
  role       = "roles/pubsub.subscriber"
  member     = "serviceAccount:${local.pubsub_sa}"
  project    = var.project_id
  depends_on = [google_pubsub_subscription.pubsub_topic_sub]
}


# Pub/Sub Topic
resource "google_pubsub_topic" "pubsub_topic" {
  name    = var.pubsub_topic_name
  project = var.project_id
}

resource "google_pubsub_topic" "pubsub_topic_dlq" {
  name    = var.dlq_pubsub_topic_name
  project = var.project_id
}

# Pub/Sub Subscription
resource "google_pubsub_subscription" "pubsub_topic_sub" {
  name                         = "${var.pubsub_topic_name}-subscription"
  topic                        = google_pubsub_topic.pubsub_topic.name
  project                      = var.project_id
  enable_exactly_once_delivery = true
  enable_message_ordering      = true

  ack_deadline_seconds = 120

  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.pubsub_topic_dlq.id
    max_delivery_attempts = 5
  }
}

# Grant GCS service account permission to publish to Pub/Sub
resource "google_pubsub_topic_iam_member" "gcs_pubsub_publisher" {
  topic   = google_pubsub_topic.pubsub_topic.id
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:${local.gcs_sa_email}"
  project = var.project_id
}

# GCS Storage Notification
resource "google_storage_notification" "gcs_notification" {
  count          = var.enable_gcs_notifications ? 1 : 0
  bucket         = google_storage_bucket.datastream_bucket.name
  payload_format = "JSON_API_V1"
  topic          = google_pubsub_topic.pubsub_topic.id
  event_types    = ["OBJECT_FINALIZE"]

  depends_on = [google_pubsub_topic_iam_member.gcs_pubsub_publisher]
}

