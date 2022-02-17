resource "aws_instance" "this" {

  ami                         = var.amis_ec2
  instance_type               = var.instance_type_ec2
  vpc_security_group_ids      = [var.securityGroupId_ec2]
  subnet_id                   = var.subNetId_ec2
  associate_public_ip_address = var.associate_public_ip_address_ec2

  key_name  = var.key_name_ec2
  user_data = file(var.nginx_ec2)
  tags = var.instance_tags_ec2
}

