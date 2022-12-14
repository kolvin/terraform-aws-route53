variable "route53_zones" {
  type = list(object({
    name          = string
    type          = string
    force_destroy = bool
    vpc_id        = string
    tags          = map(string)
    dns_records = list(object({
      domain_name = string
      record_type = string
      ttl         = number
      records     = list(string)
    }))
  }))
  description = "route53 zones"
}
