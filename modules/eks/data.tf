data "aws_subnet" "app_1" {
  filter {
    name   = "tag:Name"
    values = ["${var.project}-${var.env}-app-subnet-0"]
  }
}
data "aws_subnet" "app_2" {
  filter {
    name   = "tag:Name"
    values = ["${var.project}-${var.env}-app-subnet-1"]
  }
}
