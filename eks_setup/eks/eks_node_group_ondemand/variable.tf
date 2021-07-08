variable "aws_region" {
  default = "eu-central-1"
}

variable "aws_profile" {
  default = "dummy-patra"
}

variable "eks_cluster_name" {
  default = "patra-Prod-Ec1-Eks"
}

variable "vpc_id" {
  default = "vpc-04a19f9e30bd25c50"
}

variable "worker_launch_template_name" {
  default = "patraProdEks-nodegroup-ondemand"
}
variable "worker_disk_size" {
  default = 100
}

variable "worker_volume_type" {
  default = "gp2"
}

variable "aws_iam_node_profile" {
  default = "eks-prod-instance-role"
}

variable "eks_worker_ami" {
  default = "ami-0b848077cfb4c8b66"
}

variable "worker_node_instance_type" {
  default = "m5.xlarge"
}

variable "worker_ec2_ssh_key" {
  default = "patraK8sProd"
}


############## Autoscaling Variables #########################

variable "worker_auto_scaling_name" {
  default = "patraProdEks-nodegroup-ondemand"
}

variable "worker_desired_size" {
  default = 1
}

variable "worker_min_size" {
  default = 1
}

variable "worker_max_size" {
  default = 8
}

variable "worker_health_check_grace_period" {
  default = 300
}

variable "worker_health_check_type" {
  default = "EC2"
}


variable "Environment" {
  default = "prod"
}

variable "Accesstype" {
  default = "private"
}

variable "Vertical" {
  default = "patra"
}
variable "cluster_node_subcomponent" {
  default = "eks-workernode"
}

variable "shared_subcomponent" {
  default = "eks_clustershared"
}



variable "Project" {
  default = "patra-PROD"
}

variable "Owner" {
  default = "patra-EM"
}

variable "Purpose" {
  default = "patraekscluster"
}
