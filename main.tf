resource "aws_instance" "my-ec2"{
    ami="ami-0b029b1931b347543"
    instance_type="t2.micro"
    tags = {
        Name = "Joseph-EC2-Instance"
    }
}
resource  "aws_eip" "my-eip"{
    vpc = true
}

resource "aws_eip_association" "associate"{
    instance_id=aws_instance.my-ec2.id
    allocation_id=aws_eip.my-eip.id

}
output "Private_IP" {
    description = "VMs Private IP"
    value= aws_instance.my-ec2.public_ip

}
output "VMs_Type"{
    description = "VMs type"
    value = aws_instance.my-ec2.instance_type
}

output "Public_IP"{
    description = "VMs private IP"
    value = aws_instance.my-ec2.private_ip
}
terraform {
    backend "s3" {
    bucket = "joseph-bucket2"
    key    = "key"
    region = "us-west-2"
  }
}
