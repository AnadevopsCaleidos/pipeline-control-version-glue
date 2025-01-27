resource "aws_codebuild_project" "glue_update" {
  name          = var.name
  service_role  = aws_iam_role.codebuild_role.arn
  source {
    type            = "CODEPIPELINE"
    buildspec       = file("${path.module}/buildspec.yml")
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"

  }

  artifacts {
    type = "CODEPIPELINE"
  }

}