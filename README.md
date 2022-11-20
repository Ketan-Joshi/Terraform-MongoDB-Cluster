# Mongo Replica Set using Terraform

This repository allows creating MongoDB ReplicaSet in AWS EC2 instances. It includes the following resources:

- Jumpbox Instance:  
    * To access our MongoDB servers
    * To copy replication and cluster configutration files to MongoDB servers   
- Primary MongoDB Instance
- Secondary MongoDB Instances (you can define the count of read replicas here. For now, we are creating 2 secondary nodes)

## Prequisites:

1. AWS CLI must be installed and aws-profile must be already created 
2. AWS VPC must be already configured with min. 2 private subnets, 2 public subnets, and Nat gateway

- `Public Subnets`: Jumpbox is setup here
- `Private Subnets`: MongoDB nodes and NAT gateway

## Input

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| secondary\_node\_type | Instance type of Slave MongoDB Nodes | `string` | `t2.micro` | yes |
| primary\_node\_type | Instance type of Master MongoDB Node | `string` | `t2.micro` | yes |
| jumpbox\_instance\_type | Instance type of Bastion Server| `string` | `t2.nano` | yes |
| instance\_user | SSH Username | `string` | `ubuntu` | yes |
| key\_name | pem key file to ssh into servers | `string` | `mongo` | yes |
| vpc\_id | VPC ID where you want to launch your servers | `string` | `NA` | yes |
| environment | Environment Tag Name | `string` | `DEV` | yes |
| mongo\_subnet\_ids | List of Subnet Ids where MongoDB will be running (should be private) | `list` | `NA` | yes |
| jumpbox\_subnet\_ids | Subnet IDs where Bastion Server will be running (should be public) | `list` | `NA` | yes |
| vpc\_cidr\_block | This is for Security Group egress rules | `string` | `0.0.0.0/0` | yes |
| replica\_set\_name | Name of the MongoDB Replicaset which will be created  | `string` | `MongoRs` | yes |
| mongo\_username | MongoDB Username | `string` | `admin` | yes |
| mongo\_database | MongoDB Database | `string` | `admin` | yes |
| num\_secondary\_nodes| Number of Slave MongoDB Nodes | `integer` | `2` | yes |
| custom\_domain | If "true", then the custom domain name will be used for MongoDB else default Private IPs will be used | `bool` | `flase` | yes |
| domain\_name | The custom domain name if required | `string` | `n/a` | yes (only if "custom\_domain" is set to true) |
| ssm\_parameter\_prefix | Prefix for SSM Parameter Key Name | `string` | `MongoDB` | yes |

## Deploying the ReplicaSet:

1. Clone this repository and update the variables.tf file according to your values

2. Then, go to mongodb_module folder and update keyFile

3. `terraform init`: It will initialize the provider block and the module

4. `terraform plan`: To list-down all the changes that the terraform will be performing

5. `terraform apply`: Apply the changes required to build MongoDB ReplicaSet

6. After applying the changes, wait for the ReplicaSet creation. This will take approx. 5-10 minutes

## Add-Ons

- This supports Authentication as well

## Considerations

- This is the setup for Ubuntu 20.04 (for Ubuntu 22.x, no official dependency support is there for MongoDB yet)
- This uses host entries for DNS mapping
    * To be switched to private DNS: `To Do`

References
---

[https://www.terraform.io/](https://www.terraform.io/)

[https://www.mongodb.com/docs/v5.2/tutorial/expand-replica-set/](https://www.mongodb.com/docs/v5.2/tutorial/expand-replica-set/)
