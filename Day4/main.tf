resource "aws_instance" "tf_instance" {
  instance_type = "t2.micro"
  ami = "ami-0522ab6e1ddcc7055"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "tf-bucket-s3-229382"
}

resource "aws_dynamodb_table" "db_table_lock" {
  name = "terraform_lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}