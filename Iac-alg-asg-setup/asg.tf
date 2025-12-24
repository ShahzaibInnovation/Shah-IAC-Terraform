resource "aws_autoscaling_group" "asg" {
  name = "prod-asg"

  min_size = 2

  max_size = 4

  desired_capacity = 2

  health_check_type = "ELB"

  health_check_grace_period = 300
  vpc_zone_identifier       = aws_subnet.private[*].id
  target_group_arns         = [aws_lb_target_group.tg.arn]

  launch_template {
    id = aws_launch_template.lt.id

    version = "$Latest"
  }
  tag {
    key = "Name"

    value = "prod-asg-ec2"

    propagate_at_launch = true
  }
  depends_on = [aws_lb_listener.listener]
}