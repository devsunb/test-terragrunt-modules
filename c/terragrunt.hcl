generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  alias = "seoul"
  region = "ap-northeast-2"
}

provider "aws" {
  alias = "virginia"
  region = "us-east-1"
}
EOF
}

terraform {
  source = "git::git@github.com:devsunb/test-terragrunt-modules.git//a"
}

inputs = {}

