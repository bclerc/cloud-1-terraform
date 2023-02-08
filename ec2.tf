resource "aws_instance"  "linux" {

  ami = "ami-0ca5ef73451e16dc1"
  instance_type  = "t2.micro"
  subnet_id = aws_subnet.public.id
  iam_instance_profile = aws_iam_instance_profile.ssm-allow.name
  security_groups = [aws_security_group.httpsg.id, aws_security_group.ec2rds_egress.id]
  vpc_security_group_ids = [aws_security_group.httpsg.id, aws_security_group.ec2rds_egress.id]
  associate_public_ip_address = true
  availability_zone = var.availability_zone

  user_data = <<-EOF
  #!/bin/bash
  yum -y update
  yum -y install docker
  systemctl start docker
  docker run -p 80:80 -e WORDPRESS_DB_HOST=${aws_db_instance.default.address} -e WORDPRESS_DB_USER=${var.database_user} -e WORDPRESS_DB_PASSWORD=${var.database_password} -e WORDPRESS_DB_NAME=${var.database_name} -d wordpress 
  EOF

  tags  = {
    Name = "cloud-1-linux-ec2"
  }

}
