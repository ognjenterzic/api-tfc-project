

output "bucket-arn" {
  value =["${aws_s3_bucket.ogi-bucket.*.arn}"] 
}

/*
output "ec2_global_ips" {
  value = ["${aws_instance.ogi-instance.*.public_ip}"]
}
*/