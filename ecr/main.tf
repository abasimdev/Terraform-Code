

#********** ECR **********
module "spc-ecr" {
  source                         = "../modules/ecr"
  region                         = var.region

}
#////////// ECR ENDS //////////