terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  token = var.token
}

resource "github_repository" "example" {
  name = "myterraformrepo18sept"
  description = "My awesome codebase"
  visibility = "private"
}
