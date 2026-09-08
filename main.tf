module "security" {
  source = "./modules/security"

  project = var.project
  env     = var.env
}

module "vm" {
  source  = "./modules/vm"
  project = var.project
  env     = var.env
  sg_id   = module.security.database_sg
}

module "iam" {
  source  = "./modules/iam"
  project = var.project
  env     = var.env
}

module "eks" {
  source           = "./modules/eks"
  project          = var.project
  env              = var.env
  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_worker_node_role_arn
}
