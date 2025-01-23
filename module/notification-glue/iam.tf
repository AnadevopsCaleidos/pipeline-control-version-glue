# Crear el rol para la Lambda
resource "aws_iam_role" "lambda_role" {
  name               = "${var.lambda_name}_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = { Service = "lambda.amazonaws.com" }
      }
    ]
  })
}

# Política para Logs y SNS (combinada en una sola)
resource "aws_iam_policy" "lambda_policy" {
  name        = "${var.lambda_name}_policy"
  description = "Allow Lambda to write to CloudWatch Logs and publish to SNS"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:*:*:*"
      },
      {
        Effect   = "Allow",
        Action   = "sns:Publish",
        Resource = aws_sns_topic.notification.arn
      }
    ]
  })
}

# Adjuntar la política personalizada al rol
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

# Adjuntar la política administrada de Amazon SNS Full Access
resource "aws_iam_role_policy_attachment" "sns_full_access" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
}
