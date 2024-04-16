Hi everyone. 

Project description:
Create S3 bucket and write Terraform code that stores state file in S3 bucket and locks it.
Terraform should create EC2 instance with latest Ubuntu image and installs Apache on it.
Instance type and region should be variables and provided in tfvars file.
Create 4 tfvars files for 4 US regions and use workspace to create instance in all 4 regions.
Create Makefile to automate the process.
Confirm you can see state files for all 4 regions in S3 bucket.

1. My code is working with default VPC
2. You have to provide variables for Instance type and region in tfvars file
3. I use make file to automate all process
4. Manually create S3 bucket and provide given name in the backend.tf file (We can isolate our state file using this way.)
5. Also create dynamodb_table and provide given name in the backend.tf file
6. Thank you for using my code, Enjoy!