provider "aws" {
  region = "ap-south-1"
}
variable "ami_value" {
  description = "ami value"
}

variable "instance_type_value" {
  description = "instance type"
   default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.xlarge"
  }
}

module "ec2_instance_mod" {
    source = "./modules/ec2_instance_mod"
    ami_value = "ami-0522ab6e1ddcc7055"
    instance_type_value = lookup(instance_type_value, terraform.workspace, "stage")
}