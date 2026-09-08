data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["${var.project}-${var.env}-vpc"]
  }
}


data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_subnet" "app" {
  vpc_id = data.aws_vpc.selected.id

  filter {
    name   = "tag:Name"
    values = ["${var.project}-${var.env}-app-subnet-0"]
  }
}

data "aws_subnet" "app1" {
  vpc_id = data.aws_vpc.selected.id

  filter {
    name   = "tag:Name"
    values = ["${var.project}-${var.env}-app-subnet-1"]
  }
}

data "aws_subnet" "data" {
  vpc_id = data.aws_vpc.selected.id

  filter {
    name   = "tag:Name"
    values = ["${var.project}-${var.env}-data-subnet"]
  }
}

data "aws_subnet" "public" {
  vpc_id = data.aws_vpc.selected.id

  filter {
    name   = "tag:Name"
    values = ["${var.project}-${var.env}-public-subnet-0"]
  }
}
