output "bucket_name" {
  value = aws_s3_bucket.Terarform-state-bucket.bucket
}

output "table_name" {
  value = aws_dynamodb_table.terraform-statelock-table.name
}