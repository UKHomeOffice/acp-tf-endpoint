
# Module creating Interface-type VPC endpoints

For creating a VPC endpoint of type `Gateway` plase see [gateway/README.md](./gateway/README.md)

<!-- BEGIN_TF_DOCS -->
Module usage:

     module "endpoint" {
       source         = "git::https://github.com/UKHomeOffice/acp-tf-endpoint?ref=master"

       name            = "my-service"
       service\_name    = "com.amazonaws.vpce.eu-west-2.vpce-svc-2382383928392382"
       dns\_zone        = "example.com"
       ingress = [
         {
            "cidr" = "0.0.0.0/0"
            "port" = "6001"
         },
       ]
       subnet\_tags     = {
         "SubnetType" = "public"
       }
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
| [aws_security_group.filter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_vpc_endpoint.endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_subnet_ids.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_name"></a> [dns\_name](#input\_dns\_name) | An optional override for the dns name to use, defaults to var.name | `string` | `""` | no |
| <a name="input_dns_private"></a> [dns\_private](#input\_dns\_private) | Indicates the route53 domain is private | `bool` | `true` | no |
| <a name="input_dns_ttl"></a> [dns\_ttl](#input\_dns\_ttl) | The dns time-to-live for the dns alias record | `string` | `"300"` | no |
| <a name="input_dns_type"></a> [dns\_type](#input\_dns\_type) | The dns record type we should use for the alias | `string` | `"CNAME"` | no |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | The domain of a route53 domain you wish to add a cname to | `string` | `""` | no |
| <a name="input_egress"></a> [egress](#input\_egress) | An array of map of egress rules for the security group | `list` | <pre>[<br>  {<br>    "cidr": "0.0.0.0/0",<br>    "port": "-1",<br>    "protocol": "-1"<br>  }<br>]</pre> | no |
| <a name="input_ingress"></a> [ingress](#input\_ingress) | An array of map of ingress rules for the security group | `list` | <pre>[<br>  {<br>    "cidr": "0.0.0.0/0",<br>    "port": "-1",<br>    "protocol": "tcp"<br>  }<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | A descriptive name for the endpoint you can consuming | `any` | n/a | yes |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | An optional override to the security group name of the endpoint | `string` | `""` | no |
| <a name="input_security_tags"></a> [security\_tags](#input\_security\_tags) | A map of additional tags you can add to the security group tags | `map(string)` | `{}` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The private link endpoint service you wish to consumer | `any` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet ids | `list(string)` | `[]` | no |
| <a name="input_subnet_tags"></a> [subnet\_tags](#input\_subnet\_tags) | A map of tags to match the subnets we should attach the endpoint | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC id you to adding the endpoint to | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->