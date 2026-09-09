resource "aws_instance" "database" {
  for_each                    = var.database_components
  ami                         = "ami-0fdfb4d987b63ae72"
  instance_type               = each.value
  subnet_id                   = data.aws_subnet.data.id
  key_name                    = "roboshop_pem"
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.sg_id]
  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }
  user_data = file("${path.module}/../../scripts/${each.key}.sh")

  tags = {
    Name = "${var.project}-${var.env}-${each.key}"
  }

}
