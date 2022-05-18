resource "aws_eks_cluster" "edr-eks-cluster" {
  name     = "edr-eks-cluster"
  role_arn = aws_iam_role.edr_eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
    aws_subnet.edr_eks_private_subnet_a.id,
    aws_subnet.edr_eks_private_subnet_b.id,
    aws_subnet.edr_eks_private_subnet_c.id
    ]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.edr_eks_cluster_role_attachment
  ]

  tags = {
    "Name"      = "${var.env_prefix}_eks_cluster"
    "Creator"   = var.creator
    "Terraform" = true
  }
}

output "endpoint" {
  value = aws_eks_cluster.edr-eks-cluster.endpoint
}

/*
output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.example.certificate_authority[0].data
}


module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_name    = local.cluster_name
  cluster_version = "1.20"

  subnets = [
    "${aws_subnet.edr_eks_private_subnet_a.id}",
    "${aws_subnet.edr_eks_private_subnet_b.id}",
    "${aws_subnet.edr_eks_private_subnet_c.id}"
  ]


  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t2.small"
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
      asg_desired_capacity          = 2
    },
    {
      name                          = "worker-group-2"
      instance_type                 = "t2.medium"
      additional_userdata           = "echo foo bar"
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
      asg_desired_capacity          = 1
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

*/
