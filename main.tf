resource "aws_s3_bucket" "Terarform-state-bucket" {
  bucket = "terraformremotebackendbucket123"
}

# resource "aws_s3_bucket_acl" "Terarform-state-bucket" {
#   depends_on = [aws_s3_bucket.Terarform-state-bucket]
#   bucket     = aws_s3_bucket.Terarform-state-bucket.id
#   acl        = "private"
# }

resource "aws_s3_bucket_ownership_controls" "Terarform-state-bucket" {
  bucket = aws_s3_bucket.Terarform-state-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }

}

resource "aws_s3_bucket_versioning" "Terarform-state-bucket" {
  bucket = aws_s3_bucket.Terarform-state-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_dynamodb_table" "terraform-statelock-table" {
  name         = "terraform-statelock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}