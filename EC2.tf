resource "aws_instance" "Test-server1" {
  ami                         = "ami-05a8c865b4de3b127" #eu-west-2
  instance_type               = "t2.micro"
  key_name                    = "ssh-key"
  vpc_security_group_ids      = [aws_security_group.Test-sec-group.id]
  associate_public_ip_address = "true"
  subnet_id                   = aws_subnet.Test-public-sub1.id

  tags = {
    name = "EC2"

  }
}


resource "aws_instance" "Test-server2" {
  ami                         = "ami-05a8c865b4de3b127" #eu-west-2
  instance_type               = "t2.micro"
  key_name                    = "ssh-key"
  vpc_security_group_ids      = [aws_security_group.Test-sec-group.id]
  associate_public_ip_address = "true"
  subnet_id                   = aws_subnet.Test-public-sub2.id

  tags = {
    name = "EC2"

  }
}

