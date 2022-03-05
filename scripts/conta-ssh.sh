#!/bin/bash

# Constantes
SSH_DIR=~/.ssh
SSH_CONF=${SSH_DIR}/config
SSH_KEY=${SSH_DIR}/id_ed25519

# Variáveis
read -r -p "Matrícula: " matricula
read -r -p "E-mail do Google Sala de Aula: " email
read -r -p "Servidor: " servidor

usuario=$(echo "${email}" | cut -d@ -f1)
srv=$(echo "${servidor}" | cut -d. -f1)

# Se não tiver o diretório ~/.ssh , cria-o
if [ ! -d "${SSH_DIR}" ]; then
    mkdir "${SSH_DIR}"
fi

# Se não tiver o servidor registrado no arquivo de configuração do SSH, registra
if ! grep -q "Host ${srv}" ${SSH_CONF} 2> /dev/null; then
    cat << FIM >> ${SSH_CONF}
Host ${srv}
    Hostname ${servidor}
    User ${usuario}
FIM
fi

# Se não tiver um par de chaves pública/privada, cria-o
if [ ! -f "${SSH_KEY}" ]; then
    ssh-keygen -t ed25519 -N '' -f ${SSH_KEY} -q
fi

# Abre o VS Code no diretório de configurações do SSH
(cd ${SSH_DIR}; code .)

cat << FIM
Vamos trocar a senha de seu usuário na Oulu.

Será solicitada a senha de estudante 2x (duas vezes).
Senha de estudante: <estudante>
                  
Depois serão solicitadas: 
- matrícula e 
- senha do SUAP
FIM

ssh -t "estudante@${srv}" sudo nova-senha
