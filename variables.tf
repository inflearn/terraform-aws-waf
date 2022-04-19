variable "prefix" {
  type = string
}

variable "scope" {
  type    = string
  default = "CLOUDFRONT"
}

variable "ip_address_version" {
  type    = string
  default = "IPV4"
}

variable "addresses" {
  type = list(string)
}

variable "enable_cloudwatch_metrics" {
  type    = bool
  default = true
}

variable "enable_sampled_requests" {
  type    = bool
  default = true
}

variable "enable_rule_cloudwatch_metrics" {
  type    = bool
  default = true
}

variable "enable_rule_sampled_requests" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
