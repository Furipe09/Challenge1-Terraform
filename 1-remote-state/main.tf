terraform {
  required_version = "1.1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "tf009"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "remote-state" {
  bucket        = "tfstate-2-${data.aws_caller_identity.current.account_id}-terraform"
  force_destroy = true
  versioning {
    enabled = true
  }

  tags = {
    Description = "Stores terraform remote state files"
    ManagedBy   = "Terraform"
    Owner       = "Felipe Vieira"
    CreatedAt   = "2022-02-14"
  }
}