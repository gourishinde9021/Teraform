resource "aws_instance" "tf_instance" {
  instance_type = "t2.micro"
  ami = "ami-0522ab6e1ddcc7055"
}

resource "aws_s3_bucket" "tf_s3_bucket" {
  bucket = "tf-bucket-s3-229489382"
}