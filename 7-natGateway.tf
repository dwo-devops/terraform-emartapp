resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.eip_nat1.id
  subnet_id     = aws_subnet.public_zone_1.id
  tags = {
    "Name" = "NATgw1"
  }
}

resource "aws_nat_gateway" "nat2" {
  allocation_id = aws_eip.eip_nat2.id
  subnet_id     = aws_subnet.public_zone_2.id
  tags = {
    "Name" = "NATgw2"
  }
}
