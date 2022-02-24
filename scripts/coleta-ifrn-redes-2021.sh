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

echo "Por gentileza, abra, no Windows Explorer a pasta:"
echo "    Documentos\Ifrn\Redes"
echo 
echo "E veja envie o arquivo de coleta pelo Google Sala de Aula."

echo "Pressione a tecla <ENTER> para sair."



