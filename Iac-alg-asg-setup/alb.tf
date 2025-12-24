resource "aws_lb" "alb" {
  name = "prod-alb"

  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]

  subnets = aws_subnet.public[*].id

  enable_deletion_protection = true
}
resource "aws_lb_target_group" "tg" {
  name = "prod-tg"

  port = 80

  protocol = "HTTP"
  vpc_id   = aws_vpc.prod.id

  health_check {
    enabled = true

    path = "/"

    port = "traffic-port"

    interval = 30

    timeout = 5

    healthy_threshold = 2

    unhealthy_threshold = 2
    matcher             = "200"

  }
}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80

  protocol = "HTTP"

  default_action {
    type = "forward"

    target_group_arn = aws_lb_target_group.tg.arn
  }
}