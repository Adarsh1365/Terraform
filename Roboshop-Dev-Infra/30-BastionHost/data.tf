data "aws_ssm_parameter" "bastion_sg" {
  name = "/${var.project}/${var.environment}/sg/bastion"
}

data "aws_ssm_parameter" "public_subnet" {
  name = "/${var.project}/${var.environment}/Public-Subnets"
}
data "aws_ami" "joindevops" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}