# IaC - Infrastructure as Code

Detta repo innehåller all kod för att automatisera och hantera infrastrukturen i AWS med Terraform och Ansible.

- **Terraform**: Skapar VPC, subnets, EC2, ALB, NAT Gateway, Security Groups, Lambda, DynamoDB, S3 mm.
- **Ansible**: Installerar och konfigurerar Docker Swarm på EC2-instanser, hanterar säkerhet och deployment.
- **CI/CD**: GitHub Actions automatiserar hela flödet från kod till färdig infrastruktur.

## Kom igång
1. Klona repot.
2. Sätt upp AWS credentials och SSH-nycklar.
3. Allt uppsättning automatiskt i CI/CD-pipelinen, kör inte lokalt.

All konfiguration är versionerad och reproducerbar. Se dokumentationen för detaljerad arkitektur.