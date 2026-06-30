
resource "aws_security_group" "sg_group" {
  name        = local.name
  tags=local.common_tags
  vpc_id     = var.vpc_id
}

resource "aws_vpc_security_group_egress_rule" "egress_rule" {
  security_group_id = aws_security_group.sg_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
