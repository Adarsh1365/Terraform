resource "aws_iam_role" "bastion" {
  name = "${local.common-name}-bastion-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  tags= merge(
    {
      Name = "${local.common-name}-bastion-role"
    },
    local.common_tags
  )
}

resource "aws_iam_role_policy_attachment" "bastion_policy" {
  role = aws_iam_role.bastion.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "bastion_profile" {
  name = "${local.common-name}-bastion-role"
  role = aws_iam_role.bastion.name
}