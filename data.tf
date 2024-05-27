data "aws_ami" "windows" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base-202*"]

  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}