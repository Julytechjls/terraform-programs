resource "aws_instance" "ec2instance" {
  subnet_id              = var.subnet_id
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
  EOF

  tags = {
    Name = "tf-ec2instance"
  }
}
