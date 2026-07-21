#!/bin/bash
# Bootstrap script: installs Docker on the EC2 instance so it can
# pull and run the containerized app on first boot.
set -euo pipefail

dnf update -y
dnf install -y docker
systemctl enable docker
systemctl start docker
usermod -aG docker ec2-user

echo "Docker installation complete." > /var/log/user-data.log
