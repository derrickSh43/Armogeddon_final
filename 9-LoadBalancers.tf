# Tokyo Load Balancer
resource "aws_lb" "app1_alb" {
  name               = "app1-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app1-lb01-sg01.id]
  subnets            = [
    aws_subnet.public-ap-northeast-1a.id,
    aws_subnet.public-ap-northeast-1c.id
  ]
  enable_deletion_protection = false

  tags = {
    Name    = "app1LoadBalancer"
    Service = "app1"
  }
}
resource "aws_lb_listener" "app1_http" {
  load_balancer_arn = aws_lb.app1_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app1_tg.arn
  }
}

# New York Load Balancer
resource "aws_lb" "app2_alb" {
  name               = "app2-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app2-lb01-sg01.id]
  subnets            = [
    aws_subnet.public-us-east-1a.id,
    aws_subnet.public-us-east-1c.id
  ]
  enable_deletion_protection = false

  tags = {
    Name    = "app2LoadBalancer"
    Service = "app2"
  }
}
resource "aws_lb_listener" "app2_http" {
  load_balancer_arn = aws_lb.app2_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app2_tg.arn
  }
}

# London Load Balancer
resource "aws_lb" "app3_alb" {
  name               = "app3-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app3-lb01-sg01.id]
  subnets            = [
    aws_subnet.public-eu-west-2a.id,
    aws_subnet.public-eu-west-2c.id
  ]
  enable_deletion_protection = false

  tags = {
    Name    = "app3LoadBalancer"
    Service = "app3"
  }
}
resource "aws_lb_listener" "app3_http" {
  load_balancer_arn = aws_lb.app3_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app3_tg.arn
  }
}

# Sao Paolo Load Balancer
resource "aws_lb" "app4_alb" {
  name               = "app4-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app4-lb01-sg01.id]
  subnets            = [
    aws_subnet.public-sa-east-1a.id,
    aws_subnet.public-sa-east-1c.id
  ]
  enable_deletion_protection = false

  tags = {
    Name    = "app4LoadBalancer"
    Service = "app4"
  }
}
resource "aws_lb_listener" "app4_http" {
  load_balancer_arn = aws_lb.app4_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app4_tg.arn
  }
}

# Sydney Load Balancer
resource "aws_lb" "app5_alb" {
  name               = "app5-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app5-lb01-sg01.id]
  subnets            = [
    aws_subnet.public-ap-southeast-2a.id,
    aws_subnet.public-ap-southeast-2c.id
  ]
  enable_deletion_protection = false

  tags = {
    Name    = "app5LoadBalancer"
    Service = "app5"
  }
}
resource "aws_lb_listener" "app5_http" {
  load_balancer_arn = aws_lb.app5_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app5_tg.arn
  }
}

# Hong Kong Load Balancer
resource "aws_lb" "app6_alb" {
  name               = "app6-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app6-lb01-sg01.id]
  subnets            = [
    aws_subnet.public-ap-east-1a.id,
    aws_subnet.public-ap-east-1c.id
  ]
  enable_deletion_protection = false

  tags = {
    Name    = "app6LoadBalancer"
    Service = "app6"
  }
}
resource "aws_lb_listener" "app6_http" {
  load_balancer_arn = aws_lb.app6_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app6_tg.arn
  }
}

# California Load Balancer
resource "aws_lb" "app7_alb" {
  name               = "app7-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app7-lb01-sg01.id]
  subnets            = [
    aws_subnet.public-us-west-1a.id,
    aws_subnet.public-us-west-1c.id
  ]
  enable_deletion_protection = false

  tags = {
    Name    = "app7LoadBalancer"
    Service = "app7"
  }
}
resource "aws_lb_listener" "app7_http" {
  load_balancer_arn = aws_lb.app7_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app7_tg.arn
  }
}
