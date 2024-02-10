output "remote-backend-bucket" {
  value = local.backend_bucket_name
}

output "ec2-ip" {
  value = aws_instance.ec2[*].public_ip
}