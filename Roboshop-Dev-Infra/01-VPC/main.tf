module "main" {
  source = "git::https://github.com/Adarsh1365/Terraform.git//AWS-VPC-Module"
  project=var.project
  environment=var.environment
}