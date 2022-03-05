# Desafio _NGINX_
![N|Solid](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmLvp8OCvFKUsdlXs-YIpnTcNYKCHgjTALzA&usqp=CAU)

## _Features_
1.  Criar uma VPC;
2.  Criar 3 subnets, uma em cada AZ, dentro da VPC acima;
3.  Criar 1 Internet Gateway;
4.  Criar 1 Security Group com acesso as portas 80 e 22;
5.  Criar EC2 com Nginx ativo e acessivel pela porta 80;
6.  Criar um Bucket S3 sem acesso a internet para ser repositório do terraform.tfstate
7.  **_Extra_** - Modularizar a criação do EC2

## Pré-Requisito
- Ter uma conta na AWS;
- Configurar terraform no PC;
- Ter/Criar uma Chave publica;

## Arquivos e Pastas

- ***1-remote-state/main.tf*** - Criação do Bucket S3 para terraform.tfstate do projeto
- ***module-ec2/main.tf*** - Criação do módulo EC2
- ***module-ec2/outputs.tf*** - Outputs do EC2
- ***module-ec2/var.tf*** - Variaveis do módulo de EC2
- ***2-Infra/ec2.tf*** - Criação de EC2 com base no módulo **_module-ec2_**
- ***2-Infra/keyPair.tf*** - Criação de Key Pair com base na chave pública
- ***2-Infra/main.tf*** - Declaração dos providers e backend S3 do terraform.tfstate
- ***2-Infra/nginx.sh*** - Instalação, start e habilitação do NGINX
- ***2-Infra/output.tf*** - Outputs dos recursos criados
- ***2-Infra/securityGroup.tf*** - Criação do Security Group, liberando a porta 22 e 80, liberado acesso apenas para o ip de criação dos recursos.
- ***2-Infra/variables.tf*** - Variaveis dos recursos de infraestrutura
- ***2-Infra/vpc.tf*** - Criação de VPC, Internet Gateway, 3 subnets, Route Table e Route Table Association

## Implementação do código

1. **Clone do repósitorio GIT [EC2-com-NGINX-Terraform.git](https://github.com/Furipe09/EC2-com-NGINX-Terraform.git)**
    ```sh
    git clone https://github.com/Furipe09/EC2-com-NGINX-Terraform.git
    cd ...EC2-com-NGINX-Terraform.../
    ```
    
2.  **Criação do Bucket S3, executando o **'1-remote-state/main.tf'****
    - 2.1 *Inicializando o ambiente*
    ```sh
    terraform init
    ```
    - 2.2  Montando o plano de criação do Bucket S3
    ```sh
    terraform plan
    ```
    - 2.3 Aplicando a criação do Bucket S3 com auto-aprove
    ```sh
    terraform apply -auto-approve
    ```
    
3.  **Alteração, a gosto, dos conteúdos das váriaveis de inicialização no **'Infra/variables.tf'****

4. **Alterar no repositório '2-Infra/keyPair.tf', a chave pública para a sua própria.**


5.  **Executando a criação dos recursos na pasta '2-Infra/'**
    - 5.1 Inicializando o ambiente

    ```sh
    terraform init
    ```
    - 5.2  Montando o plano de criação dos recursos
    ```sh
    terraform plan
    ```
    - 5.3 Aplicando a criação dos recursos com auto-aprove
    ```sh
    terraform apply -auto-approve
    ```
6. **Por fim, não esquecer de destruir o ambiente, primeiro na pasta '2-Infra/' e depois na pasta '1-remote-state/'**
    ```sh
    terraform destroy
    ```
