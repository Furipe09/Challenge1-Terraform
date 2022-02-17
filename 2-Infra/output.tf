output "vpc_cidr_block" {
  value = aws_vpc.vpc_Earth.cidr_block
}
output "vpc_cidr_route_table_id" {
  value = aws_vpc.vpc_Earth.main_route_table_id
}
output "subnet_a_az" {
  value = aws_subnet.subNet_Earth_a.availability_zone
}
output "subnet_a_cidr_block" {
  value = aws_subnet.subNet_Earth_a.cidr_block
}
output "subnet_a_vpc_id" {
  value = aws_subnet.subNet_Earth_a.vpc_id
}
output "subnet_b_az" {
  value = aws_subnet.subNet_Earth_b.availability_zone
}
output "subnet_b_cidr_block" {
  value = aws_subnet.subNet_Earth_b.cidr_block
}
output "subnet_vpc_b_id" {
  value = aws_subnet.subNet_Earth_b.vpc_id
}
output "subnet_c_az" {
  value = aws_subnet.subNet_Earth_c.availability_zone
}
output "subnet_c_cidr_block" {
  value = aws_subnet.subNet_Earth_c.cidr_block
}
output "subnet_c_vpc_id" {
  value = aws_subnet.subNet_Earth_c.vpc_id
}
output "ec2_id" {
  value = module.ec2_Earth.id
}
output "ec2_ami" {
  value = module.ec2_Earth.ami
}
output "ec2_arn" {
  value = module.ec2_Earth.arn
}
output "ec2_ip" {
  value = module.ec2_Earth.ec2_ip
}