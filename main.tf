module "notification-glue" {
  source                = "./module/notification-glue"
  name_notification_sns = var.name_notification_sns
  notification_email    = var.notification_email
  lambda_name     = var.lambda_name
  lambda_filename = var.lambda_filename
  event_rule_name  = var.event_rule_name
  glue_job_pattern = var.glue_job_pattern
}


