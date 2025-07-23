resource "aws_lb" "drupal_alb" {
  name               = "drupal-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]

  tags = {
    Name = "drupal-alb"
  }
}

resource "aws_lb_target_group" "drupal_tg" {
  name     = "drupal-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "drupal-tg"
  }
}

resource "aws_lb_listener" "drupal_listener" {
  load_balancer_arn = aws_lb.drupal_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.drupal_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "drupal_attach" {
  count            = 2
  target_group_arn = aws_lb_target_group.drupal_tg.arn
  target_id        = aws_instance.drupal_server[count.index].id
  port             = 80
}