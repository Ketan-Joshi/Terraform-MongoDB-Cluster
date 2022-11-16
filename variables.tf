variable "region" {
  default     = "us-east-1"
}
variable "profile" {
  default     = "default"
}
variable "instance_prefix" {
  description = "Name to instance"
  default     = "mongo-"
}
variable "secondary_node_type" {
  description = "Instance AWS type"
  default     = "t2.micro"
}
variable "primary_node_type" {
  description = "Instance AWS type"
  default     = "t2.micro"
}
variable jumpbox_instance_type {
  description = "Instance AWS type"
  default     = "t2.nano"
}
variable "instance_user" {
  description = "Instance user to ssh into instance"
  default     = "ubuntu"
}
variable "key_name" {
  description = "Key-pair name created in AWS"
  default     = "mongo"
}
variable "vpc_id" {
  description = "Mongo VPC"
  default     = "vpc-0c1f5b4a4078b3323"
}
variable "mongo_subnet_ids" {
  type = map
  default = {
    "us-east-1" = "subnet-0569ea294831bb782"
    "us-east-1" = "subnet-021140f7aa982054a"
  }
}
variable "jumpbox_subnet_ids" {
  type = map
  default = {
    "us-east-1" = "subnet-0b740611c69644d90"
    "us-east-1" = "subnet-076791df8d148a81a"
  }
}
variable "vpc_cidr_block" {
  default     = "0.0.0.0/0"
  description = "CIDR for SG"
}
variable "mongodb_sg_name" {
  default     = "MongoDB_SG"
}
variable "jumpbox_sg_name" {
  default = "Jumpbox_SG"
}
variable "replica_set_name" {
  default     = "mongoRs"
}
variable "mongo_username" {
  default     = "admin"
}
variable "mongo_database" {
  default     = "admin"
}
variable "num_secondary_nodes" {
  default = 2
}
variable "domain_name" {
  default = "digital.in.cld"
}