output "web_acl_id" {
  value = aws_wafv2_web_acl.this.id
}

output "web_acl_arn" {
  value = aws_wafv2_web_acl.this.arn
}

output "ip_set_addresses" {
  value = aws_wafv2_ip_set.this.addresses
}
