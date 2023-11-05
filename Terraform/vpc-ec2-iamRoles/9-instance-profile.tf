resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_role_profile"
  role = aws_iam_role.ec2_role.name
}