resource "aws_cloudwatch_event_rule" "event_rule" {
  name        = var.event_rule_name
  description = "Rule to catch Glue job failures"
  event_pattern = var.glue_job_pattern
}

resource "aws_cloudwatch_event_target" "event_target" {
  rule = aws_cloudwatch_event_rule.event_rule.name
  arn  = aws_lambda_function.glue_failure_notification.arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.glue_failure_notification.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.event_rule.arn
}
