#Tokyo Auto Scaling Group 
resource "aws_autoscaling_group" "app1_asg" {
  name_prefix           = "app1-auto-scaling-group-"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 4
  vpc_zone_identifier   = [
    aws_subnet.private-ap-northeast-1a.id,
    aws_subnet.private-ap-northeast-1c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true

  launch_template {
    id      = aws_launch_template.app1_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app1-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "app1_scaling_policy" {
  name                   = "app1-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.app1_asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}


# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "app1_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.app1_asg.id
  lb_target_group_arn    = aws_lb_target_group.app1_tg.arn
}

#New York Auto Scaling Group 
resource "aws_autoscaling_group" "app2_asg" {
  name_prefix           = "app2-auto-scaling-group-"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 4
  vpc_zone_identifier   = [
    aws_subnet.private-us-east-1a.id,
    aws_subnet.private-us-east-1c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true

  launch_template {
    id      = aws_launch_template.app2_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app2-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "app2_scaling_policy" {
  name                   = "app2-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.app2_asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "app2_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.app2_asg.id
  lb_target_group_arn    = aws_lb_target_group.app2_tg.arn
}

#London Auto Scaling Group 
resource "aws_autoscaling_group" "app3_asg" {
  name_prefix           = "app3-auto-scaling-group-"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 4
  vpc_zone_identifier   = [
    aws_subnet.private-eu-west-2a.id,
    aws_subnet.private-eu-west-2c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true

  launch_template {
    id      = aws_launch_template.app3_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app3-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "app3_scaling_policy" {
  name                   = "app3-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.app3_asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "app3_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.app3_asg.id
  lb_target_group_arn    = aws_lb_target_group.app3_tg.arn
}

#Sao Paolo Auto Scaling Group 
resource "aws_autoscaling_group" "app4_asg" {
  name_prefix           = "app4-auto-scaling-group-"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 4
  vpc_zone_identifier   = [
    aws_subnet.private-sa-east-1a.id,
    aws_subnet.private-sa-east-1c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true

  launch_template {
    id      = aws_launch_template.app4_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app4-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "app4_scaling_policy" {
  name                   = "app4-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.app4_asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "app4_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.app4_asg.id
  lb_target_group_arn    = aws_lb_target_group.app4_tg.arn
}

#Sydney Auto Scaling Group
resource "aws_autoscaling_group" "app5_asg" {
  name_prefix           = "app5-auto-scaling-group-"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 4
  vpc_zone_identifier   = [
    aws_subnet.private-ap-southeast-2a.id,
    aws_subnet.private-ap-southeast-2c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true

  launch_template {
    id      = aws_launch_template.app5_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app5-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "app5_scaling_policy" {
  name                   = "app5-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.app5_asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "app5_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.app5_asg.id
  lb_target_group_arn    = aws_lb_target_group.app5_tg.arn
}

#Hong Kong Auto Scaling Group
resource "aws_autoscaling_group" "app6_asg" {
  name_prefix           = "app6-auto-scaling-group-"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 4
  vpc_zone_identifier   = [
    aws_subnet.private-ap-east-1a.id,
    aws_subnet.private-ap-east-1c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true

  launch_template {
    id      = aws_launch_template.app6_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }
  
  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app6-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "app6_scaling_policy" {
  name                   = "app6-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.app6_asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "app6_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.app6_asg.id
  lb_target_group_arn    = aws_lb_target_group.app6_tg.arn
}

#California Auto Scaling Group 
resource "aws_autoscaling_group" "app7_asg" {
  name_prefix           = "app7-auto-scaling-group-"
  min_size              = 2
  max_size              = 10
  desired_capacity      = 4
  vpc_zone_identifier   = [
    aws_subnet.private-us-west-1a.id,
    aws_subnet.private-us-west-1c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true

  launch_template {
    id      = aws_launch_template.app7_LT.id
    version = "$Latest"
  }

  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]

  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }

  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }

  tag {
    key                 = "Name"
    value               = "app7-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}


# Auto Scaling Policy
resource "aws_autoscaling_policy" "app7_scaling_policy" {
  name                   = "app7-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.app7_asg.name

  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}

# Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "app7_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.app7_asg.id
  lb_target_group_arn    = aws_lb_target_group.app7_tg.arn
}
