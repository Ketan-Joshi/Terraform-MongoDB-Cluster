variable "region" {}
variable "profile" {}
variable "secondary_node_type" {}
variable "primary_node_type" {}
variable "jumpbox_instance_type" {}
variable "instance_user" {}
variable "key_name" {}
variable "vpc_id" {}
variable "mongo_subnet_ids" {type = map}
variable "jumpbox_subnet_ids" {type = map}
variable "vpc_cidr_block" {}
variable "environment" {}
variable "replica_set_name" {}
variable "mongo_username" {}
variable "mongo_database" {}
variable "num_secondary_nodes" {}
variable "custom_domain" { type = bool }
variable "domain_name" {}
variable "ssm_parameter_prefix" {}