resource "aws_vpc" "ElastiCacheVPC" {

  cidr_block = "10.0.0.0/16"  # Set your VPC CIDR block
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "public" {
  count = 2

  vpc_id                  = aws_vpc.ElastiCacheVPC.id
  cidr_block              = "10.0.${count.index}.0/24"  # Adjust the CIDR blocks for your subnets
  availability_zone       = element(["us-east-1a"], count.index)  # Use your desired AZs
  map_public_ip_on_launch = true  # Enable public IPs for the public subnet

  tags = {
    Name = "public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count = 1

  vpc_id                  = aws_vpc.ElastiCacheVPC.id
  cidr_block              = "10.0.${count.index + 2}.0/24"  # Adjust the CIDR blocks for your subnets
  availability_zone       = element(["us-east-1a"], count.index)  # Use your desired AZs

  tags = {
    Name = "private-subnet-${count.index}"
  }
}

#hello world
