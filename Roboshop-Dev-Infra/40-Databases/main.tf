terraform {
  required_providers {
    terraform = {
      source  = "builtin/terraform"
      version = ""
    }
  }
}
resource "aws_instance" "mongodb" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.mongodb_sg_id]
  subnet_id     = local.data_subnet_id

  tags =merge({Name="${local.common-name}-mongodb"}, local.common_tags)
}

resource "terraform_data" "mongodb" {
  triggers_replace = [
    aws_instance.mongodb.id,
  ]

  connection {
    type        = "ssh"
    host        = aws_instance.mongodb.public_ip
    user        = "ec2-user"
    password    = "DevOps321"
  }

  provisioner "remote-exec" {

  }
}