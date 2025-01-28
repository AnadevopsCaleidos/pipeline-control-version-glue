resource "aws_iam_role" "codebuild_role" {
  name               = var.name_iam_codebuild
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
      Effect = "Allow"
      Principal = { Service = "codebuild.amazonaws.com" }
      Action = "sts:AssumeRole"
    }
    ]
  })
}

resource "aws_iam_policy" "codebuild_policy" {
  name   = var.name_iam_policy_codebuild
  
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
      {
        Effect   = "Allow"
        Action   = [
          "glue:ListJobs",
          "glue:GetJob",
          "glue:UpdateJob",
          "glue:StartJobRun"
        ]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      }
    ]
  })
}

# IAM Role para CodePipeline
resource "aws_iam_role" "codepipeline_role" {
  name = var.name_iam_codepipeline

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

resource "aws_iam_policy" "codepipeline_policy" {
  name = var.name_iam_policy_codepipeline
  

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

resource "aws_iam_role_policy_attachment" "codebuild_policy_attachment" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = aws_iam_policy.codebuild_policy.arn
}
resource "aws_iam_role_policy_attachment" "codepipeline_policy_attachmen_3" {
  role       = aws_iam_role.codepipeline_role.name
  policy_arn = aws_iam_policy.codepipeline_policy.arn
}

