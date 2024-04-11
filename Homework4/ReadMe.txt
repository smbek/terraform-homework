
Hi guys, This Terraform code will creates key, security group and ec2 instance (works with default VPC)
to deploy my code make sure you have Terraform verion v1.7.5
1. Create tfvars file eg. ohio.tfvars
2. You have to provide:  
    region            = "us-east-2"
    avaiability_zones = "us-east-2c"
    ami_id            = "ami-0900fe555666598a2"
    ins_type          = "t2.micro"
    ins_count         = 1

to execute type this command
3. terraform apply -var-file ohio.tfvars
4. terraform destroy -var-file ohio.tfvars
Enjoy.


