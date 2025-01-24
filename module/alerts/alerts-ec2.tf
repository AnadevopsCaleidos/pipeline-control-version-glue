# CloudWatch Alarm para CPU Utilization
resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm" {
  alarm_name          = "High-CPU-Usage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300 # 5 minutos
  statistic           = "Average"
  threshold           = 80 # Umbral (80%)
  alarm_description   = "Alarma cuando el uso de CPU excede el 80% durante 5 minutos."
  dimensions = {
    InstanceId = var.ec2_instance_id
  }

  # Acción de la alarma: enviar notificación al SNS existente
  alarm_actions = [var.sns_topic_arn]

  # Acción opcional para resolver alarma (puedes omitir si no necesitas notificaciones de resolución)
  ok_actions = [var.sns_topic_arn]
}
# Alarma para uso de Disco
resource "aws_cloudwatch_metric_alarm" "disk_usage_alarm" {
  alarm_name          = "High-Disk-Usage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "DiskSpaceUtilization"
  namespace           = "CWAgent" # Nombre del namespace del CloudWatch Agent
  period              = 300 # 5 minutos
  statistic           = "Average"
  threshold           = 80 # Umbral (80%)
  alarm_description   = "Alarma cuando el uso del disco excede el 80% durante 5 minutos."
  dimensions = {
    InstanceId = var.ec2_instance_id
  }
  alarm_actions = [var.sns_topic_arn]
  ok_actions    = [var.sns_topic_arn]
}
# Alarma para uso de Memoria
resource "aws_cloudwatch_metric_alarm" "memory_usage_alarm" {
  alarm_name          = "High-Memory-Usage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "mem_used_percent"
  namespace           = "CWAgent" # Nombre del namespace del CloudWatch Agent
  period              = 300 # 5 minutos
  statistic           = "Average"
  threshold           = 80 # Umbral (80%)
  alarm_description   = "Alarma cuando el uso de la memoria excede el 80% durante 5 minutos."
  dimensions = {
    InstanceId = var.ec2_instance_id
  }

  alarm_actions = [var.sns_topic_arn]
  ok_actions    = [var.sns_topic_arn]
}
