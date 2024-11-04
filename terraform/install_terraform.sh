#!/bin/bash

# Script para instalar o Terraform no CentOS
# https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

# Função para verificar o status do último comando executado
check_status() {
  if [ $? -ne 0 ]; then
    echo "Erro ao executar: $1"
    exit 1
  fi
}

echo "Instalando o Terraform no CentOS..."

# Instalar o yum-utils
echo "Instalando o yum-utils..."
sudo yum install -y yum-utils
check_status "yum-utils"

# Adicionar o repositório do HashiCorp
echo "Adicionando o repositório do HashiCorp..."
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
check_status "yum-config-manager --add-repo"

# Instalar o Terraform
echo "Instalando o Terraform..."
sudo yum -y install terraform
check_status "terraform install"

# Verificar a instalação
echo "Verificando a instalação do Terraform..."
terraform --version &>/dev/null
if [ $? -eq 0 ]; then
  echo "Terraform instalado com sucesso!"
  terraform --version
else
  echo "Erro: Terraform não foi instalado corretamente."
  exit 1
fi
