# 9SOAT-G63-MC-KING
## Tech Challenge FIAP - 9SOAT - Grupo 63

### Participantes:
- **Mayara Manzi** - RM359734 

mayaramanzi@hotmail.com

- **Renan Eustaquio Claudiano Martins** - RM359737

renan.ecm@outlook.com



## Objetivo
Este projeto visa implementar um sistema de autoatendimento para uma lanchonete de bairro que está em expansão devido ao seu grande sucesso. O objetivo é melhorar o atendimento aos clientes e garantir a precisão dos pedidos, minimizando confusões e atrasos.

### Benefícios esperados:
- **Melhorar a eficiência do atendimento:** Reduzir o tempo de espera dos clientes e garantir a precisão dos pedidos.
- **Aumentar a satisfação dos clientes:** Oferecer uma experiência de atendimento moderna e eficiente.

## Entregáveis - Fase 3
Dando continuidade ao desenvolvimento do software para a lanchonete, teremos as seguintes melhorias e alterações:

1. **Implementação de API Gateway e Function Serverless para autenticação via CPF:**
   - Integração ao sistema de autenticação para identificar o cliente.
2. **Implementação de CI/CD segregado por repositórios:**
   - **1 repositório** para o Lambda.
   - **1 repositório** para infraestrutura Kubernetes via Terraform.
   - **1 repositório** para infraestrutura de banco de dados gerenciáveis via Terraform.
   - **1 repositório** para a aplicação executada no Kubernetes.
3. **Deploy automatizado via Actions:**
   - As branches `main/master` serão protegidas.
   - Os commits diretos serão bloqueados, exigindo o uso de Pull Requests.
4. **Melhoria da estrutura do banco de dados:**
   - Documentação seguindo padrões de modelagem de dados.
   - Justificativa da escolha do banco de dados.
5. **Uso obrigatório de serviços serverless:**
   - **Functions:** AWS Lambda, Azure Functions ou Google Functions.
   - **Banco de dados gerenciáveis:** AWS RDS, Banco de Dados do Azure ou Cloud SQL no GCP.
   - **Sistema de autenticação:** AWS Cognito, Microsoft AD ou Google Identity Platform.

## Tecnologias Utilizadas
- **Visual Studio 2022**
- **.NET - 8.0**
- **Postgres - 16.4**
- **AWS EKS**
- **AWS RDS**
- **AWS VPC**
- **AWS Transit Gateway**
- **AWS DynamoDB**
- **AWS Secrets Manager**

## Guia de Setup do Projeto Terraform Local
Este guia descreve o processo de configuração do ambiente para rodar o projeto localmente utilizando Terraform.

### Clonar o Repositório
Clone o repositório do projeto para sua máquina local e abra um terminal na raiz do projeto.

```sh
 git clone https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-EKS-Fase3.git
```

### Configuração das Credenciais AWS
Configure suas credenciais AWS no arquivo:
```
~/.aws/credentials
```

### Rodando o Terraform
Na raiz do repositório, entre no diretório `./Terraform` (onde estão todos os scripts Terraform) e execute os seguintes comandos no terminal:

#### Inicializando o Terraform
```sh
terraform init
```

#### Validando os scripts Terraform
```sh
terraform validate
```

#### Verificando o plano de implantação
```sh
terraform plan
```

#### Aplicando o plano de implantação
```sh
terraform apply
```

## Pipeline Status

[![Build](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-EKS-Fase3/actions/workflows/build.yml/badge.svg)](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-EKS-Fase3/actions/workflows/build.yml)

[![Deploy](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-EKS-Fase3/actions/workflows/deploy.yml/badge.svg)](https://github.com/renaneustaquio/FiapTech-Challenge-Fiap-EKS-Fase3/actions/workflows/deploy.yml)

