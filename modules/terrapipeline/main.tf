terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }

    random = {
      source = "hashicorp/random"
    }

  }
}

provider "aws" {
  region = var.region
}

provider "github" {
  token = var.github_token
  owner = var.repository_owner
}
