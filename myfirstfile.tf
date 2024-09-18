provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIAXVTO4X6AP2EYXQN3"
  secret_key = var.accesstoken
}

resource "aws_instance" "web" {
  ami           = "ami-05c880175794030cd"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
