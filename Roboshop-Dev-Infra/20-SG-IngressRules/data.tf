data "aws_ssm_parameter" "mongodb" {
  name = "/${var.project}/${var.environment}/sg/mongodb"
}
data "aws_ssm_parameter" "mysql" {
  name = "/${var.project}/${var.environment}/sg/mysql"
}
data "aws_ssm_parameter" "redis" {
  name = "/${var.project}/${var.environment}/sg/redis"
}
data "aws_ssm_parameter" "rabbitmq" {
  name = "/${var.project}/${var.environment}/sg/rabbitmq"
}
data "aws_ssm_parameter" "catalogue" {
  name = "/${var.project}/${var.environment}/sg/catalogue"
}
data "aws_ssm_parameter" "user" {
  name = "/${var.project}/${var.environment}/sg/user"
}
data "aws_ssm_parameter" "cart" {
  name = "/${var.project}/${var.environment}/sg/cart"
}
data "aws_ssm_parameter" "shipping" {
  name = "/${var.project}/${var.environment}/sg/shipping"
}
data "aws_ssm_parameter" "payment" {
  name = "/${var.project}/${var.environment}/sg/payment"
}
data "aws_ssm_parameter" "backend_alb" {
  name = "/${var.project}/${var.environment}/sg/backend_alb"
}
data "aws_ssm_parameter" "frontend" {
  name = "/${var.project}/${var.environment}/sg/frontend"
}
data "aws_ssm_parameter" "frontend_alb" {
  name = "/${var.project}/${var.environment}/sg/frontend_alb"
}
data "aws_ssm_parameter" "bastion" {
  name = "/${var.project}/${var.environment}/sg/bastion"
}
data "http" "my_public_ip" {
  url = "https://ipv4.icanhazip.com"
}