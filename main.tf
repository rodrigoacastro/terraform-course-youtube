resource "aws_internet_gateway" "mtc_internet_gateway" {
  vpc_id = aws_vpc.mtc_vpc.id

  tags = {
    Name = "dev-igw"
  }
}

resource "aws_route_table" "mtc_public_rt" {
  vpc_id = aws_vpc.mtc_vpc.id

  #   route {
  #     cidr_block = "10.0.1.0/24"
  #     gateway_id = aws_internet_gateway.mtc_internet_gateway.id
  #   }

  tags = {
    Name = "dev-public-rt"
  }
}

resource "aws_route" "mtc_rt" {
  route_table_id         = aws_route_table.mtc_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.mtc_internet_gateway.id
}

resource "aws_route_table_association" "mtc_public_assoc" {
  subnet_id      = aws_subnet.mtc_public_subnet.id
  route_table_id = aws_route_table.mtc_public_rt.id
}


