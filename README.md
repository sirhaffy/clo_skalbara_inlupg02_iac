


## Terraform commands
```sh
terraform init
terraform plan
terraform apply
terraform destroy
```


## Ansible
Glöm inte installera Ansible i CI/CD-pipelinen.
```bash
sudo apt update
sudo apt install -y ansible
```
## Ansible för Docker Swarm

Katalogstruktur:
```sh
inventory/ - Server-definitioner
group_vars/ - Variabler per grupp
playbooks/ - Huvudplaybooks
roles/ - Återanvändbara roller (docker + docker_swarm)
Funktionalitet:
Docker-installation - Automatisk installation och konfiguration
Swarm-initialisering - Automatisk setup av manager och workers
Säkerhetskonfiguration - Firewall, användare, logs
Felhantering - Retries och robusta åtgärdercod
```