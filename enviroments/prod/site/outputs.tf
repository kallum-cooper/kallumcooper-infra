output "site_domains" {
  description = "Domains this stack will serve."
  value       = local.site_domains
}

output "route53_name_servers" {
  description = "Set these as the domain's nameservers at registrar for domain."
  value       = aws_route53_zone.root.name_servers
}