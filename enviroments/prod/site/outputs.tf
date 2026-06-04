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

output "route53_zone_id" {
  value = aws_route53_zone.root.zone_id
}

output "origin_bucket_name" {
  value       = module.origin_bucket.bucket_name
  description = "S3 origin bucket name."
}

output "origin_bucket_arn" {
  value       = module.origin_bucket.bucket_arn
  description = "S3 origin bucket ARN."
}

output "origin_bucket_regional_domain" {
  value       = module.origin_bucket.bucket_regional_domain_name
  description = "S3 regional domain name used as the CloudFront origin."
}

output "cloudfront_domain_name" {
  value       = module.cdn.distribution_domain_name
  description = "CloudFront distribution domain name."
}

output "cloudfront_distribution_id" {
  value       = module.cdn.distribution_id
  description = "CloudFront distribution ID."
}

output "visit_counter_url" {
  value       = module.site_visit_counter.counter_url
  description = "URL that increments and returns the site visit count."
}
