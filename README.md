# Workload Identity Federation Terraform Module

Set up Google Cloud Workload Identity Federation (WIF) for AWS workloads, plus GitHub Actions to deploy it securely.

---

## What it does

- Creates a **Workload Identity Pool** and **Provider** in GCP for AWS STS.  
- Creates a **GCP Service Account** that AWS resources can impersonate.  
- Binds the IAM roles so that the AWS role can exchange credentials via WIF.  
- Uses GitHub Actions with OIDC to deploy Terraform and generate/upload WIF credential config to a GCS bucket.

## Please follow the below blog link for detailed explanation and configuration details step by step
https://ajay-gcpwif.hashnode.dev/gcp-workload-identity-federation-creation-for-aws-lambda-with-terraform

