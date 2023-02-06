resource "aws_db_subnet_group" "main_db_subnets" {
  name       = "${var.db_name}-subnets"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "main_db" {
  identifier_prefix    = var.identifier_prefix
  allocated_storage    = 10
  db_name              = var.db_name
  engine               = "postgres"
  engine_version       = var.engine_version
  instance_class       = var.instance_type
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.main_db_subnets.name

  blue_green_update {
    enabled = var.blue_green_update_enabled
  }
}
