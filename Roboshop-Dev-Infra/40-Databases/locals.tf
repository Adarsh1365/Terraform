locals {
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg.value
  data_subnet_id = split(",",data.aws_ssm_parameter.database_subnets.value)[0]
  ami_id = data.aws_ami.joindevops.id
  common-name = "${var.project}-${var.environment}"
  common_tags = {
    Project = var.project
    Environment = var.environment
    Terraform = "true"
  }
  hosted_zone_id = "Z00019002BVH3LOQYO0Q7"
  domain_name = "adarshdevopslearn.online"
}