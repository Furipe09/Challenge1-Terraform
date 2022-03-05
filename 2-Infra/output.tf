output "vpc_cidr_block" {
  value = aws_vpc.vpc_One.cidr_block
}
output "vpc_cidr_route_table_id" {
  value = aws_vpc.vpc_One.main_route_table_id
}
output "subnet_a_az" {
  value = aws_subnet.subNet_One_a.availability_zone
}
output "subnet_a_cidr_block" {
  value = aws_subnet.subNet_One_a.cidr_block
}
output "subnet_a_vpc_id" {
  value = aws_subnet.subNet_One_a.vpc_id
}
output "subnet_b_az" {
  value = aws_subnet.subNet_One_b.availability_zone
}
output "subnet_b_cidr_block" {
  value = aws_subnet.subNet_One_b.cidr_block
}
output "subnet_vpc_b_id" {
  value = aws_subnet.subNet_One_b.vpc_id
}
output "subnet_c_az" {
  value = aws_subnet.subNet_One_c.availability_zone
}
output "subnet_c_cidr_block" {
  value = aws_subnet.subNet_One_c.cidr_block
}
output "subnet_c_vpc_id" {
  value = aws_subnet.subNet_One_c.vpc_id
}
output "ec2_id" {
  value = module.ec2_One.id
}
output "ec2_ami" {
  value = module.ec2_One.ami
}
output "ec2_arn" {
  value = module.ec2_One.arn
}
output "ec2_ip" {
  value = module.ec2_One.ec2_ip
}