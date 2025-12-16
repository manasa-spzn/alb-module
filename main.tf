#create an application load balancer
resource "aws_lb" "my_alb" {
  region             = var.region
  name               = "my-alb"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [var.sg_alb_id]
  subnets = [
    var.subnet_1_id,
    var.subnet_2_id
  ]
}

#create a target group for the ALB and attach it to the ASG
resource "aws_lb_target_group" "alb_target_group" {
  region      = var.region
  name        = "alb-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.id_vpc
  target_type = "instance"
}

#attach the target group to the ASG
resource "aws_autoscaling_attachment" "alb_asg_attachment" {
  region                 = var.region
  autoscaling_group_name = var.id_asg
  lb_target_group_arn    = aws_lb_target_group.alb_target_group.arn
}

#create a listener for the ALB
resource "aws_lb_listener" "alb_listener" {
  region            = var.region
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}
