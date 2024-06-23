output "private_ip" {
  value = aws_instance.windows.private_ip

}

output "datadrives" {
  value = aws_ebs_volume.datadrives.*.id

}


output "SG" {
  value = aws_instance.windows.*.security_groups 
  
}
