resource "aws_db_subnet_group" "drupal_db_subnet_group" {
  name       = "drupal-db-subnet-group"
  subnet_ids = [aws_subnet.public_1.id, aws_subnet.public_2.id]

  tags = {
    Name = "drupal-db-subnet-group"
  }
}

resource "aws_db_instance" "drupal_db" {
  identifier              = "drupal-db"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = var.db_username
  password                = var.db_password
  db_name                 = var.db_name
  skip_final_snapshot     = true
  multi_az                = true
  publicly_accessible     = false
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.drupal_db_subnet_group.name

  tags = {
    Name = "drupal-db-instance"
  }
}