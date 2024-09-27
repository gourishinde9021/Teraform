resource "aws_instance" "myfirsttfinstance" {
  ami           = var.ami_value
  instance_type = var.instance_type_value
}
