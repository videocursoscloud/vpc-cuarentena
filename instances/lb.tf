resource "aws_elb" "elb" {
  name               = "elb"
  security_groups = [aws_security_group.allow_lb.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  subnets = [
     data.terraform_remote_state.vpc.outputs.public_1_subnet_id,
     data.terraform_remote_state.vpc.outputs.public_2_subnet_id
  ]
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 5
  }

  instances                   = [aws_instance.app.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 10
  connection_draining         = true
  connection_draining_timeout = 10

  tags = {
    Name = "elb"
  }
}
