module mongodb {
  source = "./mongodb_module"
  region = "us-east-1"
  profile = "default"
  secondary_node_type = "t2.micro"
  primary_node_type = "t2.micro"
  jumpbox_instance_type = "t2.nano"
  instance_user = "ubuntu"
  key_name = "mongo"
  vpc_id = "vpc-0c1f5b4a4078b3323"
  mongo_subnet_ids = {
    "us-east-1" = "subnet-0569ea294831bb782"
    "us-east-1" = "subnet-021140f7aa982054a"
  }
  jumpbox_subnet_ids = {
    "us-east-1" = "subnet-0b740611c69644d90"
    "us-east-1" = "subnet-076791df8d148a81a"
  }
  vpc_cidr_block = "0.0.0.0/0" //This is for SG egress rules
  replica_set_name = "mongoRs"
  mongo_username = "admin"
  mongo_database = "admin"
  num_secondary_nodes = 2
  domain_name = "digital.in.cld"
  mongodb_admin_password_ssm_name = "mongodb_admin_password" // SSM parameter will be creatd with this name
  mongodb_admin_user_ssm_name = "mongodb_admin_user" // SSM parameter will be creatd with this name
  mongodb_admin_db_ssm_name = "mongodb_admin_db" // SSM parameter will be creatd with this name
  mongodb_domain_ssm_name = "mongodb_domain" // SSM parameter will be creatd with this name
}