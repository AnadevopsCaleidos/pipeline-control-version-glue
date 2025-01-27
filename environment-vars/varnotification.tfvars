name_notification_sns = "Glue_Job_Failure_Notification_2"
notification_email  = "agonzalez@caleidos.pe"
lambda_name         = "glue-failure-notification-lambda-test"
lambda_filename     = "./code/python.zip"
event_rule_name     = "glue-failure-rule"
glue_job_pattern = <<EOT
{
  "source": ["aws.glue"],
  "detail-type": ["Glue Job State Change"],
  "detail": {
    "state": ["FAILED", "ERROR", "STOPPED"]
  }
}
EOT


