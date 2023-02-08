
resource "aws_db_subnet_group" "private-group" {
  name       = "main"
  subnet_ids = [aws_subnet.private.id, aws_subnet.private-2.id]
  tags = {
    Name = "Private Subnet group"
  }
}

resource "aws_db_instance" "default" {

  db_subnet_group_name =   aws_db_subnet_group.private-group.id
  vpc_security_group_ids = [aws_security_group.db.id]
  availability_zone    =   var.availability_zone
  allocated_storage    = 10
  db_name              = var.database_name
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.database_user
  password             = var.database_password
  parameter_group_name = "default.mysql5.7"
  port                 = 3306
  skip_final_snapshot  = true
}