output "bastion_ip"{
  value = aws_instance.bastion.public_ip
}

output "app_ip"{
  value = aws_instance.app.private_ip
}


output "ssh_connection_string"{
  value = "ssh -l ubuntu ${aws_instance.bastion.public_ip}"
}

output "lb_dns_name"{
  value = aws_elb.elb.dns_name
}
