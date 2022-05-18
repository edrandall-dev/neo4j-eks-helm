resource "aws_iam_role" "edr_eks_cluster_role" {
  name               = "${var.env_prefix}_role"
  assume_role_policy = local.assume_role_policy
}

/*
resource "aws_iam_instance_profile" "ed_website_instance_profile" {
  name = "${var.env_prefix}_profile"
  role = aws_iam_role.ed_website_role.name
}
*/

resource "aws_iam_role_policy_attachment" "edr_eks_cluster_role_attachment" {
  for_each = toset([
    "AmazonEKSClusterPolicy"
  ])
  role       = aws_iam_role.edr_eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/${each.key}"
}

locals {
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "eks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}
