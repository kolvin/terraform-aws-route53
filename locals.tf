locals {
  route53_zones = { for zone in var.route53_zones : "${zone.name}-${zone.type}" => zone }
}