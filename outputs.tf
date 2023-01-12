output "bucked-id" {
  value = aws_s3_bucket.ogi-bucket.id
}

output "ec2_global_ips" {
  value = ["${aws_instance.ogi-intance.*.public_ip}"]
}