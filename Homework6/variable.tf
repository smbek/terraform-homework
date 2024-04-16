variable "instance_type" {
  type        = string
  description = "Provide instance type in tfvars file"
}
variable "region" {
    type = string
    description = "Provide region in tfvars file"
}
variable "ports" {
  type    = list(number)
  default = [22, 80]
}