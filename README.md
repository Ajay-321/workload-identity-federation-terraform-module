# Workload Identity Federation Terraform Module

Set up Google Cloud Workload Identity Federation (WIF) for AWS workloads, plus GitHub Actions to deploy it securely.

---

## What it does

- Creates a **Workload Identity Pool** and **Provider** in GCP for AWS STS.  
- Creates a **GCP Service Account** that AWS resources can impersonate.  
- Binds the IAM roles so that the AWS role can exchange credentials via WIF.  
- Uses GitHub Actions with OIDC to deploy Terraform and generate/upload WIF credential config to a GCS bucket.

---

## Prerequisites

- A Google Cloud project with sufficient permissions.  
- An AWS account and IAM role you want to federate with.  
- A GCS bucket to store credential/config files.  
- GitHub Secrets configured for:
  - `PROJECT_ID`, `PROJECT_NUMBER`  
  - `AWS_ACCOUNT_ID`, `AWS_ROLE_NAME`  
  - `AWS_WIF_POOL_NAME`, `AWS_WIF_PROVIDER_NAME`  
  - `AWSSERVICE_ACCOUNT_NAME`  #Required for WIF with least priviledge Access
  - `GCS bucket name` # to upload wif metadata credentials json file in GCS Bucket  
  - WIF provider resource string & service account for GitHub OIDC auth

---

## 📁 Module Inputs (`variables.tf`)

| Name                    | Type     | Description                                              |
|-------------------------|----------|----------------------------------------------------------|
| `project_id`            | string   | GCP project ID                                           |
| `project_number`        | string   | GCP project number                                       |
| `pool_id`               | string   | WIF pool identifier (unique globally)                   |
| `provider_id`           | string   | WIF provider ID                                          |
| `aws_account_id`        | string   | AWS account number                                       |
| `aws_role_name`         | list     | AWS IAM role names (assumed roles) you allow via WIF    |
| `service_account_id`    | string   | GCP SA that AWS will impersonate via WIF                |
| ...                     | ...      | (other variables like bucket name, pubsub topics etc.)   |

---

## Example Usage

### In GitHub Actions
Pass this env section in terraform plan and apply stages
env:
  TF_VAR_project_id: ${{ secrets.PROJECT_ID }}
  TF_VAR_project_number: ${{ secrets.PROJECT_NUMBER }}
  TF_VAR_pool_id: ${{ secrets.WIF_POOL_NAME }}
  TF_VAR_provider_id: ${{ secrets.WIF_PROVIDER_NAME }}
  TF_VAR_service_account_id: ${{ secrets.SERVICE_ACCOUNT_NAME }}
  TF_VAR_aws_account_id: ${{ secrets.AWS_ACCOUNT_ID }}
  TF_VAR_aws_role_name: ${{ secrets.AWS_ROLE_NAME }}



## Authentication step:

    - uses: google-github-actions/auth@v2
      with:
        workload_identity_provider: ${{ secrets.GCP_WIF_PROVIDER_RESOURCE }}
        service_account: ${{ secrets.GCP_WIF_SERVICE_ACCOUNT_EMAIL }}

## Terraform steps: init, plan, apply.

## IAM / Permissions

# The GitHub OIDC service account needs:

    * roles/iam.workloadIdentityPoolAdmin (or equivalent)

    * roles/iam.serviceAccountTokenCreator

    * On the GCS bucket: at least roles/storage.objectAdmin so terraform init and gsutil cp can read/write credential files.

# Keep in mind below important points for this setup

* Make sure the secret names and values are spelled exactly and match variable names.

* Ensure terraform init runs after authentication in the GitHub Actions workflow.

* Check IAM on GCS bucket: does the service account have storage.objects.list?

* Ensure the WIF provider secret uses the correct resource string format:
projects/<PROJECT_NUMBER>/locations/global/workloadIdentityPools/<POOL_ID>/providers/<PROVIDER_ID>