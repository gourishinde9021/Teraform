provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance_mod" {
    source = "./modules/aws_instance"
    ami_value = "ami-0522ab6e1ddcc7055"
    instance_type_value = "t2.micro"
}