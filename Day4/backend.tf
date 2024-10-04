terraform {
  backend "s3" {
    bucket = "tf-bucket-s3-229382"
    region = "ap-south-1"
    key = "gouri/terraform.tfstate"
    dynamodb_table = "terraform_lock"
  }
}
