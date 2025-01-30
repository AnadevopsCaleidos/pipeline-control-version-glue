variable "name" {
  description = "Name for CodeBuild build project"
  type        = string
}
variable "artifact_bucket_name" {
  description = "Nombre for artifact bucket"
  type        = string
}

variable "Owner" {
  description = "Name for repository owner"
  type        = string
}

variable "RepositoryName" {
  description = "Name for GitHub repository"
  type        = string
}

variable "BranchName" {
  description = "Name for GitHub repository Branch"
  type        = string
}
variable "github_token" {
  description = "OAuth token for GitHub access"
  type        = string
  sensitive   = true
}
variable "name_iam_codebuild"{
  description = "Name for iam codebuild"
  type        = string
  sensitive   = true
}
variable "name_iam_policy_codebuild"{
  description = "Name for iam policy codebuild"
  type        = string
  sensitive   = true
}
variable "name_iam_codepipeline"{
  description = "Name for iam codepipeline"
  type        = string
  sensitive   = true
}
variable "name_iam_policy_codepipeline"{
  description = "Name for iam policy codepipeline"
  type        = string
  sensitive   = true
}


