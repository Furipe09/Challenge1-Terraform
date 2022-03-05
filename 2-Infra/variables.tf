variable "aws_region" {
  description = ""
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = ""
  type        = string
}

variable "aws_amis_ec2" {
  description = ""
  type        = string
  default     = "ami-04505e74c0741db8d"
}

variable "aws_instance_type_ec2" {
  description = ""
  type        = string
  default     = "t2.micro"
}

variable "aws_key_name_ec2" {
  description = ""
  type        = string
  default     = "deploy-terraform"
}

variable "aws_associate_public_ip_address_ec2" {
  description = ""
  type        = bool
  default     = true
}

variable "aws_instance_tags" {
  description = ""
  type        = map(string)
  default = {
    Provider = "terraform"
    Owner    = "Felipe Vieira"
    Version  = "14-02/2022"
  }
}

variable "aws_nginx_ec2" {
  description = ""
  type        = string
  default     = "./nginx.sh"
}

variable "name_Project" {
  description = ""
  type        = string
  default     = "Aquarius"
}

variable "bucket_tfstate" {
  description = ""
  type        = string
  default     = "tfstate-2-831989750918-terraform"
}
