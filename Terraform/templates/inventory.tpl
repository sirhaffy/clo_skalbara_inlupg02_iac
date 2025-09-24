---
all:
  vars:
    ansible_user: ec2-user
    ansible_ssh_private_key_file: /tmp/ansible_ssh_key
    ansible_ssh_common_args: '-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -o ConnectTimeout=30'

bastion_hosts:
  hosts:
    bastion-01:
      ansible_host: ${bastion_ip}

# Direct connection mode - no bastion proxy for CI/CD
docker_swarm:
  vars:
    # GitHub Actions har direkt access till private subnets via NAT Gateway
    ansible_ssh_common_args: '-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -o ConnectTimeout=30'
  children:
    swarm_managers:
      hosts:
%{ for idx, ip in manager_ips ~}
        swarm-manager-${idx + 1}:
          ansible_host: ${ip}
          swarm_role: manager
          swarm_primary: ${idx == 0 ? "true" : "false"}
%{ endfor ~}

    swarm_workers:
      hosts:
%{ for idx, ip in worker_ips ~}
        swarm-worker-${idx + 1}:
          ansible_host: ${ip}
          swarm_role: worker
%{ endfor ~}