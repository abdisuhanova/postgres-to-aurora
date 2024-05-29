data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.main[0].id, aws_subnet.main[1].id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
  count = var.subnet_amount
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.${count.index}.0/24"
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
}

resource "aws_security_group" "main" {
  name        = "allow_rds_access"
  description = "Allow postgresql inbound traffic from ec2 instance"
  vpc_id      = aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "main" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = var.port
  ip_protocol       = "tcp"
  to_port           = var.port
}