locals {
  route53_zones = { for zone in var.route53_zones : "${zone.name}-${zone.type}" => zone }
  route53_zone_records = {
    for record in flatten(
      [
        for zone in var.route53_zones :
        [
          for dns_record in zone.dns_records : merge({ "zone_record_name" = "${zone.name}-${zone.type}" }, dns_record)
        ]
      ]
    ) : "${record.domain_name}_${record.record_type}" => record
  }
}