STEP BY STEP VPC & EC2 CREATION WITH TERRAFORM

# 1 Configure Provider - 0-provider.tf
Create a folder for your project & create a file called 0-provider.tf 
Terraform provider: Link – https://registry.terraform.io/providers/hashicorp/aws/latest/docs
Configure your AWS credentials on the CLI: $ aws configure
# OPTIONAL (ADD BACKEND)
We may add the backend portion in the provider file too in order to store our state files remotely.
Create an s3 bucket and add the name to the code.
Create key path in the bucket and add it to the code: path/terraform.tfstate
//CODE//
terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}



# 2 Configure Variables and tags - variable.tf & terraform.tfvars
There are other ways of passing variables but here we go.
Create 2 files named variables.tf & terraform.tfvars.
We will pass the variables in the variables file.
We will pass the value in the .tfvars file.
Not to confuse you we will create just one variable and pass it on the tags, it's better to create more when you understand.


# 3 Configure VPC - 1-vpc.tf
Select a specific CIDR Range for your infrastructure. 
Subnet Mask Calculator: Link – https://www.site24x7.com/tools/ipv4-subnetcalculator.html
Every resource has a resource name and a given name.
Example: the resource name is aws_vpc then I gave MyVpc.
Create a file in the root folder called 1-vpc.tf.

# 4 Create Internet Gateway - 2-internetgw.tf
A VPC always needs an internet gateway to access the internet. 
We need to create an IGW and link it to the VPC ID dynamically.
Syntax: “resource_name.given_name.id” = aws_vpc.MyVpc.id.
Create a file in the root folder and name it 2-internetgw.tf 

# 5 Configure Subnet - 3-subnets.tf 
To create the subnet we need the VPC ID and a CIDR Block. 
We need to link the VPC ID dynamically by following the syntax.
Syntax: “resource_name.given_name.id” = aws_vpc.MyVpc.id.
Create a file in the root folder and name it 3-subnets.tf. 

# 6 Create Route Tables - 4-routetb.tf
Our VPC has an implicit router which must be attached to a subnet. 
We need route tables to control where network traffic is directed.
Dynamically link the internet gateway ID and VPC ID to the route.
Create a file in the root folder and name it 4-routetb.tf. 

# 7 Configure Route Table Association - 5-rtassociation.tf 
Create the route table association. 
Dynamically link the Route tb ID & Subnet ID to the association.
Create a file in the root folder and name it 5-rtassociation.tf. 

# 8 Create a security group for our instance - 6-securitygroup.tf
We need a security group to control traffic to our ec2 instance. 
Dynamically link the VPC ID to the security group.
We will open port 80 for http and 22 for SSH.
Create a file in the root folder and name it 6-securitygroup.tf. 

# 9 Create and EC2 Instance in our VPC - 7-ec2instance.tf
We know an EC2 instance is a virtual server in the Cloud. 
We can install our web app by bootstrapping during provisioning.
We can also install our applications after the instance is created.
We will link multiple resources to the ec2 for it to reside in our VPC.
But first create a key pair in the AWS console & use the name here.
Pick an AMI per your region or login to AWS Console and pick one. https://aws.amazon.com/amazon-linux-ami/
Create a file in the root folder and name it 7-ec2instance.tf.

# 10 Add multiple instances.
You may have a request to create multiple instances.
For each argument is used to add more resources.
Add the code snippet below to create multiple instances.
name them differently.

//CODE//
for_each = toset(["master", "slave"])
   tags = {
     Name = "${each.key}-${var.project-name}-ec2"
   }

# 11 Terraform CLI Commands.
terraform init = will initialize the directory by installing independencies.
terraform validate = will help validate if your code is well written.
terraform plan = will output the entire plan of the resources that will be created.
terraform apply = will deploy the resources in your cloud platform.
terraform apply --target aws_instance.my_ec2  = create a single resource
terraform destroy --target aws_instance.my_ec2 = destroy a single object
terraform destroy = will destroy the whole infrastructure. 