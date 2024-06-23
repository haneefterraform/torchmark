
provider "aws" {
  region = var.region

}
resource "aws_instance" "windows" {
  ami                    = data.aws_ami.windows.id
  instance_type          = var.instance_type
  key_name               = var.keyname
  vpc_id                 = var.vpc_id
  subnet_id              = var.subnet
  vpc_security_group_ids = var.securitygroup
  #tags                   = local.common_tags_dev
  tags = var.env == "dev" ? local.common_tags_dev : local.common_tags_prd

  root_block_device {
    volume_type           = "gp3"
    iops                  = 3000
    throughput            = 125
    volume_size           = var.root_voulme_size
    delete_on_termination = true
    tags = var.env == "dev" ? local.common_tags_dev : local.common_tags_prd
  }
}

resource "aws_ebs_volume" "datadrives" {
  count             = length(var.data_drives)
  availability_zone = aws_instance.windows.availability_zone
  size              = var.data_drives[count.index].volume_size
  type              = var.data_drives[count.index].volume_type
  encrypted         = true

  tags = merge(
     var.env == "dev" ? local.common_tags_dev: local.common_tags_prd,
    

    {

     Name = "servername_datadisk${count.index}"
      
   
   
  
}
     

  )

}
    
  

resource "aws_volume_attachment" "multiple_drives" {
  count       = length(var.data_drives)
  device_name = var.data_drives[count.index].device_name
  volume_id   = aws_ebs_volume.datadrives[count.index].id
  instance_id = aws_instance.windows.id
}



locals {
  common_tags_prd = {
    Name      = "servername"
    os        = "windows"
    awsbackup = "Prod"
    Ritm      = var.request
  }

}

locals {
  common_tags_dev = {
    Name      = "servername"
    os        = "windows"
    awsbackup = "Dev"
    Ritm      = var.request
  }
}



