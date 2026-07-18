resource "aws_instance" "bastion" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id     = local.public_subnet_id
  iam_instance_profile= aws_iam_instance_profile.bastion_profile.name
  user_data    = templatefile("${path.module}/bastion-boot.sh.tftpl",{
    partition_number=4,
    extend_size=30
  })

  root_block_device {
    volume_size           = 50      # Size of the volume in GiB
    volume_type           = "gp3"   # General Purpose SSD (gp3 is recommended)

    tags = merge(
      {
        Name = "${local.common-name}-bastion"
      },
      local.common_tags
    )
  }

  tags =merge({Name="${local.common-name}-bastion"}, local.common_tags)
}