resource "aws_route53_record" "root_a" {
  zone_id = aws_route53_zone.root.zone_id
  name    = local.root_domain
  type    = "A"

  alias {
    name                   = module.cdn.distribution_domain_name
    zone_id                = module.cdn.distribution_hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "root_aaaa" {
  zone_id = aws_route53_zone.root.zone_id
  name    = local.root_domain
  type    = "AAAA"

  alias {
    name                   = module.cdn.distribution_domain_name
    zone_id                = module.cdn.distribution_hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_a" {
  zone_id = aws_route53_zone.root.zone_id
  name    = "www.${local.root_domain}"
  type    = "A"

  alias {
    name                   = module.cdn.distribution_domain_name
    zone_id                = module.cdn.distribution_hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_aaaa" {
  zone_id = aws_route53_zone.root.zone_id
  name    = "www.${local.root_domain}"
  type    = "AAAA"

  alias {
    name                   = module.cdn.distribution_domain_name
    zone_id                = module.cdn.distribution_hosted_zone_id
    evaluate_target_health = false
  }
}
