resource "aws_iam_role" "codebuild_role" {
  name               = "CodeBuildServiceRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })
}

resource "aws_iam_role_policy" "codebuild_policy" {
  name   = "CodeBuildPolicy"
  role   = aws_iam_role.codebuild_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:*",
          "logs:*",
          "cloudwatch:*"
        ]
        Resource = "*"
      },
    ]
  })
}

# IAM Role para CodePipeline
resource "aws_iam_role" "codepipeline_role" {
  name = "CodePipelineServiceRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = { Service = "codepipeline.amazonaws.com" }
      },
    ]
  })
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "CodePipelineS3AccessPolicy"
  role = aws_iam_role.codepipeline_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::glue-job-sync-artifacts",
          "arn:aws:s3:::glue-job-sync-artifacts/*"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "codebuild:StartBuild",
          "codebuild:BatchGetBuilds",
          "codebuild:BatchGetProjects",
          "codebuild:BatchGetBuildBatches",
          "codebuild:BatchGetBuilds"
        ]
        Resource = [
          "arn:aws:codebuild:us-east-1:*:project/*"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "cloudwatch:*",
          "logs:*"
        ]
        Resource = "*"
      }
    ]
  })
}
