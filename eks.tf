module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-cluster"
  cluster_version = "1.17"
  subnets         = concat(module.vpc.private_subnets,module.vpc.public_subnets)
  vpc_id          = module.vpc.vpc_id

  worker_groups = [
    {
      instance_type = "t3.medium"
      asg_max_size  = 5
      asg_min_size  = 1
    }
  ]
}
