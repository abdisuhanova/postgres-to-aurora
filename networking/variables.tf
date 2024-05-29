variable port {
  type        = number
  default     = 5432
  description = "port of the database"
}

variable subnet_amount {
  type        = number
  default     = 2
  description = "number of subnets for db"
}
