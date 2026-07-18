data "aws_ssm_parameter" "mongodb_sg" {
  name = "/${var.project}/${var.environment}/sg/mongodb"
}

data "aws_ssm_parameter" "redis_sg" {
  name = "/${var.project}/${var.environment}/sg/redis"
}

data "aws_ssm_parameter" "rabbitmq_sg" {
  name = "/${var.project}/${var.environment}/sg/rabbitmq"
}

data "aws_ssm_parameter" "mysql_sg" {
  name = "/${var.project}/${var.environment}/sg/mysql"
}

data "aws_ssm_parameter" "database_subnets" {
  name = "/${var.project}/${var.environment}/Database-Subnets"
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