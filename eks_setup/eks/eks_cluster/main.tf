provider "aws" {
    region = var.aws_region
    profile = var.aws_profile
}

module "eks" {
 source = "../../../modules/eks/"
 eks_cluster_name = "patra-Prod-Ec1-Eks"
 cluster_enabled_cluster_log_types = ["api","audit","controllerManager","scheduler"]
 cluster_version = "1.17"
 eksDevRoleArn = "arn:aws:iam::7922756789543:role/aws_eks_prod_cluster_role"
 eks_subnet_ids = data.aws_subnet_ids.subnet_ids.ids
 eks_additional_security_group = [data.aws_security_group.eks_prod_sg.id]
 cluster_endpoint_private_access = false
 cluster_endpoint_public_access  = true
 cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
 Environment = "prod"
 Project = "eks"
 Vertical = "patra"
 Owner   = "patra-EM"
 Purpose = "EKS Cluster"
}
