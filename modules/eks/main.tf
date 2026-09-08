resource "aws_eks_cluster" "main" {
  name = "${var.project}-${var.env}-eks-cluster"

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }

  role_arn = var.cluster_role_arn
  version  = "1.35"

  vpc_config {
    subnet_ids = [
      data.aws_subnet.app_1.id,
      data.aws_subnet.app_2.id
    ]
  }
}


resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.project}-${var.env}-node-group"
  node_role_arn   = var.node_role_arn
  subnet_ids      = [data.aws_subnet.app_1.id, data.aws_subnet.app_2.id]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

  update_config {
    max_unavailable = 2
  }
}
