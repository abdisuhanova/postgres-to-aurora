resource "aws_db_instance" "myrds" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "aurora-postgresql"
  instance_class       = "db.t3.micro"
  username             = "postgres"
  password             = "postgres"
  parameter_group_name = "default.postgres16"
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.sg_id]
  db_subnet_group_name = var.db_subnet_group
}