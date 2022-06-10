variable "main_region" {
  type    = string
  default = "us-east-1"
}

variable "github_token" {
  type        = string
  sensitive   = true
  description = "Enter github token"
}
