/**
 * Module usage:
 *
 *     module "endpoint" {
 *       source         = "git::https://github.com/UKHomeOffice/acp-tf-endpoint//gateway?ref=master"
 *
 *       name            = "s3.eu-west-2"
 *       service_name    = "com.amazonaws.eu-west-2.s3"
 *       route_table_ids = [ "rtb-323829832", "rtb-32382122" ]
 *     }
 *
 */

# Get the host zone id
data "aws_route53_zone" "selected" {
  count = var.dns_zone == "" ? 0 : 1

  name         = var.dns_zone
  private_zone = var.dns_private
}

## Create the endpoint
resource "aws_vpc_endpoint" "endpoint" {
  service_name      = var.service_name
  route_table_ids   = var.route_table_ids
  vpc_endpoint_type = "Gateway"
  vpc_id            = var.vpc_id

  tags = {
    Name = var.name
  }
}

## Create a DNS entry for this NLB
resource "aws_route53_record" "dns" {
  count = var.dns_zone != "" ? 1 : 0

  zone_id = data.aws_route53_zone.selected[0].id
  name    = var.dns_name == "" ? var.name : var.dns_name
  type    = var.dns_type
  ttl     = var.dns_ttl
  records = [aws_vpc_endpoint.endpoint.dns_entry[0]["dns_name"]]
}
