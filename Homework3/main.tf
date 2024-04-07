# Specify the region in which we would want to deploy our stack
variable "region" {
  default = "us-east-2"
}

# Specify 3 availability zones from the region
variable "availability_zones" {
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

# # Create a VPC
# resource "aws_vpc" "my_vpc" {
#   cidr_block           = "10.0.0.0/16"
#   instance_tenancy     = "default"
#   enable_dns_support   = true
#   enable_dns_hostnames = true

#   tags = {
#     Name = "my_vpc"
#   }
# }
# # Create a subnet in each availability zone in the VPC. Keep in mind that at this point these subnets are private without internet access. They would need other networking resources for making them accesible
# resource "aws_subnet" "my_subnet" {
#   count             = length(var.availability_zones)
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = cidrsubnet("10.0.1.0/16", 8, count.index)
#   availability_zone = var.availability_zones[count.index]

#   tags = {
#     Name = "my-subnet-${count.index}"
#   }
# }


# Configure the AWS Provider
provider "aws" {
  region = var.region
}

data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20240329.0-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}



#  Create Instance
resource "aws_instance" "web" {
  instance_type               = "t2.micro"
  ami                         = data.aws_ami.amzn2.id
  associate_public_ip_address = true
  count                       = length(var.availability_zones)
  # subnet_id                   = aws_subnet.my_subnet[count.index].id

  tags = {
    Name = "web-${count.index}"
  }
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  key_name                    = aws_key_pair.deployer.key_name
  user_data                   = file("apache.sh")
  user_data_replace_on_change = true
}
output "ec2" {
  value = aws_instance.web[*].public_ip

}