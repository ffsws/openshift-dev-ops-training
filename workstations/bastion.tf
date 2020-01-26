resource "aws_instance" "workstation" {
  depends_on             = [aws_internet_gateway.igw]

  ami                    = data.aws_ami.centos.id
  instance_type          = var.Type
  key_name               = "training-${count.index + 1}"

  subnet_id              = aws_subnet.subnets-public.id

  user_data              = file("init.sh")
  vpc_security_group_ids = [aws_security_group.workstation-sg.id]
  ebs_optimized = true

  count = var.Count

  root_block_device {
    volume_type = "gp2"
    volume_size = 100
  }

  tags = {
    Type = "workstation"
    Name = "Training - Workstation ${count.index + 1}"
  }
}

resource "aws_security_group" "workstation-sg" {
  description = "Workstation Security Group"
  name        = "training-workstation-sg"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 8443
    to_port          = 8443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port        = "-1"
    to_port          = "-1"
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Workstation Security Group"
  }
}