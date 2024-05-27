resource "aws_instance" "windows" {
    ami = data.aws_ami.windows.id
    instance_type = var.instance_type
    key_name = var.keyname
    subnet_id =     var.subnet
    vpc_security_group_ids = var.securitygroup
    tags = local.common_tags_dev


    root_block_device {
    volume_type = "gp3"
    iops        = 3000
    throughput  = 125
    volume_size = 30
    delete_on_termination = false
    tags = local.common_tags_dev
}
}

resource "aws_ebs_volume" "datadrive1" {
  availability_zone = "us-east-1a"
  size = 40
  type = "gp3"
  tags = local.common_tags_dev

}

resource "aws_volume_attachment" "generic_data_vol_att0" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.datadrive1.id
  instance_id = aws_instance.windows.id
  

}

resource "aws_ebs_volume" "datadrive2" {
  availability_zone = "us-east-1a"
  size = 40
  type = "gp3"
  tags = local.common_tags_dev

}

resource "aws_volume_attachment" "generic_data_vol_att1" {
  device_name = "/dev/xvdg"
  volume_id   = aws_ebs_volume.datadrive2.id
  instance_id = aws_instance.windows.id
  

}
locals {
    common_tags_prd = {
        Name = "servername"
        os   = "windows"
        awsbackup = "Prod"
    }
  
}

locals {
    common_tags_dev = {
        Name = "servername"
        os   = "windows"
        awsbackup = "Dev"
        testing = "target"
    }
  
}

output "public_ip" {
    value = aws_instance.windows.public_ip
  
}

output "datavolumeid0" {
    value = aws_ebs_volume.datadrive1.id
  
}

output "datavolumeid1" {
    value = aws_ebs_volume.datadrive2.id
  
}