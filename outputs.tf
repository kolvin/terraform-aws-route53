output "hosted_zones" {
  value = aws_route53_zone.route53_zones
  description = "Collection of all route53 zones and child attributes"
}

output "hosted_zones_records" {
  value = aws_route53_record.route53_records
  description = "Collection of all route53 zones DNS records"
}
