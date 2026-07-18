module "main" {
  count = length(var.sg_name)
  source = "git::https://github.com/Adarsh1365/Terraform.git//AWS-SG-Module"
  project=var.project
  environment=var.environment
  sg_name=var.sg_name[count.index]
  vpc_id=local.vpc_id
}