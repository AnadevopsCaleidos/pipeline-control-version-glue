variable "name" {
  description = "Name for CodeBuild build project"
  type        = string
  default = ""
}
variable "artifact_bucket_name" {
  description = "Nombre del bucket S3 para artefactos del pipeline"
  type        = string
  default = ""
}

variable "RepositoryName" {
  description = "Nombre del repositorio GitHub"
  type        = string
  default = ""
}

variable "BranchName" {
  description = "Rama del repositorio GitHub"
  type        = string
  default = ""
}
variable "github_token" {
  description = "OAuth token for GitHub access"
  type        = string
  sensitive   = true
  default = ""
}

### ec2 alerts ###

variable "ec2_instance_id" {
  description = "ID de la instancia EC2 a monitorear"
  type        = string
}
variable "sns_topic_arn" {
  description = "ARN del SNS Topic existente para notificaciones"
  type        = string
}