data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}

resource "aws_instance" "example_vault" {
  ami = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"

  tags = {
    Name = "Vault_instance"
    secret = data.vault_kv_secret_v2.example.data["user"]
  }
}

resource "aws_s3_bucket" "vault_s3_bucket" {
  bucket = var.s3_random
}