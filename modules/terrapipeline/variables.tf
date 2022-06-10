variable "env" {
  description = "Depolyment environment"
  default     = "dev"
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "repository_branch" {
  description = "Repository branch to connect to"
  default     = "main"
}

variable "repository_owner" {
  description = "GitHub repository owner"
  default     = "sumedh004"
}

variable "repository_name" {
  description = "GitHub repository name"
  default     = "pipeline"
}


variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "sumedh01"
}

variable "github_token" {
}

variable "endpoint_email" {
  description = "Email for receiving sns notifs"
}

