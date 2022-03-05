terraform {
  required_version = "1.1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "2.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.1.0"
    }
  }

  backend "s3" {

    bucket = "tfstate-2-831989750918-terraform"
    #bucket  = var.bucket_tfstate
    key     = "dev/remote-state/terraform.tfstate"
    region  = "us-east-1"
    profile = "tf009"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "tf009"
}