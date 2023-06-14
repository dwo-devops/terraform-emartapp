resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    "Name" = "publicRT"
  }
}

resource "aws_route_table" "privateRT_zone_1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat1.id
  }

  tags = {
    "Name" = "privateRT1"
  }
}

resource "aws_route_table" "privateRT_zone_2" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat2.id
  }

  tags = {
    "Name" = "privateRT2"
  }
}
