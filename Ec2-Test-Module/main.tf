module "ec2-test" {
  source = "../AWS-EC2-Instance-Module"
  project = var.project
  environment = var.environment
  component = var.component
  ami_id = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.vpc_test.public_subnet_ids[0]
  sg_ids = [module.sg_test.sg_ids]
  ec2_tags = { AvailabilyilityZone = module.vpc_test.availability_zones[0] }

}

module "sg_test" {
  source = "../AWS-SG-Module"
  project = var.project
  environment = var.environment
  component = var.component
    vpc_id = module.vpc_test.vpc_id
}

module "vpc_test" {
  source = "../AWS-VPC-Module"
  project = var.project
  environment = var.environment
  no_of_availability_zones = 2
}