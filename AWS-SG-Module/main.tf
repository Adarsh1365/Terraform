
resource "aws_security_group" "sg_group" {
  name        = local.name
  tags=local.common_tags
  vpc_id     = var.vpc_id
}
