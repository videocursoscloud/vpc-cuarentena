resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.main.id
  subnet_ids = [
	aws_subnet.private_1.id,
	aws_subnet.private_2.id
  ]

  tags = {
    Name = "${local.project_name}-private"
  }
}
####################
##
## Ingress Rules
##
####################

resource "aws_network_acl_rule" "private_ingress_100" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/16"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "private_ingress_101" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 101
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/16"
  from_port      = 22
  to_port        = 22
}


resource "aws_network_acl_rule" "private_ingress_102" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 102
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/16"
  from_port      = 1024
  to_port        = 65535
}

####################
##
## Egress Rules
##
####################

resource "aws_network_acl_rule" "private_egress_100" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 100
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}

resource "aws_network_acl_rule" "private_egress_101" {
  network_acl_id = aws_network_acl.private.id
  rule_number    = 101
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.0.0/16"
  from_port      = 8888
  to_port        = 8888
}
