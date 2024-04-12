
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type1[0].ins_type
  subnet_id              = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data              = file("ubuntuapache.sh")
  tags                   = local.common_tags
  # tags {
  #   Name = var.instance_type1[0].ins_name
  # }
}

output "Ubuntu" {
  value = aws_instance.web.public_ip

}
