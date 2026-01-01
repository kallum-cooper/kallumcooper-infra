locals {
  project     = "kallumcooper"
  root_domain = "kallumcooper.co.uk"
  site_domains = [
    local.root_domain,
    "www.${local.root_domain}"
  ]

  tags = {
    Project     = local.project
    Environment = var.environment
    ManagedBy   = "Terraform"
    Repo        = "kallumcooper-infra"
  }
}