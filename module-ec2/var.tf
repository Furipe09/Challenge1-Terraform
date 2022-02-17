variable "amis_ec2" {
  description = ""
  type        = string
}

variable "instance_type_ec2" {
  description = ""
  type        = string
}

variable "key_name_ec2" {
  description = ""
  type        = string
}

variable "securityGroupId_ec2" {
  description = ""
  type        = string
}

variable "subNetId_ec2" {
  description = ""
  type        = string
}

variable "associate_public_ip_address_ec2" {
  description = ""
  type        = bool
}

variable "instance_tags_ec2" {
  description = ""
  type        = map(string)
}

variable "nginx_ec2" {
  description = ""
  type        = string
}