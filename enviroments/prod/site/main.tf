# Phase 1: Static site foundation
# Next steps will add:
# - Route 53 zone reference
# - ACM certificate in us-east-1
# - S3 origin bucket (via module)
# - CloudFront distribution (via module)
# - DNS records to CloudFront


module "origin_bucket" {
  source = "git::https://github.com/kallum-cooper/terraform-modules.git//modules/s3-private-origin-bucket?ref=v0.1.1"

  bucket_name        = "kc-${var.environment}-site-origin-${data.aws_caller_identity.current.account_id}"
  versioning_enabled = false
  tags               = local.tags
}

data "aws_caller_identity" "current" {}

module "cdn" {
  source = "git::https://github.com/kallum-cooper/terraform-modules.git//modules/cloudfront-static-site?ref=v0.1.1"

  name                = "kc-${var.environment}-site"
  origin_domain_name  = module.origin_bucket.bucket_regional_domain_name
  acm_certificate_arn = aws_acm_certificate.site.arn
  aliases             = local.site_domains
  tags                = local.tags
}
