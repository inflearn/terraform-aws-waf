resource "aws_wafv2_ip_set" "this" {
  provider           = aws.virginia
  name               = "${var.prefix}-ip-set"
  scope              = var.scope
  ip_address_version = var.ip_address_version
  addresses          = var.addresses
  tags               = var.tags
}

resource "aws_wafv2_web_acl" "this" {
  provider = aws.virginia
  name     = "${var.prefix}-web-acl"
  scope    = var.scope
  tags     = var.tags

  default_action {
    block {}
  }

  rule {
    name     = "${var.prefix}-web-acl-rule"
    priority = 0

    action {
      allow {}
    }

    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.this.arn
      }
    }

    visibility_config {
      metric_name                = "${var.prefix}-web-acl-rule"
      cloudwatch_metrics_enabled = var.enable_rule_cloudwatch_metrics
      sampled_requests_enabled   = var.enable_rule_sampled_requests
    }
  }

  visibility_config {
    metric_name                = "${var.prefix}-web-acl-rule"
    cloudwatch_metrics_enabled = var.enable_cloudwatch_metrics
    sampled_requests_enabled   = var.enable_sampled_requests
  }
}
