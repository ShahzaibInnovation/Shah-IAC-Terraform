# ---------- Create Key Pair ----------
resource "aws_key_pair" "login_key" {
  key_name   = "${var.env}-infra-app-key"
  public_key = file("${path.module}/mykey.pub")
}

# ---------- Default VPC ----------
data "aws_vpc" "default" {
  default = true
}

# ---------- Default Subnets ----------
data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# ---------- Security Group ----------
resource "aws_security_group" "mySG" {
  name        = "${var.env}-infra-app-sg"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-infra-app-sg"
  }
}

# ---------- EC2 Instance ----------
resource "aws_instance" "my_ec2" {
  count = var.instance_count

  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.login_key.key_name

  vpc_security_group_ids = [aws_security_group.mySG.id]
  subnet_id              = element(data.aws_subnets.default_subnets.ids, count.index)

  # user_data = file("docker-install.sh")

  root_block_device {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "${var.env}-infra-app-instance-${count.index + 1}"
    Enironment = var.env
  }
}
