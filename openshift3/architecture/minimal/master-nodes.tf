resource "aws_instance" "master-node" {
  ami             = "${data.aws_ami.centos.id}"
  instance_type   = "${var.Types["Master"]}"
  key_name        = "training-${var.Training}"
  user_data       = "${file("assets/init.sh")}"

  vpc_security_group_ids = ["${aws_security_group.nodes-sg.id}", "${aws_security_group.master-sg.id}", "${aws_security_group.infra-sg.id}"]
  subnet_id = "${aws_subnet.subnets-public.*.id[0]}"
  ebs_optimized = true

  root_block_device {
    volume_type = "gp2"
    volume_size = 80
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Type = "master"
    Name = "Training ${var.Training} - Master Node"
    Training = "${var.Training}"
  }
}
