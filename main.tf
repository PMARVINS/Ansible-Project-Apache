# Creating aws network for projct - Prod-rock-VPC

resource "aws_vpc" "Prod-rock-VPC" {
  cidr_block           = var.rock-vpc-cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Prod-rock-VPC"
  }
}

#Creating public subnet 1
resource "aws_subnet" "Test-public-sub1" {
  vpc_id            = aws_vpc.Prod-rock-VPC.id
  cidr_block        = var.pub-subnet1
  availability_zone = "eu-west-2a"

  tags = {
    Name = "public-subnet"
  }
}

#Creating public subnet 2
resource "aws_subnet" "Test-public-sub2" {
  vpc_id            = aws_vpc.Prod-rock-VPC.id
  cidr_block        = var.pub-subnet2
  availability_zone = "eu-west-2a"


  tags = {
    Name = "public-subnet"
  }
}

#Creating Private subnet 1
resource "aws_subnet" "Test-priv-sub1" {
  vpc_id            = aws_vpc.Prod-rock-VPC.id
  cidr_block        = var.Priv-subnet1
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Private-subnet"
  }
}

#Creating Private subnet 2
resource "aws_subnet" "Test-priv-sub2" {
  vpc_id            = aws_vpc.Prod-rock-VPC.id
  cidr_block        = var.Priv-subnet2
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Private-subnet"
  }
}

# Creating public route table
resource "aws_route_table" "Test-pub-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  route = []

  tags = {
    Name = "Public-Route-table"
  }
}

# Creating private route table
resource "aws_route_table" "Test-priv-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  route = []

  tags = {
    Name = "private-route-table"
  }
}

#Associating Public subnet 1 with public route table
resource "aws_route_table_association" "routetable-publicsub-1" {
  subnet_id      = aws_subnet.Test-public-sub1.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}

#Associating Public subnet 2 with public route table
resource "aws_route_table_association" "routetable-publicsub-2" {
  subnet_id      = aws_subnet.Test-public-sub2.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}

#Associating Private subnet 1 with private route table
resource "aws_route_table_association" "routetable-privsub-1" {
  subnet_id      = aws_subnet.Test-priv-sub1.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}

#Associating Private subnet 2 with private route table
resource "aws_route_table_association" "routetable-privsub-2" {
  subnet_id      = aws_subnet.Test-priv-sub2.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}

# Creating Internet gateway  
resource "aws_internet_gateway" "Test-igw" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  tags = {
    Name = "IGW"
  }
}

#Associating Internet Gateway to public route table
resource "aws_route" "Test-igw-association" {
  route_table_id         = aws_route_table.Test-pub-route-table.id
  gateway_id             = aws_internet_gateway.Test-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

#create Elastic IP

resource "aws_eip" "Test-Prod-EIP" {
  vpc = true
}

#Creating NAT gateway.

resource "aws_nat_gateway" "Test-Nat-gateway" {
  allocation_id = aws_eip.Test-Prod-EIP.id
  subnet_id     = aws_subnet.Test-public-sub1.id

  tags = {
    Name = "Nat-gateway"
  }
}

#Associating NATgateway with private route table

resource "aws_route" "test-Nat-association" {
  route_table_id         = aws_route_table.Test-priv-route-table.id
  nat_gateway_id         = aws_nat_gateway.Test-Nat-gateway.id
  destination_cidr_block = "0.0.0.0/0"
}
