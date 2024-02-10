resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  count = var.instance_count
  key_name = data.aws_key_pair.key.key_name
  tags = {
    env = "Dev"
  }
}

data "aws_key_pair" "key" {
  key_name = "terraform-key"
}