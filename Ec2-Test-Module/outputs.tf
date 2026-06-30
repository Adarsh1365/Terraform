output "id" {
  value       = module.ec2-test.instance_id                                      # The actual value to be outputted
}

output "pub_ip" {
  value       = module.ec2-test.public_ip                                    # The actual value to be outputted
}

output "priv_ip" {
  value       = module.ec2-test.private_ip                                      # The actual value to be outputted
}
output "sg_id" {
  value       = module.sg_test.sg_ids                                     # The actual value to be outputted
}