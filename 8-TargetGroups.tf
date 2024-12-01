# Tokyo Target Groups 
resource "aws_lb_target_group" "app1_tg" {
  name     = "app1-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app1-vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "App1TargetGroup"
    Service = "App1"
  }
}

# New York Target Group
resource "aws_lb_target_group" "app2_tg" {
  name     = "app2-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app2-vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "app2TargetGroup"
    Service = "app2"
  }
}

# London Target Group
resource "aws_lb_target_group" "app3_tg" {
  name     = "app3-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app3-vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "app3TargetGroup"
    Service = "app3"
  }
}

# Sao Paolo Target Group 
resource "aws_lb_target_group" "app4_tg" {
  name     = "app4-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app4-vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "app4TargetGroup"
    Service = "app4"
  }
}

# Sydney Target Group
resource "aws_lb_target_group" "app5_tg" {
  name     = "app5-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app5-vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "app5TargetGroup"
    Service = "app5"
  }
}

# Hong Kong Target Group
resource "aws_lb_target_group" "app6_tg" {
  name     = "app6-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app6-vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "app6TargetGroup"
    Service = "app6"
  }
}

# California Target Group
resource "aws_lb_target_group" "app7_tg" {
  name     = "app7-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app7-vpc.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "app7TargetGroup"
    Service = "app7"
  }
}
