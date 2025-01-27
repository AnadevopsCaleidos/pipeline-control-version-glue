module "pipeline-update" {
    source = "./module/codepipeline" 
    name = var.name
    artifact_bucket_name = var.artifact_bucket_name
    RepositoryName = var.RepositoryName
    BranchName = var.BranchName
    github_token = var.github_token
}


