terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.75.1"
    }
  }
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

module "whitelist" {
  providers = {
    aws.virginia = aws.virginia
  }

  source    = "../../"
  prefix    = "example-inflab-waf"
  addresses = ["10.0.0.1/32", "10.0.0.2/32"]

  tags = {
    iac  = "terraform"
    temp = "true"
  }
}
