variable "aws_region" {
  description = ""
  type        = string
}

variable "aws_profile" {
  description = ""
  type        = string
}


variable "aws_amis_ec2" {
  description = ""
  type        = string
}

variable "aws_instance_type_ec2" {
  description = ""
  type        = string
}

variable "aws_key_name_ec2" {
  description = ""
  type        = string
}

variable "aws_associate_public_ip_address_ec2" {
  description = ""
  type        = bool
}

variable "aws_instance_tags" {
  description = ""
  type        = map(string)
}

variable "aws_nginx_ec2" {
  description = ""
  type        = string
  default     = ""
}