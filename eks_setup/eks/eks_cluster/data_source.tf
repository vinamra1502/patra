data "aws_subnet_ids" "subnet_ids" {
 vpc_id = "${var.vpc_id}"

 filter {
   name   = "tag:Vertical"
   values = ["${var.Vertical}"]
 }
 filter {
   name   = "tag:Environment"
   values = ["${var.Environment}"]
 }
}

###############
data "aws_security_group" "eks_prod_sg" {
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
    values = ["${var.Project}"]
  }

}
