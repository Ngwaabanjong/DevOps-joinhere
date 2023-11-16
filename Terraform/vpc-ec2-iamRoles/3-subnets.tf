resource "aws_subnet" "public1" {
  vpc_id             = aws_vpc.MyVpc.id
  cidr_block         = "10.1.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.project-name}-public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.MyVpc.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.project-name}-public2"
  }
}