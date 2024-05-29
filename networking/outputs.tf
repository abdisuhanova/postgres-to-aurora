output sg_id {
  value       = aws_security_group.main.id
  description = "id of db security group"
}

output db_subnet_group {
  value       = aws_db_subnet_group.default.id
  description = "subnet group of db"
}

