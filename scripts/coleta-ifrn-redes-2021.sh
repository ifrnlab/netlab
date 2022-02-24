#!/bin/bash

# Onde salvar os dados
echo -n "Matrícula: "
read matricula

echo -n "E-mail do GSA: "
read escolar

HOSTNAME=$(hostname)
WHOAMI=$(whoami)
CONTA_OULU=$(echo ${escolar} | cut -d@ -f1)
FQDN_OULU="oulu.ifrn.edu.br"
DIR_COLETAS=${HOME}/Documents/Ifrn/Redes/Coleta-${matricula}-${HOSTNAME}
ARQ_COLETAS=${DIR_COLETAS}.tar.gz
NOME_DIR_COLETAS=$(basename ${DIR_COLETAS})

echo "Criando pasta para coleta dos dados..."
mkdir -pv ${DIR_COLETAS} && cd $_

# Dados de seu usuário
echo "Salvando seus dados de seu usuário e da máquina..."
echo ${matricula} > matricula.txt
echo ${escolar} > escolar.txt
echo ${USERNAME} > username.txt

# Informações gerais do sistema
echo "Salvando informações gerais do sistema..."
systeminfo > systeminfo.yaml

# Enlace

getmac > getmac.txt
arp -a > arp.txt
netsh wlan show interfaces > netsh-wlan-show-interfaces.txt


# Rede

## Nome da máquina
hostname > hostname.txt
whoami > whoami.txt

## Dados das conexões de sua máquina
# - End. IP de rede privada, com máscara, roteador padrão e servidores DNS
ipconfig /all > ipconfig.txt

## Rotas
route print -4 > rotas.txt

## Endereço IP público
curl -s ifconfig.me > ifconfig-me.txt

# Transporte

netstat -an -p tcp > conexoes-tcp.txt
netstat -an -p udp > conexoes-udp.txt

# Aplicação não será necessário, pois estamos interessados só nas portas

# Abertura do VS Code para revisão dos dados coletados
echo "Vamos entrar no VS Code para revisar os dados coletados?"
code .

# https://stackoverflow.com/questions/1885525/how-do-i-prompt-a-user-for-confirmation-in-bash-script
# Confirmação de envio para Oulu
read -p "Deseja enviar os dados para Oulu (S/N)?" -n 1 -r
echo
if [[ ${REPLY} =~ ^[Ss]$ ]]
then

cat << FIM
CRIAÇÃO DE USUÁRIO NA OULU
==========================

Quando solicitado, entre com os seguintes dados:
- Senha de estudante: estudante (Será solicitada 2x)
- Matrícula: ${matricula}
- Senha: <Sua senha do SUAP>

Observe que não aparecerá nenhum caracter enquanto você digitar as senhas.

Importante! Copie a senha nova que foi gerada para seu usuário. Você precisará 
entrar com ela duas vezes (2x) antes de escolher sua senha na Oulu. 
FIM

ssh -t estudante@oulu.ifrn.edu.br sudo cria-meu-usuario

cat << FIM
TROCA DE SENHA DE SEU USUÁRIO NA OULU
=====================================

1. Copie a senha nova que voi criada para seu usuário na Oulu
2. Cole a senha e pressione a tecla ENTER posteriormente

   Para copiar ou colar a senha, use o botão direito do mouse.
   
   Lembre-se:
   a) Copiar em inglês: "Copy"
   b) Colar em inglês: "Paste"

3. Escolha uma nova senha e entre com ela duas vezes (2x).

OBS: Se der erro nesse passo, execute novamente o script.
FIM

ssh ${CONTA_OULU}@${FQDN_OULU} byobu-enable

echo "Copactando os dados coletados..."
cd ..
tar zcvf ${NOME_DIR_COLETAS}.tar.gz ${NOME_DIR_COLETAS}

echo "Enviando dados para Oulu..."
scp ${NOME_DIR_COLETAS}.tar.gz ${CONTA_OULU}@${FQDN_OULU}:/repo/info3v2021/nossa-rede

# Final do bloco IF
fi


echo "Pressione a tecla <ENTER> para sair."



