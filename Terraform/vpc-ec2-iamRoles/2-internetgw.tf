resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.MyVpc.id
  tags = {
    Name = "${var.project-name}-igw"
  }
}
