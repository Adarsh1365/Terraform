resource "aws_instance" "ec2_instance" {
  count = length(var.instances)
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.common.id, aws_security_group.security_groups[count.index].id]
  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }
}

resource "aws_security_group" "security_groups"{
  count= length(var.instances)
  name = "${var.project}-${var.environment}-${var.instances[count.index]}"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
  }
}

resource "aws_security_group" "common"{
  name = "${var.project}-${var.environment}-common"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project}-${var.environment}-common"
  }
}

resource "aws_route53_record" "route_records"{
  count= length(var.instances)
  name    = "${var.project}-${var.environment}-${var.instances[count.index]}.${var.domain}"
  type    = "A"
  ttl = 1
  records = [aws_instance.ec2_instance[count.index].private_ip]
  zone_id = "Z00019002BVH3LOQYO0Q7"
}

resource "aws_route53_record" "frontend"{
  count= contains(var.instances,"frontend") ? 1 : 0
  name    = "${var.project}-${var.environment}.${var.domain}"
  type    = "A"
  ttl = 1
  records = [aws_instance.ec2_instance[index(var.instances, "frontend")].public_ip]
  zone_id = "Z00019002BVH3LOQYO0Q7"
}