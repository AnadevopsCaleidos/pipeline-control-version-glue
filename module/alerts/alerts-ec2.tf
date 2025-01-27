# CloudWatch Alarm para CPU Utilization
resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm" {
  alarm_name          = "${var.ec2_name}-CPU Utilization"
  comparison_operator = var.cpu_comparison_operator
  evaluation_periods  = var.cpu_evaluation_periods
  metric_name         = var.cpu_metric_name
  namespace           = var.cpu_namespace
  period              = var.cpu_period # 300 5 minutos
  statistic           = var.cpu_statistic
  threshold           = var.cpu_threshold # Umbral 80 (80%)
  alarm_description   = var.cpu_alarm_description 
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
  alarm_name          = "${var.ec2_name}-Disk Usage"
  comparison_operator = var.disk_comparison_operator
  evaluation_periods  = var.disk_evaluation_periods
  metric_name         = var.disk_metric_name
  namespace           = var.disk_namespace  # Nombre del namespace del CloudWatch Agent "CWAgent"
  period              = var.disk_period # 300 5 minutos
  statistic           = var.disk_statistic # "Average"
  threshold           = var.disk_threshold  # 80 Umbral (80%)
  alarm_description   = var.disk_alarm_description 
  dimensions = {
    InstanceId = var.ec2_instance_id
  }
  alarm_actions = [var.sns_topic_arn]
  ok_actions    = [var.sns_topic_arn]
}
# Alarma para uso de Memoria
resource "aws_cloudwatch_metric_alarm" "memory_usage_alarm" {
  alarm_name          = "${var.ec2_name}-Memory Usage" # "High-Memory-Usage"
  comparison_operator = var.memory_comparison_operator # "GreaterThanThreshold"
  evaluation_periods  = var.memory_evaluation_periods # 1
  metric_name         = var.memory_metric_name # "mem_used_percent"
  namespace           = var.memory_namespace  # Nombre del namespace del CloudWatch Agent "CWAgent"
  period              = var.memory_period  # 300 5 minutos
  statistic           = var.memory_statistic # "Average"
  threshold           = var.memory_threshold  # 80 Umbral (80%)
  alarm_description   = var.memory_alarm_description 
  dimensions = {
    InstanceId = var.ec2_instance_id
  }

  alarm_actions = [var.sns_topic_arn]
  ok_actions    = [var.sns_topic_arn]
}
