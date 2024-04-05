# Creating Bastion-key
resource "aws_key_pair" "deployer" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")  
}

# Creating S3 Buckets
resource "aws_s3_bucket" "bn1" {
    bucket = "kaizen-mairambek"  
}
resource "aws_s3_bucket" "bn2" {
  bucket_prefix = "kaizen-"
  force_destroy = true
}
# Importing S3 bucket manually 
# terraform import aws_s3_bucket.bucket kaizenkaizen1122
# terraform import aws_s3_bucket.bucket kaizenkaizen112233

# Creating users
resource "aws_iam_user" "us" {
  for_each = toset([
    "jeny",
    "rose",
    "lisa",
    "jisoo"
    ])
  name = each.key
}

# Creating group
resource "aws_iam_group" "gr1" {
  name = "Blackpink"
}

# Adding users to group
resource "aws_iam_group_membership" "team" {
  name = "Blackpink-membership"

  users = [
     for i in aws_iam_user.us : i.name
  ]

  group = aws_iam_group.gr1.name
}