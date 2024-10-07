provider "aws" {
  region = "ap-south-1"
}

provider "vault" {
  address = "http://13.201.33.37:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "9e084642-076c-bfa4-68d8-4799f2e18fcd"
      secret_id = "fba9a809-e248-06f8-5693-265e1046e21a"
    }
  }
}
