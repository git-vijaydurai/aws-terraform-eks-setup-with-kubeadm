module "vpc_module" {

  source                   = "../modules/vpc"
  nat_network_interface_id = module.ec2_module.net_id


}

module "sg_module" {

  source = "../modules/sg"
  vpc-id = module.vpc_module.vpc-id

}

module "ec2_module" {

  source         = "../modules/ec2"
  subnet_1-id    = module.vpc_module.subnet_1-id
  security_group = module.sg_module.sg-id
  subnet_2-id    = module.vpc_module.subnet_2-id


}

