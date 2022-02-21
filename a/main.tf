terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 3.67.0"
      configuration_aliases = [aws.seoul, aws.virginia]
    }
  }
}

data "aws_region" "seoul" {
  provider = aws.seoul
}

data "aws_region" "virginia" {
  provider = aws.virginia
}

output "seoul_region" {
  value = data.aws_region.seoul.name
}

output "virginia_region" {
  value = data.aws_region.virginia.name
}

