resource "aws_route53_zone" "route53_zones" {
  for_each = local.route53_zones

  name          = each.value.name
  comment       = each.value.type == "public" ? "${each.value.name} public zone" : "${each.value.name} private zone"
  force_destroy = each.value.force_destroy

  dynamic "vpc" {
    for_each = each.value.type == "private" ? [each.value] : []
    content {
      vpc_id = vpc.value.vpc_id
    }
  }
}

resource "aws_route53_record" "route53_records" {
  for_each = local.route53_zone_records

  zone_id = aws_route53_zone.route53_zones[each.value.zone_record_name].id
  name    = each.value.domain_name
  type    = each.value.record_type
  ttl     = each.value.ttl
  records = each.value.records
}

