variable "instance_type" {
    type = string
    description = "variable for declaring instancetype"
    default = "t2.medium"
  
}

variable "ami" {
    type = string
    default = "mankfndk17717"
}
variable "size" {
    type = int
    default = 41
}


variable "keyname" {
    type = string
    description = "variable for declaring keypair"
    default = "windows"
  
}

variable "subnet" {
    type = string
    default = "subnet-07a389cc2ad2d24f7"
  
}

variable "securitygroup" {
    type = list(string)
    default =  [ "sg-0a4fe4ebbcbc0d8ff", "sg-02cc3a69f72a00982" ]
  
}

