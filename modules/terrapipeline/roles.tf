resource "aws_iam_role" "pipeline_role" {

  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "codepipeline.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )

  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "pipeline-role-${var.env}"
  path                  = "/service-role/"
  tags                  = {}
}

resource "aws_iam_policy" "web_pipeline_policy" {
  description = "Policy used in trust relationship with CodePipeline"
  name        = "web-pipeline-policy-${var.env}"
  path        = "/service-role/"
  policy = jsonencode(
    {
      Statement : [
        {
          Action : [
            "iam:PassRole"
          ],
          Resource : "*",
          Effect : "Allow"
        },
        {
          Action = [
            "s3:*",
            "sns:*",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
        {
          Action : [
            "codepipeline:*",
            "iam:ListRoles",
            "codebuild:BatchGetBuilds",
            "codebuild:StartBuild",
            "codestar-connections:*",
            "iam:PassRole",
          ],
          Resource : "*",
          Effect : "Allow"
        },
      ],
      "Version" : "2012-10-17"
    }
  )
}

resource "aws_iam_role_policy_attachment" "pipeline_policy_attachment" {
  role       = aws_iam_role.pipeline_role.name
  policy_arn = aws_iam_policy.web_pipeline_policy.arn
}

resource "aws_iam_role" "static_build_role" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "codebuild.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "build-role-${var.env}"
  path                  = "/service-role/"
  tags                  = {}
}

resource "aws_iam_policy" "build_policy" {
  description = "Policy used in trust relationship with CodeBuild (${var.env})"
  name        = "build-policy-${var.env}"
  path        = "/service-role/"
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "VisualEditor0",
          "Effect" : "Allow",
          "Action" : [
            "route53:*",
            "ec2:*"
          ],
          "Resource" : "*"
        },
        {
          "Sid" : "VisualEditor1",
          "Effect" : "Allow",
          "Action" : [
            "logs:CreateLogStream",
            "logs:CreateLogGroup",
            "logs:PutLogEvents"
          ],
          "Resource" : "arn:aws:logs:*"
        },
        {
          "Sid" : "VisualEditor2",
          "Effect" : "Allow",
          "Action" : "s3:*",
          "Resource" : "arn:aws:s3:::*"
        }
      ]
    }
  )
}


resource "aws_iam_role_policy_attachment" "build_policy_attachment" {
  role       = aws_iam_role.static_build_role.name
  policy_arn = aws_iam_policy.build_policy.arn
}

