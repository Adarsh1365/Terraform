locals {
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg.value
  public_subnet_id = split(",",data.aws_ssm_parameter.public_subnet.value)[0]
  ami_id = data.aws_ami.joindevops.id
  common-name = "${var.project}-${var.environment}"
  common_tags = {
    Project = var.project
    Environment = var.environment
    Terraform = "true"
  }
}