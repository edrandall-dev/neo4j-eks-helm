resource "aws_vpc" "edr_eks_vpc" {
  cidr_block           = var.base_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    "Name"      = "${var.env_prefix}_vpc"
    "Creator"   = var.creator
    "Terraform" = true
  }
}

resource "aws_subnet" "edr_eks_public_subnet_a" {
  vpc_id                  = aws_vpc.edr_eks_vpc.id
  cidr_block              = cidrsubnet(var.base_cidr_block, 8, 1)
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    "Name"      = "${var.env_prefix}_public_subnet_a"
    "Creator"   = var.creator
    "Terraform" = true
  }
}

resource "aws_subnet" "edr_eks_public_subnet_b" {
  vpc_id                  = aws_vpc.edr_eks_vpc.id
  cidr_block              = cidrsubnet(var.base_cidr_block, 8, 2)
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    "Name"      = "${var.env_prefix}_public_subnet_b"
    "Creator"   = var.creator
    "Terraform" = true
  }
}

resource "aws_subnet" "edr_eks_public_subnet_c" {
  vpc_id                  = aws_vpc.edr_eks_vpc.id
  cidr_block              = cidrsubnet(var.base_cidr_block, 8, 3)
  availability_zone       = "${var.region}c"
  map_public_ip_on_launch = true

  tags = {
    "Name"      = "${var.env_prefix}_public_subnet_c"
    "Creator"   = var.creator
    "Terraform" = true
  }
}

resource "aws_subnet" "edr_eks_private_subnet_a" {
  vpc_id                  = aws_vpc.edr_eks_vpc.id
  cidr_block              = cidrsubnet(var.base_cidr_block, 8, 4)
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = false

  tags = {
    "Name"      = "${var.env_prefix}_private_subnet_a"
    "Creator"   = var.creator
    "Terraform" = true
  }
}

resource "aws_subnet" "edr_eks_private_subnet_b" {
  vpc_id                  = aws_vpc.edr_eks_vpc.id
  cidr_block              = cidrsubnet(var.base_cidr_block, 8, 5)
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    "Name"      = "${var.env_prefix}_private_subnet_b"
    "Creator"   = var.creator
    "Terraform" = true
  }
}

resource "aws_subnet" "edr_eks_private_subnet_c" {
  vpc_id                  = aws_vpc.edr_eks_vpc.id
  cidr_block              = cidrsubnet(var.base_cidr_block, 8, 6)
  availability_zone       = "${var.region}c"
  map_public_ip_on_launch = true

  tags = {
    "Name"      = "${var.env_prefix}_private_subnet_c"
    "Creator"   = var.creator
    "Terraform" = true
  }
}


/*

resource "aws_internet_gateway" "ed_website_igw" {
  vpc_id = aws_vpc.ed_website_vpc.id

  tags = {
    "Name"      = "${var.env_prefix}_vpc_igw"
    "Creator"   = var.creator
    "Terraform" = true
  }
}

resource "aws_route_table" "ed_website_public_subnet_rt" {
  vpc_id = aws_vpc.ed_website_vpc.id
  tags = {
    "Name"      = "${var.env_prefix}_public_subnet_rt"
    "Creator"   = var.creator
    "Terraform" = true
  }
}

resource "aws_route" "ed_website_public_subnet_route" {
  route_table_id         = aws_route_table.ed_website_public_subnet_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ed_website_igw.id
}

resource "aws_route_table_association" "edr_website_proxy_route_assoc" {
  subnet_id      = aws_subnet.ed_website_public_subnet.id
  route_table_id = aws_route_table.ed_website_public_subnet_rt.id
}


/*  Stuff in this bit probably isn't required - commenting it for now

resource "aws_subnet" "ed_website_private_subnet" {
  vpc_id                  = aws_vpc.ed_website_vpc.id
  cidr_block              = cidrsubnet(var.base_cidr_block, 8, 1)
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = false

  tags = {
    "Name"      = "${var.env_prefix}_private_subnet"
    "Creator"   = var.creator
    "Terraform" = true
  }
}

resource "aws_nat_gateway" "ed_website_ngw" {
  allocation_id = aws_eip.ed_website_ngw_eip.id
  subnet_id     = aws_subnet.ed_website_public_subnet.id

  tags = {
    "Name"      = "${var.env_prefix}_website_ngw"
    "Creator"   = var.creator
    "Terraform" = true
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.ed_website_igw]
}

resource "aws_eip" "ed_website_ngw_eip" {
  //instance = aws_instance.web.id
  vpc      = true
}

*/
