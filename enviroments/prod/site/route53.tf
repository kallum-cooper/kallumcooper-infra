resource "aws_route53_zone" "root" {
  name = local.root_domain

  tags = local.tags
}