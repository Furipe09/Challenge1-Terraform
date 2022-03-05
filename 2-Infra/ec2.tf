module "ec2_One" {
  source = "../module-ec2"

  securityGroupId_ec2 = aws_security_group.sg_One.id
  #securityGroupId_ec2 = aws_security_group.SG-${var.name_Project}".id

  subNetId_ec2                    = aws_subnet.subNet_One_a.id
  associate_public_ip_address_ec2 = var.aws_associate_public_ip_address_ec2
  amis_ec2                        = var.aws_amis_ec2
  instance_type_ec2               = var.aws_instance_type_ec2
  key_name_ec2                    = var.aws_key_name_ec2
  nginx_ec2                       = var.aws_nginx_ec2
  instance_tags_ec2 = merge(var.aws_instance_tags,
    {
      Name = "EC2-${var.name_Project}"
    },
  )
}