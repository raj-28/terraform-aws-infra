aws_region = "us-east-1"
vpc_cidr = "10.0.0.0/16"
public_subnet_cidrs = [
  "10.0.4.0/24",
  "10.0.5.0/24",
  "10.0.6.0/24"
]
private_subnet_cidrs = [
  "10.0.104.0/24",
  "10.0.105.0/24",
  "10.0.106.0/24"
]
azs = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]
instance_type = "t2.micro"
ami_id = "ami-00ca32bbc84273381" # Replace with valid AMI for your region
key_name = "mynewkey" # Replace with your EC2 key pair name
