provider "aws" {
region = var.main_region
}
variable "github_token"{
type=string
description="Enter github token"
}



module "pipeline" {
source = "./modules/terrapipeline"
github_token=var.github_token
}
