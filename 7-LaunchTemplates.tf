# Tokyo Launch Template
resource "aws_launch_template" "app1_LT" {
  provider      = aws.tokyo
  name_prefix   = "app1_LT"
  image_id      = "ami-023ff3d4ab11b2525"  
  instance_type = "t2.micro"
  key_name      = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.app1_sg01_servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Additional script content...
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app1_LT"
      Service = "application1"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

# New York Launch Template
resource "aws_launch_template" "app2_LT" {
  provider      = aws.new_york
  name_prefix   = "app2_LT"
  image_id      = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  key_name      = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.app2_sg01_servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Additional script content...
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app2_LT"
      Service = "application2"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

# London Launch Template
resource "aws_launch_template" "app3_LT" {
  provider      = aws.london
  name_prefix   = "app3_LT"
  image_id      = "ami-0c76bd4bd302b30ec"
  instance_type = "t2.micro"
  key_name      = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.app3_sg01_servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Additional script content...
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app3_LT"
      Service = "application3"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Sao Paulo Launch Template
resource "aws_launch_template" "app4_LT" {
  provider      = aws.sao_paolo
  name_prefix   = "app4_LT"
  image_id      = "ami-0c820c196a818d66a"
  instance_type = "t2.micro"
  key_name      = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.app4_sg01_servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Additional script content...
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app4_LT"
      Service = "application4"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Sydney Launch Template
resource "aws_launch_template" "app5_LT" {
  provider      = aws.sydney
  name_prefix   = "app5_LT"
  image_id      = "ami-0146fc9ad419e2cfd"
  instance_type = "t2.micro"
  key_name      = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.app5_sg01_servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Additional script content...
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app5_LT"
      Service = "application5"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Hong Kong Launch Template
resource "aws_launch_template" "app6_LT" {
  provider      = aws.hong_kong
  name_prefix   = "app6_LT"
  image_id      = "ami-06f707739f2271995"
  instance_type = "t3.micro"
  key_name      = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.app6_sg01_servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Additional script content...
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app6_LT"
      Service = "application6"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

# California Launch Template
resource "aws_launch_template" "app7_LT" {
  provider      = aws.california
  name_prefix   = "app7_LT"
  image_id      = "ami-038bba9a164eb3dc1"
  instance_type = "t2.micro"
  key_name      = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.app7_sg01_servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Additional script content...
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app7_LT"
      Service = "application7"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}


 ################################################################### 
// replace the userdata with this secion when all corrections are made
  # Define the user data script with Terraform templating
  #user_data = templatefile("${path.module}/promtail.sh.tpl", {
  #  loki_private_ip = aws_instance.SIEM_Server.private_ip
  #})
  ################################################################### 