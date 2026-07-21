# DevOps & Cloud Portfolio Project

A complete, end-to-end DevOps pipeline demonstrating containerization, infrastructure as code, CI/CD automation, and configuration management — built to showcase hands-on skills across the modern DevOps toolchain.

## What this project demonstrates

| Skill | Tool | Where |
|---|---|---|
| Containerization | Docker, Docker Compose | [`docker/`](./docker) |
| Infrastructure as Code | Terraform | [`terraform/`](./terraform) |
| CI/CD Pipeline | Jenkins | [`jenkins/Jenkinsfile`](./jenkins/Jenkinsfile) |
| CI/CD Pipeline (alt) | GitHub Actions | [`.github/workflows/`](./.github/workflows) |
| Configuration Management | Ansible | [`ansible/`](./ansible) |
| Cloud Provisioning | AWS (VPC, EC2, IAM, Security Groups) | [`terraform/main.tf`](./terraform/main.tf) |
| Application | Python / Flask | [`app/`](./app) |

## Architecture

```
                    ┌─────────────────┐
                    │   GitHub Repo    │
                    └────────┬─────────┘
                             │ push
                    ┌────────▼─────────┐
                    │  CI/CD Pipeline   │
                    │ (Jenkins / GHA)   │
                    │  build → test →   │
                    │  push image       │
                    └────────┬─────────┘
                             │
                    ┌────────▼─────────┐
                    │   Docker Image    │
                    │   (DockerHub)     │
                    └────────┬─────────┘
                             │ deploy
              ┌──────────────▼──────────────┐
              │   AWS EC2 (via Terraform)    │
              │  ┌────────────────────────┐  │
              │  │  Docker Container       │  │
              │  │  Flask App :5000        │  │
              │  │  behind Nginx :80       │  │
              │  └────────────────────────┘  │
              └───────────────────────────────┘
```

## Project structure

```
devops-cloud-project/
├── app/                    # Flask application + unit tests
│   ├── app.py
│   ├── test_app.py
│   └── requirements.txt
├── docker/                 # Containerization
│   ├── Dockerfile          # Multi-stage build, non-root user, healthcheck
│   ├── docker-compose.yml  # App + Nginx reverse proxy
│   └── nginx.conf
├── terraform/               # AWS infrastructure provisioning
│   ├── provider.tf
│   ├── variables.tf
│   ├── main.tf              # VPC, subnet, security group, IAM role, EC2
│   ├── outputs.tf
│   └── user_data.sh         # Bootstrap script (installs Docker on boot)
├── jenkins/
│   └── Jenkinsfile          # Build → test → push → deploy pipeline
├── ansible/                  # Server configuration & deployment
│   ├── playbook.yml
│   └── inventory.ini
└── .github/workflows/
    └── ci-cd.yml             # GitHub Actions equivalent pipeline
```

## How to run locally

```bash
# Clone the repo
git clone https://github.com/<your-username>/devops-cloud-project.git
cd devops-cloud-project

# Build and run with Docker Compose
docker-compose -f docker/docker-compose.yml up --build

# App available at http://localhost:8080
# Health check: http://localhost:8080/health
```

## How to provision AWS infrastructure

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
# edit terraform.tfvars with your AWS key pair name and preferred region

terraform init
terraform plan
terraform apply
```

This provisions a VPC, public subnet, internet gateway, security group (ports 22/80/5000), an IAM role with CloudWatch permissions, and an EC2 instance with Docker pre-installed via user-data.

## How to configure the server with Ansible

```bash
cd ansible
# update inventory.ini with your EC2 instance's public IP and key path
ansible-playbook -i inventory.ini playbook.yml
```

## CI/CD pipeline

Both a **Jenkinsfile** and a **GitHub Actions workflow** are included, doing the same thing two different ways:
1. Install dependencies
2. Run unit tests (pytest)
3. Build the Docker image
4. Push to DockerHub
5. Deploy via Docker Compose

## Tech stack

`Python` `Flask` `Docker` `Docker Compose` `Terraform` `AWS (EC2, VPC, IAM, Security Groups)` `Jenkins` `GitHub Actions` `Ansible` `Nginx`

## Author

**Nikita Sumant**
DevOps & Cloud Engineer | [LinkedIn](https://www.linkedin.com/in/nikita-sumant-233975228/)
