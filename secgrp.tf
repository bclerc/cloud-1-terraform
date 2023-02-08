resource "aws_security_group" "httpsg" {
  name = "sgSecurityGroup"
  description = "Allow HTTP from internet"
  vpc_id = aws_vpc.main.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ec2rds_egress" {
  name = "sgSecurityGroup-ec2rds_egress"
  description = "Allow Connection to DB from HTTPSG"
  vpc_id = aws_vpc.main.id

  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "db" {
  name = "sgSecurityGroup-db"
  description = "Allow Connection to DB from HTTPSG"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

