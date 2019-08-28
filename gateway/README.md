# Module creating Gateway-type VPC endpoints

## Module usage

     module "endpoint" {
       source         = "git::https://github.com/UKHomeOffice/acp-tf-endpoint//gateway?ref=master"

       name            = "s3.eu-west-2"
       service_name    = "com.amazonaws.eu-west-2.s3"
       route_table_ids = [ "rtb-323829832", "rtb-32382122" ]
     }



## Inputs

| Name | Description | Default | Required |
|------|-------------|:-----:|:-----:|
| dns_name | An optional override for the dns name to use, defaults to var.name | `` | no |
| dns_private | Indicates the route53 domain is private | `true` | no |
| dns_ttl | The dns time-to-live for the dns alias record | `300` | no |
| dns_type | The dns record type we should use for the alias | `CNAME` | no |
| dns_zone | The domain of a route53 domain you wish to add a cname to | `` | no |
| name | A descriptive name for the endpoint you can consuming | - | yes |
| service_name | The private link endpoint service you wish to consumer | - | yes |
| vpc_id | The VPC id you to adding the endpoint to | - | yes |
| route_table_ids | A collection of route tables routing traffic to the endpoints (only valid for endpoints of type Gateway) | `[]` | no |
