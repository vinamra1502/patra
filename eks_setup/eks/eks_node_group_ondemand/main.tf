provider "aws" {
    region = var.aws_region
    profile = var.aws_profile
}

#### User data for worker launch

locals {
  eks-node-private-userdata = <<USERDATA
IyEvYmluL2Jhc2gKc2V0IC1leApCNjRfQ0xVU1RFUl9DQT1MUzB0TFMxQ1JVZEpUaUJEUlZKVVNVWkpRMEZVUlMwdExTMHRDazFKU1VONVJFTkRRV0pEWjBGM1NVSkJaMGxDUVVSQlRrSm5hM0ZvYTJsSE9YY3dRa0ZSYzBaQlJFRldUVkpOZDBWUldVUldVVkZFUlhkd2NtUlhTbXdLWTIwMWJHUkhWbnBOUWpSWVJGUkpkMDFFYTNkT2FrRTBUWHBuTVU1V2IxaEVWRTEzVFVScmQwNUVRVFJOZW1jeFRsWnZkMFpVUlZSTlFrVkhRVEZWUlFwQmVFMUxZVE5XYVZwWVNuVmFXRkpzWTNwRFEwRlRTWGRFVVZsS1MyOWFTV2gyWTA1QlVVVkNRbEZCUkdkblJWQkJSRU5EUVZGdlEyZG5SVUpCVEdWYUNtOUZaVTlYT1doTmRsZFRXWE5vVmtaTWVXdGFUSEphYXpCcFZVRkZObU54U21abVJFUkJVazFhVmpaQmNuTjFVa1J6Y3l0V09UUTNXa0YzUlhsemIwNEtaRWxOYVZoUWVXVnRSMWhFZFhwRFlWSnhaVmxFYzNreVNYZE5NMkpKYzFaRmNtNUlUWFZhTDFKalZYSjFjblpwUjFGaWRtNVhUMXAwSzI5VlJtRkdid3BtVjB4UVNETjFUMWxDZGl0RU1WZFlNalJUYVRoT1VubExMMWRhYjBWVVZrSktkRXdyVmtWUmRUSnlNVEY1Y0cxUFVqUmtVVlpOWlU1WGVTdEJkMU15Q21oMmNYZHplR2QzV1dZeU1raG1NWEpOU0hKUWMyOU9WemwzVkRSVmJFVnVWR2xqTUVSdU1EazRWa1pzUTFwUlRrZEtUbEJJUW1WQ0sxQldjVGRQUVU4S01FVkdkelEzVWpZM1QzUnpOVWxLU1c4d1pHTnJNRzVZWm1oSlNtMU1lRTFsZUU5TlNXdFlVa2RsVUdOalZucFZWMUpyTTJ4YVlqVlNjV3d3V205aVZncHNSbEZxZVZOeU4zbEhUbm8yV25sYU5tdHpRMEYzUlVGQllVMXFUVU5GZDBSbldVUldVakJRUVZGSUwwSkJVVVJCWjB0clRVRTRSMEV4VldSRmQwVkNDaTkzVVVaTlFVMUNRV1k0ZDBSUldVcExiMXBKYUhaalRrRlJSVXhDVVVGRVoyZEZRa0ZETUUwd2ExVmlZMWt6UlRkMVFXeFZhVTEwUTJJeEt5OXFjVlFLU1ZaeVZEZ3piRVU0Wm5WWllVSlRRaTg1WTJoVUt6bENNalp2UlZkVVZ6ZHdOblpKTHpsalJGRjBSR3h0Wm5OUFQwSnpOM0pLWkhSaVYzbEJiMUZpVWdwMFFtRlJUMWRsU0hsQmJrVmFiM1JaVEdKT1YzQlVkRUpXYlZKbE5VNUpTbUpxT1hkQlNrWTJUQzlOTVZwTGVsTlNTamhUY21aWWNFTkRWVkV6Y1dsMkNsaDRVM2RWZEhkUkt6QlZkQzlyTjFWVk5GUnlWMUZCY20welpYVnJPRGeb3eb3e3jhdb3jhdb3hjdbjbu5hiuhvvvM1p0WWxCWFUzQlBhR0prY2tRNFQxRnpSamhsYUd4blFuQllZMGRSTW1ReFMzQlhhM2RYU3pGU1YzQnBXWGRCWVUxVk9FRjRZV1I0T0RFM1JuRnhkd3A0UXpsRk1rOVJWbEZZTTNSaU4wdG5kREZvZGs4NU5WbFdORFJpUzNWV2REQm5NVnBsWkdJNVlVaEdNV3RGTDJwSVdqRnJNbE5zWkV4SFNUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0KQVBJX1NFUlZFUl9VUkw9aHR0cHM6Ly8zRDI1Nzc0OUNBM0Y4NDYyNjUyRDEwMEFCNENDQTc1NC5ncjcuZXUtY2VudHJhbC0xLmVrcy5hbWF6b25hd3MuY29tCi9ldGMvZWtzL2Jvb3RzdHJhcC5zaCB0di1Qcm9kLUVjMS1Fa3MgLS1iNjQtY2x1c3Rlci1jYSAkQjY0X0NMVVNURVJfQ0EgLS1hcGlzZXJ2ZXItZW5kcG9pbnQgJEFQSV9TRVJWRVJfVVJMCg==
USERDATA
}

resource "aws_launch_template" "patra_eks_worker_node_ondemand_prod_lt" {
  name = var.worker_launch_template_name
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = var.worker_disk_size
      volume_type = var.worker_volume_type
      delete_on_termination = true
      encrypted = false
    }
  }

  iam_instance_profile {
    name = var.aws_iam_node_profile
  }
  image_id = var.eks_worker_ami
  instance_initiated_shutdown_behavior = "terminate"
  instance_type = var.worker_node_instance_type
  key_name = var.worker_ec2_ssh_key
  monitoring {
    enabled = true
  }
  network_interfaces {
    associate_public_ip_address = false
    security_groups = [data.aws_security_group.eks_cluster_node_group.id, data.aws_security_group.eks_cluster_shared.id]
    delete_on_termination = true
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "tv_eks_worker_node_ondemand_prod_lt"
    }
  }
  user_data = "${local.eks-node-private-userdata}"
  lifecycle {
    create_before_destroy = true
  }
}


############# Eks ondemand worker autoscaling group

resource "aws_autoscaling_group" "aws_autoscaling_group_node_ondemand" {
  name                      = var.worker_auto_scaling_name
  max_size                  = var.worker_max_size
  min_size                  = var.worker_min_size
  desired_capacity          = var.worker_desired_size
  health_check_grace_period = var.worker_health_check_grace_period
  health_check_type         = var.worker_health_check_type
  force_delete              = false

  launch_template {
    name = "${aws_launch_template.patra_eks_worker_node_ondemand_prod_lt.name}"
    version = "$Latest"
  }
  vpc_zone_identifier       = data.aws_subnet.prod_subnets.*.id
  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "Name"
    value               = "patraProdEks-nodegroup-ondemand"
    propagate_at_launch = true
  }
  tag {
    key                 = "kubernetes.io/cluster/${var.eks_cluster_name}"
    value               = "owned"
    propagate_at_launch = true
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/${var.eks_cluster_name}"
    value               = "owned"
    propagate_at_launch = true
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    value               = "true"
    propagate_at_launch = true
  }
  tag {
    key                 = "Environment"
    value               = var.Environment
    propagate_at_launch = true
  }
  tag {
    key                 = "Project"
    value               = var.Project
    propagate_at_launch = true
  }
  tag {
    key                 = "Owner"
    value               = var.Owner
    propagate_at_launch = true
  }
  tag {
    key                 = "Purpose"
    value               = var.Purpose
    propagate_at_launch = true
  }

}
