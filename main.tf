module mongodb {
  source = "./mongodb_module"
  region = var.region
  profile = var.profile
  instance_ami = var.instance_ami //Ubuntu 20.x
  instance_prefix = var.instance_prefix
  secondary_node_type = var.secondary_node_type
  primary_node_type = var.primary_node_type
  jumpbox_instance_type = var.jumpbox_instance_type
  instance_user = var.instance_user
  key_name = var.key_name
  vpc_id = var.vpc_id
  mongo_subnet_ids = var.mongo_subnet_ids
  jumpbox_subnet_ids = var.jumpbox_subnet_ids
  vpc_cidr_block = var.vpc_cidr_block
  jumpbox_sg_name = var.jumpbox_sg_name
  mongodb_sg_name = var.mongodb_sg_name
  replica_set_name = var.replica_set_name
  mongo_password = var.mongo_password
  mongo_username = var.mongo_username
  mongo_database = var.mongo_database
  num_secondary_nodes = var.num_secondary_nodes
}