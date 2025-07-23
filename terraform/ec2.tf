resource "aws_instance" "drupal_server" {
  count         = 2
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2 AMI (eu-west-2)
  instance_type = "t2.micro"
  key_name = "drupal-key"

  subnet_id = element([
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ], count.index)

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  associate_public_ip_address = true  # Ensure public access if needed

  tags = {
    Name = "drupal-server-${count.index + 1}"
    Role = "webserver"
  }
}