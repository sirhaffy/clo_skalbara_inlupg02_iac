# CLO Skalbara Uppgift 02 - Infrastructure as Code

## Översikt
Komplett AWS-infrastruktur för skalbar webbapplikation med Docker Swarm. Terraform skapar infrastrukturen, Ansible konfigurerar servrarna.

## Arkitektur
```
Internet → ALB → Docker Swarm (3 noder) → DynamoDB ← Lambda API
```

## Terraform
Skapar AWS-resurser:
- **VPC** med privata/publika subnets
- **EC2-instanser** för Docker Swarm
- **Application Load Balancer** för high availability
- **Lambda + API Gateway** för backend API
- **DynamoDB** för databas
- **Security Groups** och IAM-roller

### Kommandon
```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

## Ansible
Konfigurerar servrarna automatiskt:
- **Docker-installation** och konfiguration
- **Docker Swarm** initialisering (1 manager, 2 workers)
- **Applikations-deployment** med 3 replicas
- **Säkerhetskonfiguration** och brandvägg

### Struktur
```
inventory/     - Server-definitioner
group_vars/    - Konfiguration per grupp  
playbooks/     - Huvudplaybooks
roles/         - Återanvändbara roller
```

## CI/CD Pipeline
GitHub Actions hanterar automatisk deployment:
1. **Setup** - S3 + DynamoDB för Terraform state
2. **Terraform** - Bygger AWS-infrastruktur
3. **Ansible** - Konfigurerar Docker Swarm
4. **Verification** - Kontrollerar deployment

## Resultat
Färdig skalbar infrastruktur med:
- Hög tillgänglighet (3 replicas, load balancer)
- Automatisk skalning (Lambda, DynamoDB)
- Rolling updates utan driftstopp
- Säker nätverkskonfiguration