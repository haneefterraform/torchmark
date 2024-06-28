variable "region" {
  type        = string
  description = "variable for declare region"
  default     = "us-east-1"

}

variable "instance_type" {
  type        = string
  description = "variable for declaring instancetype"
  default     = "t2.medium"

}

variable "ami" {
  type    = string
  default = "mankfndk17717"
}
variable "size" {
  type    = string
  default = "41"
}


variable "keyname" {
  type        = string
  description = "variable for declaring keypair"
  default     = "windowsjune"

}
variable "vpc_id" {
  type    = string
  default = "vpc-0168ac5f2a65b55f7"

}
variable "subnet" {
  type    = string
  default = "subnet-046b7ebb8f1490e0d"

}

variable "securitygroup" {
  type    = list(string)
  default = ["sg-0307401aac8ee913f"]

}

/*
variable "volume_count" {
  description = "Number of EBS volumes to create and attach"
  type        = number
  default     = 2

}

variable "volume_size" {
  description = "size of volumes you need to create"
  type        = list(number)
  default     = [30, 40]

}
*/
variable "root_voulme_size" {
  type = number
  description = "root voulume size"
  default = 100
}
variable "data_drives" {
  description = "List of data drives to attach"
  type = list(object({
    device_name = string
    volume_size = number
    volume_type = string
   

  }))
  default = [
    {
      device_name = "/dev/xvdh"
      volume_size = 100
      volume_type = "gp3"
      delete_on_termination = true
   
       },

    {
      device_name = "/dev/xvdc"
      volume_size = 200
      volume_type = "gp3"
      delete_on_termination = true
    },

    {
      device_name = "/dev/xvdd"
      volume_size = 200
      volume_type = "gp3"
      delete_on_termination = true
    }

   


  ]
}
variable "request" {
  default = "1244"

}

variable "env" {
  type    = string
  default = "prod"

}


#########################################
variable "label" {
  type = list(string)    
  default =  ["logs", "temp", "data"]
  
}

