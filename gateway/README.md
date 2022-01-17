# Module creating Gateway-type VPC endpoints

<!-- BEGIN_TF_DOCS -->
Module usage:

    module "endpoint" {
      source         = "git::https://github.com/UKHomeOffice/acp-tf-endpoint//gateway?ref=master"

      name            = "s3.eu-west-2"
      service\_name    = "com.amazonaws.eu-west-2.s3"
      route\_table\_ids = [ "rtb-323829832", "rtb-32382122" ]
    }

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.72.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_vpc_endpoint.endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_name"></a> [dns\_name](#input\_dns\_name) | An optional override for the dns name to use, defaults to var.name | `string` | `""` | no |
| <a name="input_dns_private"></a> [dns\_private](#input\_dns\_private) | Indicates the route53 domain is private | `bool` | `true` | no |
| <a name="input_dns_ttl"></a> [dns\_ttl](#input\_dns\_ttl) | The dns time-to-live for the dns alias record | `string` | `"300"` | no |
| <a name="input_dns_type"></a> [dns\_type](#input\_dns\_type) | The dns record type we should use for the alias | `string` | `"CNAME"` | no |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | The domain of a route53 domain you wish to add a cname to | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | A descriptive name for the endpoint you can consuming | `any` | n/a | yes |
| <a name="input_route_table_ids"></a> [route\_table\_ids](#input\_route\_table\_ids) | A collection of route tables routing traffic to the endpoints (only valid for endpoints of type Gateway) | `list(string)` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The private link endpoint service you wish to consumer | `any` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC id you to adding the endpoint to | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->