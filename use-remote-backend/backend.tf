terraform {
  backend "s3" {
    bucket         = "terraformremotebackendbucket123"
    key            = "terraform.tfstate"
    dynamodb_table = "terraform-statelock"
    region         = "ap-south-1"
  }
}

locals {
  backend_bucket_name = "terraformremotebackendbucket123"
}