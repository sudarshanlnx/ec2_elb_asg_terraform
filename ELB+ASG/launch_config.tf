resource "aws_launch_configuration" "web" {
  name_prefix = "web-"
  image_id      = "ami-05bfbece1ed5beb54"
  instance_type = "t2.micro"
  key_name = "Jan_05_key"
  security_groups = ["${aws_security_group.demosg1.id}"]
  associate_public_ip_address = true
  user_data = "${file("data.sh")}"
  lifecycle {
    create_before_destroy = true
  }
}