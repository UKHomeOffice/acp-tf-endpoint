variable "dns_name" {
  description = "An optional override for the dns name to use, defaults to var.name"
  default     = ""
}

variable "dns_ttl" {
  description = "The dns time-to-live for the dns alias record"
  default     = "300"
}

variable "dns_private" {
  description = "Indicates the route53 domain is private"
  default     = true
}

variable "dns_type" {
  description = "The dns record type we should use for the alias"
  default     = "CNAME"
}

variable "dns_zone" {
  description = "The domain of a route53 domain you wish to add a cname to"
  default     = ""
}

variable "name" {
  description = "A descriptive name for the endpoint you can consuming"
}

variable "service_name" {
  description = "The private link endpoint service you wish to consumer"
}

variable "vpc_id" {
  description = "The VPC id you to adding the endpoint to"
}

variable "route_table_ids" {
  description = "A collection of route tables routing traffic to the endpoints (only valid for endpoints of type Gateway)"
  type        = list(string)
}

