variable "eks_cluster_name" {
 default = ""
}

variable "cluster_enabled_cluster_log_types" {
  description = "List of log types to be enabled, availabe log types are - api, audit, authenticator, controllerManager, scheduler"
  type        = list(string)
  default     = [""]
}

variable "cluster_version" {
  default = ""
}

variable "eksDevRoleArn" {
  default = ""
}

variable "eks_subnet_ids" {
  default = ""
}

variable "eks_additional_security_group" {
  default = ""
}


variable "cluster_endpoint_private_access" {
  default = false
}

variable "cluster_endpoint_public_access" {
  default = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "Environment" {
  default = ""
}

variable "Vertical" {
  default = ""
}

variable "Project" {
  default = ""
}

variable "Owner" {
  default = ""
}

variable "Purpose" {
  default = ""
}

