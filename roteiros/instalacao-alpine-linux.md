# Instalação do Alpine Linux

Roteiro:

1. Executar: `setup-alpine`
2. Definir nome da máquina (hostname) com eventual domínio
3. Escolher interface(s) de rede a configurar
   1. Foi escolhido eth0 (já estava entre colchetes) com configuracoes obtidas via DHCP
   2. Foi escolhido eth1 (já entre colchetes) com configurações obtidas via DHCP)
   3. Quando solicitado para configurar eth2, optou-se em saltar (done => "feito" em inglês)
   4. Optou-se em não configurar mais nenhuma interface de rede

4. Senha do usuário root
5. Fuso horário
6. Sem servidor proxy (none)
7. Cliente NTP (Deixar o chrony)
8. Escolher o repositório "mais rápido" ("fastest" em inglês). Pressionar a letra "f"
   - Este processo demora um pouco

9. Escolha do nome e senha de um usuário (Fortemente recomendado)
10. Chave SSH para estudante: Pressionar ENTER
11. Servidor SSH para acesso remoto: Deixar o "openssh", que já está entre colchetes.
12. Disco a ser particionado, a ter partições formatadas e onde o Alpine será instalado.
   - Olhe para linha anterior que apresenta o nome do disco. Neste caso: sda

13. Como deverá ser usado o disco. Pressione "?" e a tecla ENTER para saber mais detalhes.
   - Vamos escolher lvmsys

14. Confirmar que o disco será apagado.
15. Aguardar a instalação
16. Lembrar de remover o disco (No VirtualBox, menu Dispositivos -> Discos ópticos -> Remover disco)
17. Digitar o comando "reboot" (Sem as aspas). No VirtualBox, pressionar: <Ctrl da direira> + R
