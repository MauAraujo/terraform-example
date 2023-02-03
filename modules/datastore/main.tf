resource "aws_db_instance" "main_database" {
  allocated_storage    = 10
  db_name              = "webserver_db"
  engine               = "postgres"
  engine_version       = "14.6"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "root"
  parameter_group_name = ""
  skip_final_snapshot  = true
}
