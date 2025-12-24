data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"

    values = ["amzn2-ami-hvm-*"]
  }
}
resource "aws_launch_template" "lt" {
  name_prefix = "prod-lt-"

  image_id = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type
  iam_instance_profile {
    name = aws_iam_instance_profile.profile.name
  }
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  user_data = base64encode(<<EOF
#!/bin/bash
yum update -y
yum install -y httpd
systemctl enable httpd
systemctl start httpd
echo "Production Auto Scaling EC2 - $(hostname)" > /var/www/html/index.html
EOF
  )
}