resource "aws_security_group" "edr_eks_security_group" {
  name   = "edr_eks_security_group"
  vpc_id = aws_vpc.edr_eks_vpc.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      var.base_cidr_block
    ]
  }
  tags = {
    "Name"      = "edr_eks_security_group"
    "Creator"   = var.creator
    "Terraform" = true
  }

}
