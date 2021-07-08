data "aws_subnet_ids" "prod_subnet" {
 vpc_id = "${var.vpc_id}"

 filter {
    name   = "tag:Accesstype"
    values = ["${var.Accesstype}"]
 }
 filter {
    name   = "tag:Environment"
    values = ["${var.Environment}"]
  }
  filter {
    name   = "tag:Vertical"
    values = ["${var.Vertical}"]
  }
 }

 data "aws_subnet" "prod_subnets" {
  count = length(data.aws_subnet_ids.prod_subnet.ids)
  id = sort(data.aws_subnet_ids.prod_subnet.ids)[count.index]
}

####################
###############
data "aws_security_group" "eks_cluster_node_group" {
vpc_id      = "${var.vpc_id}"
filter {
    name   = "tag:Environment"
    values = ["${var.Environment}"]
  }
  filter {
    name   = "tag:Vertical"
    values = ["${var.Vertical}"]
  }
  filter {
    name   = "tag:Project"
    values = ["${var.cluster_node_subcomponent}"]
  }
}
##############
data "aws_security_group" "eks_cluster_shared" {
vpc_id      = "${var.vpc_id}"
filter {
    name   = "tag:Environment"
    values = ["${var.Environment}"]
  }
  filter {
    name   = "tag:Vertical"
    values = ["${var.Vertical}"]
  }
  filter {
    name   = "tag:Project"
    values = ["${var.shared_subcomponent}"]
  }
}
