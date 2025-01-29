variable "notification_email" {
  description = "Email address to receive notifications"
  type        = string
  default     = ""
}
variable "name_notification_sns" {
  description = ""
  type        = string
  default     = ""
}
variable "lambda_name" {
  description = "Nombre de la función Lambda"
  type        = string
  default     = ""
}


variable "lambda_filename" {
  description = "Path to the Lambda deployment package"
  type        = string
  default     = ""
}
variable "additional_permissions" {
  description = "Permisos adicionales para la función Lambda (opcional)"
  type = list(object({
    action   = string
    resource = string
  }))
  default = []
}


variable "event_rule_name" {
  description = "Nombre de la regla de EventBridge"
  type        = string
  default     = ""
}

variable "glue_job_pattern" {
  description = "Patrón de evento para detectar fallos en trabajos de AWS Glue"
  type        = string
  default     = ""
}

variable "name" {
  description = "Name for CodeBuild build project"
  type        = string
  default     = ""
}
variable "artifact_bucket_name" {
  description = "Nombre del bucket S3 para artefactos del pipeline"
  type        = string
  default     = ""
}

variable "RepositoryName" {
  description = "Nombre del repositorio GitHub"
  type        = string
  default     = ""
}

variable "BranchName" {
  description = "Rama del repositorio GitHub"
  type        = string
  default     = ""
}
variable "github_token" {
  description = "OAuth token for GitHub access"
  type        = string
  sensitive   = true
  default     = ""
}

### ec2 alerts ###

variable "ec2_instance_id" {
  description = "ID de la instancia EC2 a monitorear"
  type        = string
  default     = ""
}
variable "sns_topic_arn" {
  description = "ARN del SNS Topic existente para notificaciones"
  type        = string
  default     = ""
}
# Variables generales

variable "ec2_name" {
  description = "Nombre de la instancia EC2 para identificar las alarmas"
  type        = string
  default     = ""
}

# CPU Alarm Variables
variable "cpu_comparison_operator" {
  description = "Operador de comparación para la alarma de CPU"
  type        = string
  default     = ""
}

variable "cpu_evaluation_periods" {
  description = "Cantidad de periodos para evaluar la alarma de CPU"
  type        = number
  default     = 0
}

variable "cpu_metric_name" {
  description = "Nombre de la métrica de CPU"
  type        = string
  default     = ""
}

variable "cpu_namespace" {
  description = "Namespace de la métrica de CPU"
  type        = string
  default     = ""
}

variable "cpu_period" {
  description = "Periodo en segundos para la alarma de CPU"
  type        = number
  default     = 0
}

variable "cpu_statistic" {
  description = "Estadística usada en la métrica de CPU"
  type        = string
  default     = ""
}

variable "cpu_threshold" {
  description = "Umbral de la métrica de CPU"
  type        = number
  default     = 0
}

variable "cpu_alarm_description" {
  description = "Descripción de la alarma de CPU"
  type        = string
  default     = "Alarma cuando el uso de CPU excede."
}

# Disk Alarm Variables
variable "disk_comparison_operator" {
  description = "Operador de comparación para la alarma de disco"
  type        = string
  default     = ""
}

variable "disk_evaluation_periods" {
  description = "Cantidad de periodos para evaluar la alarma de disco"
  type        = number
  default     = 0
}

variable "disk_metric_name" {
  description = "Nombre de la métrica de disco"
  type        = string
  default     = ""
}

variable "disk_namespace" {
  description = "Namespace de la métrica de disco"
  type        = string
  default     = ""
}

variable "disk_period" {
  description = "Periodo en segundos para la alarma de disco"
  type        = number
  default     = 0
}

variable "disk_statistic" {
  description = "Estadística usada en la métrica de disco"
  type        = string
  default     = ""
}

variable "disk_threshold" {
  description = "Umbral de la métrica de disco"
  type        = number
  default     = 0
}

variable "disk_alarm_description" {
  description = "Descripción de la alarma de disco"
  type        = string
  default     = "Alarma cuando el uso del disco excede."
}

# Memory Alarm Variables
variable "memory_comparison_operator" {
  description = "Operador de comparación para la alarma de memoria"
  type        = string
  default     = ""
}

variable "memory_evaluation_periods" {
  description = "Cantidad de periodos para evaluar la alarma de memoria"
  type        = number
  default     = 0
}

variable "memory_metric_name" {
  description = "Nombre de la métrica de memoria"
  type        = string
  default     = ""
}

variable "memory_namespace" {
  description = "Namespace de la métrica de memoria"
  type        = string
  default     = ""
}

variable "memory_period" {
  description = "Periodo en segundos para la alarma de memoria"
  type        = number
  default     = 0
}

variable "memory_statistic" {
  description = "Estadística usada en la métrica de memoria"
  type        = string
  default     = ""
}

variable "memory_threshold" {
  description = "Umbral de la métrica de memoria"
  type        = number
  default     = 0
}

variable "memory_alarm_description" {
  description = "Descripción de la alarma de memoria"
  type        = string
  default     = "Alarma cuando el uso de la memoria excede."
}
## iam 
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

