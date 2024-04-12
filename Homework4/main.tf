# Specify the region in which we would want to deploy our stack
provider "aws" {
  region = var.region
}

# Creating Instance
resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.ins_type
  count                  = var.ins_count
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "web-${count.index}"
  }
}
# All Variables
variable "ami_id" {
  description = "AMI_ID will be imported from tfvars file"
  default     = ""
  type        = string
}

variable "ins_type" {
  description = "Instance type will be imported from tfvars file"
  default     = ""
  type        = string
}
variable "region" {
  description = "Region will be imported from tfvars file"
  default     = ""
  type        = string
}
variable "availability_zones" {
  type    = string
  default = ""

}
variable "ins_count" {
  description = "Provided count "
  type        = number
}

variable ports {
  type        = list(number)
  default     = [22, 80, 443]
}
variable "key_name" {
  description = "The name for the key pair. Conflicts with `key_name_prefix`"
  type        = string
  default     = null
}
