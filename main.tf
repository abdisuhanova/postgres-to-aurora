#main.tf
#defining the provider as aws
provider "aws" {
    region = "${var.region}"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}

module "networking" {
  source = "./networking"
}

module "postgres" {
  source = "./postgres"
  
  sg_id = module.networking.sg_id
  db_subnet_group = module.networking.db_subnet_group
  depends_on = [
    module.networking
  ]
}

module "aurora" {
  source = "./aurora"
  
  sg_id = module.networking.sg_id
  db_subnet_group = module.networking.db_subnet_group
  depends_on = [
    module.networking
  ]
}