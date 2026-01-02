output "site_domains" {
  description = "Domains this stack will serve."
  value       = local.site_domains
}

output "route53_name_servers" {
  description = "Set these as the domain's nameservers at registrar for domain."
  value       = aws_route53_zone.root.name_servers
}

output "acm_certificate_arn" {
  description = "ACM certificate ARN in us-east-1 (for CloudFront)."
  value       = aws_acm_certificate.site.arn
}
