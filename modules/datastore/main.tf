resource "aws_db_instance" "main_database" {
  allocated_storage    = 10
  db_name              = var.db_name
  engine               = "postgres"
  engine_version       = var.engine_version
  instance_class       = var.instance_type
  username             = ""
  password             = ""
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true
}
