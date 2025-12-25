# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.prod.id
  tags = {
    Name = "prod-igw"
  }
}
# Public Subnets (ALB)
resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.prod.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = element(["ap-southeast-2a", "ap-southeast-2b"], count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "prod-public-subnet-${count.index}"
  }
}
# Private Subnets (EC2)
resource "aws_subnet" "private" {
  count = 2

  vpc_id = aws_vpc.prod.id

  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index + 10)

  availability_zone = element(["ap-southeast-2a", "ap-southeast-2b"], count.index)
  tags = {
    Name = "prod-private-subnet-${count.index}"
  }
}
# NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
  tags = {
  Name = "prod-nat-eip" }
}
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "prod-nat-gateway"
  }
}