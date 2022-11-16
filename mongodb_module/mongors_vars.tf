variable "region" {}
variable "profile" {}
variable "instance_ami" {}
variable "instance_prefix" {}
variable "secondary_node_type" {}
variable "primary_node_type" {}
variable "jumpbox_instance_type" {}
variable "instance_user" {}
variable "key_name" {}
variable "vpc_id" {}
variable "mongo_subnet_ids" {type = map}
variable "jumpbox_subnet_ids" {type = map}
variable "vpc_cidr_block" {}
variable "mongodb_sg_name" {}
variable "jumpbox_sg_name" {}
variable "replica_set_name" {}
variable "mongo_password" {}
variable "mongo_username" {}
variable "mongo_database" {}
variable "num_secondary_nodes" {}