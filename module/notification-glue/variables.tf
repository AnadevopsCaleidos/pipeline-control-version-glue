variable "lambda_name" {
  description = "Nombre de la función Lambda"
  type        = string
  default = ""
}


variable "lambda_filename" {
  description = "Path to the Lambda deployment package"
  type        = string
  default = ""
}
variable "additional_permissions" {
  description = "Permisos adicionales para la función Lambda (opcional)"
  type        = list(object({
    action   = string
    resource = string
  }))
  default = []
}
variable "notification_email" {
  description = "Email address to receive notifications"
  type        = string
  default = ""
}
variable "name_notification_sns" {
  description = ""
  type        = string
  default = ""
}
variable "event_rule_name" {
  description = "Nombre de la regla de EventBridge"
  type        = string
  default = ""
}

variable "glue_job_pattern" {
  description = "Patrón para capturar eventos de trabajos Glue"
  type        = string
  default = ""
}


