resource "aws_instance" "ec2_instance" {
  for_each               = tomap(var.instances)
  ami                    = each.value.ami_id
  instance_type          = each.value.instance_type
  vpc_security_group_ids = [aws_security_group.common.id, aws_security_group.security_groups[each.key].id]
  tags = {
    Name = "${var.project}-${var.environment}-${each.key}"
  }
}

resource "aws_security_group" "security_groups" {
  for_each = tomap(var.instances)
  name     = "${var.project}-${var.environment}-${each.key}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project}-${var.environment}-${each.key}"
  }
}

resource "aws_security_group" "common" {
  name = "${var.project}-${var.environment}-common"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project}-${var.environment}-common"
  }
}


resource "aws_route53_record" "route_records" {
  for_each = tomap(aws_instance.ec2_instance)
  name     = "${var.project}-${var.environment}-${each.key}.${var.domain}"
  type     = "A"
  ttl      = 1
  records  = [each.value.private_ip]
  zone_id  = "Z00019002BVH3LOQYO0Q7"
}

resource "aws_route53_record" "frontend" {
  count   = contains(keys(var.instances), "frontend") ? 1 : 0
  name    = "${var.project}-${var.environment}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [lookup(aws_instance.ec2_instance, "frontend").public_ip]
  zone_id = "Z00019002BVH3LOQYO0Q7"
}