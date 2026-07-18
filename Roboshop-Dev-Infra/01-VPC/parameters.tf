resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project}/${var.environment}/VPC-ID"
  type  = "String"
  value = module.main.vpc_id
}

resource "aws_ssm_parameter" "public_subnets" {
  name  = "/${var.project}/${var.environment}/Public-Subnets"
  type  = "String"
  value = join(",",module.main.public_subnet_ids)
  overwrite = true
}

resource "aws_ssm_parameter" "private_subnets" {
  name  = "/${var.project}/${var.environment}/Private-Subnets"
  type  = "String"
  value = join(",",module.main.private_subnet_ids)
  overwrite = true
}
resource "aws_ssm_parameter" "database_subnets" {
  name  = "/${var.project}/${var.environment}/Database-Subnets"
  type  = "String"
  value = join(",",module.main.database_database_ids)
  overwrite = true
}