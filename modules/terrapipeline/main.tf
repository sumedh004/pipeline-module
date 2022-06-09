provider "aws" {
  region = var.region
}

provider "github" {
  token = var.github_token
  owner = var.repository_owner
}

provider "random" {

}
