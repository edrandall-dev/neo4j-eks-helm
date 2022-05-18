region          = "eu-north-1"
base_cidr_block = "192.168.0.0/16"
creator         = "Ed Randall - ed.randall@neo4j.com"

instance_types = {
  "ed_k8s_cp_instance"     = "t3.small",
  "ed_k8s_worker_instance" = "t3.small"
}

env_prefix = "ed_aws_eks"

public_key_path = "/home/vscode/.ssh/neo4j-aws-ssh-key.pub"
