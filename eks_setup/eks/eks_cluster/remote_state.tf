terraform {
  backend "s3" {
    encrypt = true
    bucket = "patra-devops-ec1-terraform"
    dynamodb_table = "patra-terraform-state-lock-dynamo"
    key    = "terraform/prod/eks_cluster.tfstate"
    region = "eu-central-1"
    profile = "dummy-patra"
  }
}
