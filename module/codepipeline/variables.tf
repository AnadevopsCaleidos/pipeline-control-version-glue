variable "name" {
  description = "Name for CodeBuild build project"
  type        = string
}
variable "artifact_bucket_name" {
  description = "Nombre del bucket S3 para artefactos del pipeline"
  type        = string
}

variable "RepositoryName" {
  description = "Nombre del repositorio GitHub"
  type        = string
}

variable "BranchName" {
  description = "Rama del repositorio GitHub"
  type        = string
}
variable "github_token" {
  description = "OAuth token for GitHub access"
  type        = string
  sensitive   = true
}
variable "name_iam_codebuild"{
  description = "OAuth token for GitHub access"
  type        = string
  sensitive   = true
}
variable "name_iam_policy_codebuild"{
  description = "OAuth token for GitHub access"
  type        = string
  sensitive   = true
}
variable "name_iam_codepipeline"{
  description = "OAuth token for GitHub access"
  type        = string
  sensitive   = true
}
variable "name_iam_policy_codepipeline"{
  description = "OAuth token for GitHub access"
  type        = string
  sensitive   = true
}


