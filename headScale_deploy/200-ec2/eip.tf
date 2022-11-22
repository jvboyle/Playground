
resource "aws_eip" "elastic" {
  vpc = true
  tags = {
    Name = "headscale-eip"
  }
}


resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.headscale.id
  allocation_id = aws_eip.elastic.id
}