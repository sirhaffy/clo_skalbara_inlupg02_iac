# Generate Ansible inventory from Terraform outputs
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tpl", {
    bastion_ip     = aws_instance.bastion.public_ip
    manager_ips    = aws_instance.swarm_manager[*].private_ip
    worker_ips     = aws_instance.swarm_worker[*].private_ip
  })

  filename = "${path.module}/../Ansible/inventory/generated_hosts.yml"

  depends_on = [
    aws_instance.bastion,
    aws_instance.swarm_manager,
    aws_instance.swarm_worker
  ]
}