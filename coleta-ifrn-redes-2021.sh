#!/bin/bash

# Onde salvar os dados
echo -n "Matrícula: "
read matricula

echo -n "E-mail do GSA: "
read escolar

DIR_COLETAS=${HOME}/Documents/Ifrn/Redes/Coleta-${matricula}

mkdir -pv ${DIR_COLETAS} && cd $_

# Dados de seu usuário
echo ${matricula} > matricula.txt
echo ${escolar} > escolar.txt

# Informações gerais do sistema
systeminfo > systeminfo.yaml

# Enlace

getmac > getmac.txt
netsh wlan show interfaces > netsh-wlan-show-interfaces.txt

# Rede

## Dados das conexões de sua máquina
# - End. IP de rede privada, com máscara, roteador padrão e servidores DNS
ipconfig /all > ipconfig.txt

## Endereço IP público
curl -s ifconfig.me > ifconfig-me.txt

# Transporte

netstat -an -p tcp > conexoes-tcp.txt
netstat -an -p udp > conexoes-udp.txt

# Aplicação não é necessário, pois estamos interessados só nas portas

cd ..
tar zcvf coleta-${matricula}.tar.gz Coleta-${matricula}

echo "Por gentileza, abra, em seu Explorador do Windows (Windows Explorer), a pasta:"
echo ${PWD}

echo "E envie o arquivo coleta-${matricula}.tar.gz"
read

