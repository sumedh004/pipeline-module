provider "aws" {
  region = var.main_region
}



module "pipeline" {
  source                = "./modules/terrapipeline"
  github_token          = var.github_token
  repository_owner      = ""
  repository_name       = ""
  repository_branch     = ""
  artifacts_bucket_name = ""
  endpoint_email        = ""


}
