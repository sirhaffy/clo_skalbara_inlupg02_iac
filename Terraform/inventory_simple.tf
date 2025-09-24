# Simple inventory generation with local-exec
resource "null_resource" "generate_inventory" {
  provisioner "local-exec" {
    command = <<-EOT
      cat > ../Ansible/inventory/tf_generated.yml <<EOF
---
all:
  vars:
    ansible_user: ec2-user
    ansible_ssh_private_key_file: /tmp/ansible_ssh_key
    ansible_ssh_common_args: '-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -o ConnectTimeout=30'

bastion_hosts:
  hosts:
    bastion-01:
      ansible_host: ${aws_instance.bastion.public_ip}

docker_swarm:
  vars:
    ansible_ssh_common_args: '-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -o ConnectTimeout=30'
  children:
    swarm_managers:
      hosts:
${join("\n", [for i, ip in aws_instance.swarm_manager[*].private_ip : "        swarm-manager-${format("%02d", i + 1)}:\n          ansible_host: ${ip}\n          swarm_role: manager\n          swarm_primary: ${i == 0 ? "true" : "false"}"])}

    swarm_workers:
      hosts:
${join("\n", [for i, ip in aws_instance.swarm_worker[*].private_ip : "        swarm-worker-${format("%02d", i + 1)}:\n          ansible_host: ${ip}\n          swarm_role: worker"])}
EOF
    EOT
  }

  depends_on = [
    aws_instance.bastion,
    aws_instance.swarm_manager,
    aws_instance.swarm_worker
  ]

  triggers = {
    bastion_ip = aws_instance.bastion.public_ip
    manager_ips = join(",", aws_instance.swarm_manager[*].private_ip)
    worker_ips = join(",", aws_instance.swarm_worker[*].private_ip)
  }
}