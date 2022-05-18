data "http" "outbound_ip" {
  url = "http://ipv4.icanhazip.com"
}

variable "region" {
  description = "The AWS region in which the neo4j instances will be deployed"
}

variable "base_cidr_block" {
  description = "The base CIDR range for the VPC"
}

variable "creator" {
  description = "A variable containing details of the environment's creator"
}

variable "env_prefix" {
  description = "A variable containting a prefix for other variables"
}

variable "public_key_path" {
  description = "The location of the SSH key within the local environment"
}

variable "instance_types" {
  description = "A variable containing the desired instance type"
}
