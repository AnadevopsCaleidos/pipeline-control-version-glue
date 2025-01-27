
module "notification-glue" {
  source                = "./module/notification-glue"
  name_notification_sns = var.name_notification_sns
  notification_email    = var.notification_email
  lambda_name     = var.lambda_name
  lambda_filename = var.lambda_filename
  event_rule_name  = var.event_rule_name
  glue_job_pattern = var.glue_job_pattern
}


# module "pipeline-update" {
#     source = "./module/codepipeline" 
#     name = var.name
#     artifact_bucket_name = var.artifact_bucket_name
#     RepositoryName = var.RepositoryName
#     BranchName = var.BranchName
#     github_token = var.github_token 
# }


module "alerts-ec2"{
    source = "./module/alerts"
    ec2_instance_id= var.ec2_instance_id
    sns_topic_arn = var.sns_topic_arn
    ec2_name = var.ec2_name
    cpu_comparison_operator = var.cpu_comparison_operator
    cpu_evaluation_periods = var.cpu_evaluation_periods
    cpu_metric_name = var.cpu_metric_name
    cpu_namespace = var.cpu_namespace
    cpu_period = var.cpu_period
    cpu_statistic = var.cpu_statistic
    cpu_threshold = var.cpu_threshold
    cpu_alarm_description = var.cpu_alarm_description
    disk_comparison_operator = var.disk_comparison_operator
    disk_evaluation_periods = var.disk_evaluation_periods
    disk_metric_name = var.disk_metric_name
    disk_namespace = var.disk_namespace
    disk_period = var.disk_period
    disk_statistic = var.disk_statistic
    disk_threshold = var.disk_threshold
    disk_alarm_description = var.disk_alarm_description
    memory_comparison_operator = var.memory_comparison_operator
    memory_evaluation_periods = var.memory_evaluation_periods
    memory_metric_name = var.memory_metric_name
    memory_namespace = var.memory_namespace
    memory_period = var.memory_period
    memory_statistic = var.memory_statistic
    memory_threshold = var.memory_threshold
    memory_alarm_description = var.memory_alarm_description
}

data "aws_caller_identity" "current" {}


