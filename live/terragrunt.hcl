generate "providers" {
  path = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents =  <<EOF
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}

provider  "aws" {
    region = "us-east-1"
}
EOF
}
