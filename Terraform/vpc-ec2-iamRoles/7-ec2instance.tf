resource "aws_instance" "MyServer" {
  ami                         = "ami-01bc990364452ab3e"
  instance_type               = "t2.micro"
  key_name                    = "bjuatkey"
  monitoring                  = true
  subnet_id                   = aws_subnet.public2.id
  vpc_security_group_ids      = [aws_security_group.MySg.id]
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = true

  //CODE//
  for_each = toset(["node-1", "node-2"])
    tags = {
      Name = "${each.key}-${var.project-name}-ec2"

    }

  # tags = {
  #   Name = "${var.project-name}-ec2"
  # }
}

resource "aws_instance" "Myubuntu" {
  ami                         = "ami-0fc5d935ebf8bc3bc"
  instance_type               = "t2.micro"
  key_name                    = "bjuatkey"
  monitoring                  = true
  subnet_id                   = aws_subnet.public2.id
  vpc_security_group_ids      = [aws_security_group.MySg.id]
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = true

  # //CODE//
  # for_each = toset(["node-1", "node-2"])
  #   tags = {
  #     Name = "${each.key}-${var.project-name}-ec2"

  #   }

  tags = {
    Name = "${var.project-name}-ec2"
  }
}