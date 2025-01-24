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

}
data "aws_caller_identity" "current" {}


