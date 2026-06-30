locals {
common_tags = {
    Name        = local.common_name
    Environment = var.environment
    Project     = var.project
    Terraform   = "true"
  }
  common_name="${var.project}-${var.environment}"
  availability_zones = slice(data.aws_availability_zones.available.names, 0, var.no_of_availability_zones)
}