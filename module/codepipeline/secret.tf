data "aws_secretsmanager_secret_version" "github_token" {
  secret_id = "control-version/glue-jobs"  
}
output "github_token" {
  value     = data.aws_secretsmanager_secret_version.github_token.secret_string
  sensitive = true
}
