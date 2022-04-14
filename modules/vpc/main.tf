resource "aws_vpc" {
    cidr_block                       = var.cidr_block
    enable_dns_support               = true
    enable_dns_hostnames             = true
    assign_generated_ipv6_cidr_block = true
     tags                            = {Name ="vpc-${var.name}"}
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.new_vpc.id
  tags   = { Name = "igw-${var.name}" }
}

resource "aws_route_table" "public_RT_new_vpc" {
  vpc_id = aws_vpc.new_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = { Name = "Public-RT-${var.name}" }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.new_vpc.id
  count                   = length(var.public_cidr)
  cidr_block              = var.public_cidr[count.index]
  availability_zone       = var.az[count.index]
  map_public_ip_on_launch = true
  tags                    = { Name = "SN-PUB-${count.index}" }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.new_vpc.id
  count             = length(var.private_cidr)
  cidr_block        = var.private_cidr[count.index]
  availability_zone = var.az[count.index]
  tags              = { Name = "SN-PRIV-${count.index}" }
}