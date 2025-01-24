### ec2 alerts ###

variable "ec2_instance_id" {
  description = "ID de la instancia EC2 a monitorear"
  type        = string
}
variable "sns_topic_arn" {
  description = "ARN del SNS Topic existente para notificaciones"
  type        = string
}