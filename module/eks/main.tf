resource "aws_eks_cluster" "patra_eks_cluster" {
  name                      = var.eks_cluster_name
  enabled_cluster_log_types = var.cluster_enabled_cluster_log_types
  version                   = var.cluster_version
  role_arn                  = var.eksDevRoleArn

  vpc_config {
    subnet_ids              = var.eks_subnet_ids
    security_group_ids      = var.eks_additional_security_group
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access  = var.cluster_endpoint_public_access
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
  }
  # We explicitly prevent destruction using terraform. Remove this only if you really know what you're doing.
  lifecycle {
    prevent_destroy = true
  }
  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  tags = {
     Name       = var.eks_cluster_name
     Environment = var.Environment
     Project    = var.Project
     Owner      = var.Owner
     Purpose    = var.Purpose
  }
}
