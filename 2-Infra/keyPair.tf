resource "tls_private_key" "this" {
  algorithm = "RSA"
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "deploy-terraform"
  public_key = file("/home/furion/.ssh/id_rsa.pub") 
  #tls_private_key.this.public_key_openssh
}