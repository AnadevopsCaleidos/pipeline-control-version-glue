
resource "aws_sns_topic" "notification" {
  name = var.name_notification_sns
  
}

resource "aws_sns_topic_subscription" "email_subscription" { 
  topic_arn = aws_sns_topic.notification.arn
  protocol  = "email"
  endpoint  = var.notification_email
}

 