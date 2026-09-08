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

