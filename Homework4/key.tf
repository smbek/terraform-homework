# Creating key pair
resource "aws_key_pair" "deployer" {
  key_name   = "my_key"
  public_key = file("~/.ssh/id_rsa.pub")

}
