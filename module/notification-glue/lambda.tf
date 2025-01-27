resource "aws_lambda_function" "glue_failure_notification" {
  function_name = "glue-failure-notification-lambda"
  runtime       = "python3.9"
  handler       = "python.lambda_handler"
  role          = aws_iam_role.lambda_role.arn
  filename      = var.lambda_filename
  timeout       = 60

#   vpc_config {
#     subnet_ids         = var.lambda_subnet_ids
#     security_group_ids = [aws_security_group.lambda_security_group.id]
#   }

  environment {
    variables = {
      SNS_TOPIC_ARN = aws_sns_topic.notification.arn
    }
  }

 
}

# CloudWatch Alarm para detectar errores
resource "aws_cloudwatch_metric_alarm" "lambda_error_alarm" {
  alarm_name          = "lambda-error-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = 1
  period              = 60
  namespace           = "AWS/Lambda"
  metric_name         = "Errors" 
  statistic           = "Sum"

  dimensions = {
    FunctionName = aws_lambda_function.glue_failure_notification.function_name
  }

  alarm_description  = "Alarma de errores para Lambda ${aws_lambda_function.glue_failure_notification.function_name}"
  alarm_actions      = [aws_sns_topic.notification.arn]
  ok_actions         = [aws_sns_topic.notification.arn]
  treat_missing_data = "notBreaching"
}
