data "aws_subnet" "data" {
  vpc_id = data.aws_vpc.selected.id

  filter {
    name   = "tag:Name"
    values = ["${var.project}-${var.env}-data-subnet"]
  }
}
