terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 3.67.0"
    }
  }
}

provider "aws" {
  alias = "seoul"
  region = "ap-northeast-2"
}

provider "aws" {
  alias = "virginia"
  region = "us-east-1"
}

module "a" {
  source = "../a"
  providers = {
    aws.seoul = aws.seoul
    aws.virginia = aws.virginia
  }
}

output "seoul_region" {
  value = module.a.seoul_region
}

output "virginia_region" {
  value = module.a.virginia_region
}

