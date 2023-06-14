resource "aws_route_table_association" "pub_rta_zone1" {
  subnet_id      = aws_subnet.public_zone_1.id
  route_table_id = aws_route_table.publicRT.id
}

resource "aws_route_table_association" "pub_rta_zone2" {
  subnet_id      = aws_subnet.public_zone_2.id
  route_table_id = aws_route_table.publicRT.id
}

resource "aws_route_table_association" "priv_rta_zone1" {
  subnet_id      = aws_subnet.private_zone_1.id
  route_table_id = aws_route_table.privateRT_zone_1.id
}

resource "aws_route_table_association" "priv_rta_zone2" {
  subnet_id      = aws_subnet.private_zone_2.id
  route_table_id = aws_route_table.privateRT_zone_2.id
}
