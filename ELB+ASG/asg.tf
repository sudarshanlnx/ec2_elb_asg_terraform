resource "aws_autoscaling_group" "web1" {
name = "${aws_launch_configuration.web.name}-asg"
  max_size = 2
  min_size = 1
  desired_capacity = 1
  health_check_type = "ELB"
  load_balancers = ["${aws_elb.web-elb.id}"]
launch_configuration = "${aws_launch_configuration.web.name}"
  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"
  ]
metrics_granularity = "1Minute"
  vpc_zone_identifier = ["${aws_subnet.demosubnet.id}","${aws_subnet.demosubnet1.id}"]

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "web"
  }
}