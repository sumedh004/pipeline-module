resource "aws_codebuild_project" "static_web_build1" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "static-web-build1"
  queued_timeout = 480
  service_role   = aws_iam_role.static_build_role.arn
  tags = {
    Environment = var.env
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = false
    type                        = "LINUX_CONTAINER"
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      encryption_disabled = false
      status              = "DISABLED"
    }
  }

  source {
    location  = "https://github.com/sumedh004/pipeline"
    buildspec = "buildspec_build.yml"
    type      = "GITHUB"
  }
}


resource "aws_codebuild_project" "static_web_build2" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "static-web-build2"
  queued_timeout = 480
  service_role   = aws_iam_role.static_build_role.arn
  tags = {
    Environment = var.env
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = false
    type                        = "LINUX_CONTAINER"
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      encryption_disabled = false
      status              = "DISABLED"
    }
  }

  source {
    location  = "https://github.com/sumedh004/pipeline"
    buildspec = "buildspec_plan.yml"
    type      = "GITHUB"
  }
}
resource "aws_codebuild_project" "static_web_build3" {
  badge_enabled  = false
  build_timeout  = 60
  name           = "static-web-build3"
  queued_timeout = 480
  service_role   = aws_iam_role.static_build_role.arn
  tags = {
    Environment = var.env
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = false
    type                        = "LINUX_CONTAINER"
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      encryption_disabled = false
      status              = "DISABLED"
    }
  }

  source {
    location  = "https://github.com/sumedh004/pipeline"
    buildspec = "buildspec_apply.yml"
    type      = "GITHUB"
  }
}


