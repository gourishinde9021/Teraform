resource "aws_instance" "web" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}