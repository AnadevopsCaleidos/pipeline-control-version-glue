variable "notification_email" {
  description = "Email address to receive notifications"
  type        = string
}
variable "name_notification_sns" {
  description = ""
  type        = string
}
variable "lambda_name" {
  description = "Nombre de la función Lambda"
  type        = string
}


variable "lambda_filename" {
  description = "Path to the Lambda deployment package"
  type        = string
}
variable "additional_permissions" {
  description = "Permisos adicionales para la función Lambda (opcional)"
  type        = list(object({
    action   = string
    resource = string
  }))
  default = []
}


variable "event_rule_name" {
  description = "Nombre de la regla de EventBridge"
  type        = string
}

variable "glue_job_pattern" {
  description = "Patrón de evento para detectar fallos en trabajos de AWS Glue"
  type        = string
}

