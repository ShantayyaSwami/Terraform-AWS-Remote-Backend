# Terraform AWS Remote Backend Example

This Terraform project demonstrates how to create a remote backend on AWS using S3 and DynamoDB, and then use it in another Terraform project.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An AWS account with appropriate permissions.
- AWS CLI configured with credentials.

## Setup

1. Clone this repository to your local machine:

    ```bash
    git clone <repository-url>
    cd terraform-aws-remote-backend
    ```

2. Initialize Terraform:

    ```bash
    terraform init
    ```

3. Create the S3 bucket and DynamoDB table for the remote backend:

    ```bash
    terraform apply
    ```

4. After the resources are created, you will see the outputs including the name of the S3 bucket created for the backend.

## Resources Created
  1. S3 Bucket for Terraform state storage.
 2. DynamoDB Table for state locking.

## Usage in Another Terraform Project

To use the remote backend in another Terraform project, follow these steps:

1. Copy the `backend.tf` file from this project to your Terraform project.

2. Modify the `backend.tf` file to point to the remote backend S3 bucket and DynamoDB table created in the previous step.

    ```hcl
    terraform {
      backend "s3" {
        bucket         = "<bucket-name>"
        key            = "terraform.tfstate"
        dynamodb_table = "<table-name>"
        region         = "<region>"
      }
    }
    ```

    Replace `<bucket-name>`, `<table-name>`, and `<region>` with the appropriate values.

3. Initialize your Terraform project:

    ```bash
    terraform init
    ```

4. Now, Terraform will use the remote backend for storing its state file. You can proceed with managing your infrastructure as usual.

## Cleaning Up

To avoid incurring charges, make sure to destroy the resources created for this example when they are no longer needed:

```bash
terraform destroy


