# Desafio _2_
![N|Solid](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmLvp8OCvFKUsdlXs-YIpnTcNYKCHgjTALzA&usqp=CAU)

## _Features_
1.  Criar uma VPC;
2.  Criar 3 subnets publicas, uma em cada AZ, dentro da VPC acima;
3.  Criar 3 subnets privadas, uma em cada AZ, dentro da VPC acima;
4.  Criar 1 Internet Gateway;
5.  Criar 1 Nat Gateway;
6.  Criar 2 Security Groups;
7.  Instancias EC2 utilizando a AMI da amazon Linux, instalar o apache e liberar o acesso conforme abaixo:
    7.1 Alterar o arquivo /var/www/html/index.html adicionando o texto  "Servidor Apache 1", e subir o serviço na porta 3001
    7.1 Alterar o arquivo /var/www/html/index.html adicionando o texto  "Servidor Apache 2", e subir o serviço na porta 3002
    7.1 Alterar o arquivo /var/www/html/index.html adicionando o texto  "Servidor Apache 3, e subir o serviço na porta 3003
Obs: As 3 instâncias devem ser deployadas uma em cada subrede privada com acesso a internet somente para instalação de pacotes , o apache não deve mostrar sua versão aos clientes através do nmap ou inspect via browser, desabilitar a versão 1.0 http e configurar no S.O. o tcp reuse e tcp port recycle (Que serve para reutilizar as portas TCP do kernel)
8. Uma Instância com Nginx em uma subrede pública, que será utilizada como LoadBalancer, conforme abaixo:
    8.1 Esta instãncia deve ter acesso Full a internet e acesso as portas de serviço das EC2 com apache via Security Group.
    8.2 Configurar o LoadBalancer no modo Random e acessivel via porta 8080.
    8.3 Durante a apresentação, o acesso deve ser feito no ip público desta EC2 para validar o funcionamento do Balancer
9.  Criar um Bucket S3 sem acesso a internet para ser repositório do terraform.tfstate

## Obrigatório ##
   - As EC2 devem ser deployadas utilizando "count" através do módulo criado no último desafio
   - As subnets devem ser criadas utilizando "count" ou "for_each"
   - Necessário ter outputs dos ips privados das 3 EC2 com apache e do ip público da EC2 com nginx
   - Utilizar dynamic block de um item de sua escolha da infraestrutura
   - Rodar tudo no computador pessoal, subir no GIT pessoal e montar uma apresentação final do seu código em funcionamento
   -- Ex: Mostrar o GIT, e rodar o terraform apply e mostrar a infra sendo provisionada na AWS e acessar o ip do balancer, demostrando o funcionamento.

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
