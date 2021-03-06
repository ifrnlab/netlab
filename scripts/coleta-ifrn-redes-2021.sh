#!/bin/bash

# Onde salvar os dados
echo -n "Matrícula: "
read matricula

echo -n "E-mail do GSA: "
read escolar

HOSTNAME=$(hostname)
WHOAMI=$(whoami)
DIR_COLETAS=${HOME}/Documents/Ifrn/Redes/Coleta-${matricula}-${HOSTNAME}
ARQ_COLETAS=${DIR_COLETAS}.tar.gz
NOME_DIR_COLETAS=$(basename ${DIR_COLETAS})

echo "Criando pasta para coleta dos dados..."
mkdir -pv ${DIR_COLETAS} && cd $_

# Dados de seu usuário
echo "Salvando os dados de seu usuário e da máquina..."
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

## Dados das conexões de sua máquina
# - End. IP de rede privada, com máscara, roteador padrão e servidores DNS

# Correção: How to run Windows command prompt utilities options in Git Bash (how to specify /slash options)? - Super User
# https://superuser.com/questions/1142397/how-to-run-windows-command-prompt-utilities-options-in-git-bash-how-to-specify

ipconfig -all > ipconfig.txt

## Rotas
route print -4 > rotas.txt

## Caminho para IFRN
tracert -d -4 oulu.ifrn.edu.br > caminho-ifrn.txt

## Endereço IP público
curl -s ifconfig.me > ifconfig-me.txt

# Transporte

netstat -an -p tcp > conexoes-tcp.txt
netstat -an -p udp > conexoes-udp.txt

# Aplicação não será necessário, pois estamos interessados só nas portas

# Abertura do VS Code para revisão dos dados coletados
echo "Abrindo VS Code na pasta com os dados coletados..."
code .

# Empacotamento e compactação dos arquivos

echo "Compactando pasta de dados para arquivo \"${NOME_DIR_COLETAS}.tar.gz\""
cd ..
tar zcf ${NOME_DIR_COLETAS}.tar.gz ${NOME_DIR_COLETAS}

echo "Por gentileza, abra, no Windows Explorer, a pasta:"
echo "    ${USERPROFILE}\Documents\Ifrn\Redes"
echo 
echo "E envie o arquivo de coleta (\"${NOME_DIR_COLETAS}.tar.gz\") no formulário"
echo " disponibilizado pelo Google Sala de Aula."
echo

explorer "${USERPROFILE}\Documents\Ifrn\Redes"

echo "Pressione a tecla <ENTER> para sair."
read
