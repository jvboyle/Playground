data "aws_ami" "selected" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

 owners = ["099720109477"] # Canonical
}

data "aws_vpc" "selected" {
  tags = {
    Name = "4bzone-vpc"
  }
}

resource "aws_security_group" "headscale_sg" {
  vpc_id      = data.aws_vpc.selected.id
  description = "headscale_sg"
}

resource "aws_security_group_rule" "allow_ssh" {
  description       = "allow ssh IN from Source"
  security_group_id = aws_security_group.headscale_sg.id
  type              = "ingress"
  protocol          = "TCP"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["73.215.253.117/32"]
}

resource "aws_security_group_rule" "allow_https" {
  description       = "allow https IN"
  security_group_id = aws_security_group.headscale_sg.id
  type              = "ingress"
  protocol          = "TCP"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh_allow_out" {
  description       = "allow outbound"
  security_group_id = aws_security_group.headscale_sg.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  #tfsec:ignore:AWS007
  cidr_blocks = ["0.0.0.0/0"]
}


resource "aws_instance" "headscale" {
  instance_type               = "t3.micro"
  ami                         = data.aws_ami.selected.id
  associate_public_ip_address = true
  #availability_zone           = data.aws_subnet.private.availability_zone
  #subnet_id                   = data.aws_subnet.private.id
  #disable_api_termination     = false
  ebs_optimized               = true
  #hibernation                 = false
  #iam_instance_profile        = aws_iam_instance_profile.nginx.name
  key_name                    = "headscale-ec2"
  vpc_security_group_ids      = [aws_security_group.headscale_sg.id]

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = 8
    volume_type           = "gp2"
  }

  tags = {
    "Name" = "headscale-ec2"
  }
 lifecycle {
    ignore_changes = [ami]
  }

}