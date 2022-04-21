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

module "waf" {
  providers = {
    aws.virginia = aws.virginia
  }

  source                         = "../../"
  prefix                         = "example-inflab-waf"
  scope                          = "CLOUDFRONT"
  ip_address_version             = "IPV4"
  addresses                      = ["10.0.0.1/32", "10.0.0.2/32"]
  enable_cloudwatch_metrics      = true
  enable_sampled_requests        = true
  enable_rule_cloudwatch_metrics = true
  enable_rule_sampled_requests   = true

  tags = {
    iac  = "terraform"
    temp = "true"
  }
}
