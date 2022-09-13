#SEC group

resource "aws_security_group" "Test-sec-group" {
  name        = "Test-sec-group"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Prod-rock-VPC.id

  ingress {
    description = "http acess"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG"
  }
}