resource "aws_instance" "my-ec2"{
    ami="ami-0b029b1931b347543"
    instance_type="t2.micro"
    vpc_security_group_ids =[aws_security_group.HTTP_security_groupe.id]
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
    description = "EC2 Instance all atributes"
    value= aws_instance.my-ec2
    
}
resource "aws_security_group" "HTTP_security_groupe"{
    ingress {
        to_port = 80
        from_port = 80
        cidr_blocks  = ["0.0.0.0/0"]
        protocol = "tcp"
    }

    tags = {
    Name = "Allow HTTP"
  }
}
terraform {
    backend "s3" {
    bucket = "joseph-bucket2"
    key    = "key"
    region = "us-west-2"
  }
}



