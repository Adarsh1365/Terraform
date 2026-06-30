resource "aws_instance" "example" {
  count=4
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_terraform[count.index].id, aws_security_group.common.id]
  tags = {
    Name = "${var.project}-${var.environment}-${var.ec2-instance[count.index]}"
  }
}

resource "aws_security_group" "common" {
  name        = "Terraform-common"
  description = "Allow TLS inbound traffic and all outbound traffic"
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Terraform-common"
  }
}

resource "aws_security_group" "allow_terraform" {
  count=4
  name        = "${var.project}-${var.environment}-${var.ec2-instance[count.index]}"
  description = "Allow TLS inbound traffic and all outbound traffic"
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project}-${var.environment}-${var.ec2-instance[count.index]}"
  }
}