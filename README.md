# Mongo Replica Set using Terraform

This repository allows creating MongoDB ReplicaSet in AWS EC2 instances. It includes the following resources:

- Jumpbox Instance:  We are using this to access our MongoDB servers
- Primary MongoDB Instance
- Secondary MongoDB Instances (you can define the count of read replicas here. For now, we are creating 2 secondary nodes)

## Prequisites:

1. AWS CLI must be installed and aws-profile must be already created 
2. AWS VPC must be already configured with min. 2 private subnets, 2 public subnets, and Nat gateway

- Public Subnets: Jumpbox is setup here
- Private Subnets: MongoDB nodes and NAT gateway

## Deploying the ReplicaSet:

1. Clone this repository and update the variables.tf file according to your values

2. Then, go to mongodb_module folder and update keyFile

3. `terraform init`: It will initialize the provider block and the module

4. `terraform plan`: To list-down all the changes that the terraform will be performing

5. `terraform apply`: Apply the changes required to build MongoDB ReplicaSet

6. After applying the changes, wait for the ReplicaSet creation. This will take approx. 5-10 minutes

## Considerations

- This is the setup for Ubuntu 20.04 (for Ubuntu 22.x, no official dependency support is there for MongoDB yet)

References
---

[https://www.terraform.io/](https://www.terraform.io/)

[https://www.mongodb.com/docs/v5.2/tutorial/expand-replica-set/](https://www.mongodb.com/docs/v5.2/tutorial/expand-replica-set/)
