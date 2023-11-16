resource "aws_vpc" "MyVpc" {
     cidr_block = "10.1.0.0/16"
     tags = {
      Name = "${var.project-name}-vpc"
   }
}