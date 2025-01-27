### ec2 alerts ###

variable "ec2_instance_id" {
  description = "ID de la instancia EC2 a monitorear"
  type        = string
}
variable "sns_topic_arn" {
  description = "ARN del SNS Topic existente para notificaciones"
  type        = string
}
# Variables generales

variable "ec2_name" {
  description = "Nombre de la instancia EC2 para identificar las alarmas"
  type        = string
}

# CPU Alarm Variables
variable "cpu_comparison_operator" {
  description = "Operador de comparación para la alarma de CPU"
  type        = string
}

variable "cpu_evaluation_periods" {
  description = "Cantidad de periodos para evaluar la alarma de CPU"
  type        = number
}

variable "cpu_metric_name" {
  description = "Nombre de la métrica de CPU"
  type        = string
}

variable "cpu_namespace" {
  description = "Namespace de la métrica de CPU"
  type        = string
}

variable "cpu_period" {
  description = "Periodo en segundos para la alarma de CPU"
  type        = number
}

variable "cpu_statistic" {
  description = "Estadística usada en la métrica de CPU"
  type        = string
}

variable "cpu_threshold" {
  description = "Umbral de la métrica de CPU"
  type        = number
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
}

variable "disk_evaluation_periods" {
  description = "Cantidad de periodos para evaluar la alarma de disco"
  type        = number
}

variable "disk_metric_name" {
  description = "Nombre de la métrica de disco"
  type        = string
}

variable "disk_namespace" {
  description = "Namespace de la métrica de disco"
  type        = string
}

variable "disk_period" {
  description = "Periodo en segundos para la alarma de disco"
  type        = number
}

variable "disk_statistic" {
  description = "Estadística usada en la métrica de disco"
  type        = string
}

variable "disk_threshold" {
  description = "Umbral de la métrica de disco"
  type        = number
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
}

variable "memory_evaluation_periods" {
  description = "Cantidad de periodos para evaluar la alarma de memoria"
  type        = number
}

variable "memory_metric_name" {
  description = "Nombre de la métrica de memoria"
  type        = string
}

variable "memory_namespace" {
  description = "Namespace de la métrica de memoria"
  type        = string
}

variable "memory_period" {
  description = "Periodo en segundos para la alarma de memoria"
  type        = number
}

variable "memory_statistic" {
  description = "Estadística usada en la métrica de memoria"
  type        = string
}

variable "memory_threshold" {
  description = "Umbral de la métrica de memoria"
  type        = number
}

variable "memory_alarm_description" {
  description = "Descripción de la alarma de memoria"
  type        = string
  default     = "Alarma cuando el uso de la memoria excede."
}
