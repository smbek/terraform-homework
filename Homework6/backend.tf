terraform {
  backend "s3" {
    bucket = "kaizen-mairambek001122"
    key    = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "lock-state"
  }
}
