# terraform-aws-route53

terraform module to manage route53 domains
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.route53_records](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.route53_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_route53_zones"></a> [route53\_zones](#input\_route53\_zones) | route53 zones | <pre>list(object({<br>    name          = string<br>    type          = string<br>    force_destroy = bool<br>    vpc_id        = string<br>    tags          = map(string)<br>    dns_records = list(object({<br>      domain_name = string<br>      record_type = string<br>      ttl         = number<br>      records     = list(string)<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hosted_zones"></a> [hosted\_zones](#output\_hosted\_zones) | Collection of all route53 zones and child attributes |
| <a name="output_hosted_zones_records"></a> [hosted\_zones\_records](#output\_hosted\_zones\_records) | Collection of all route53 zones DNS records |
<!-- END_TF_DOCS -->