resource "aws_instance" "app-node" {
  ami             = "${data.aws_ami.centos.id}"
  instance_type   = "${var.Types["App"]}"
  key_name        = "training-${var.Training}"
  user_data       = "${file("assets/init.sh")}"

  vpc_security_group_ids = ["${aws_security_group.nodes-sg.id}"]
  subnet_id = "${aws_subnet.subnets-public.*.id[(count.index % length(aws_subnet.subnets-public))]}"
  ebs_optimized = true
  
  count = "${var.Counts["App"]}"

  root_block_device {
    volume_type = "gp2"
    volume_size = 40
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Type = "app"
    Name = "Training ${var.Training} - App ${count.index + 1}"
    Training = "${var.Training}"
  }
}
