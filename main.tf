resource "aws_route53_zone" "route53_zone" {
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
