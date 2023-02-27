resource "aws_elb" "web-elb" {
  name ="web-elb"
  security_groups = ["${aws_security_group.demosg1.id}"
  ]
  subnets = [
  "${aws_subnet.demosubnet.id}",
    "${aws_subnet.demosubnet1.id}"
  ]
 # cross_zone_load_balancing = ture
  health_check {
    healthy_threshold   = 2
    interval            = 30
    target              = "HTTP:80/index.html"
    timeout             = 3
    unhealthy_threshold = 2
  }
  listener {
    instance_port     = "80"
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}