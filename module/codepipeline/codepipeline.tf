resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "glue-job-sync-artifacts"
}

resource "aws_codepipeline" "glue_pipeline" {
  name     = var.name
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    type     = "S3"
    location = aws_s3_bucket.codepipeline_bucket.bucket
  }

  stage {
    name = "Source"

    action {
      name = "GitHub_Source"
      category = "Source"
      owner    = "ThirdParty"
      provider = "GitHub"
      version  = "1"
      
      configuration = {
        Owner  = "AnadevopsCaleidos"
        Repo   = var.RepositoryName
        Branch = var.BranchName
        OAuthToken           = var.github_token
        PollForSourceChanges = "true"
      }
      output_artifacts = ["source_output"]
    }
  }

  stage {
    name = "Build"

    action {
      name             = "CodeBuild"
      category = "Build"
      owner    = "AWS"
      provider = "CodeBuild"
      version  = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      configuration = {
        ProjectName = aws_codebuild_project.glue_update.arn
      }
    }
  }
}


