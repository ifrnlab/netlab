# netplan: Folha-resumo

Edite o arquivo YAML que deve existir em: `/etc/netplan`. Para descobrir o nome do arquivo, execute:

- `ls /etc/netplan/*.yaml`

Edite o arquivo com seu editor para terminal favorito, como `nano`, `vim` ou `micro`.

No exemplo abaixo, você pode revisar um plano de rede usando IPv4 e IPv6. Substituímos os endereços por IPs casuais.

```yaml
# Este arquivo descreve as interfaces de rede disponíveis em seu sistema
# Para maiores informações, veja netplan(5).
# Execute: man 5 netplan
# Ou acesse: http://manpages.ubuntu.com/manpages/hirsute/man5/netplan.5.html

network:

  version: 2
  renderer: networkd
  
  ethernets:
  
    eth0:
    
      # Desabilita o DHCP
      dhcp4: no
      dhcp6: no
      
      # Configuração de endereço
      # Múltiplos endereços podem ser acrescentados ao adicionar uma linha 
      addresses:
        - 192.168.1.123/24
        - 123:4567:ab12:3:192:168:1:123/64
      
      # Roteadores padrões
      gateway4: 192.168.1.1
      gateway6: 123:4567:ab12:3::1
      
      # Servidores de nome - novamente você pode adicionar novas linhas linhas
      nameservers:
        addresses:
          - 192.168.1.1
          - 192.168.1.2
          - 123:4567:ab12:3:192:168:1:1
          - 123:4567:ab12:3:192:168:1:2
```
Você pode testar e aplicar suas configurações do netplan executando os seguintes comandos:

- `sudo netplan try`
- `sudo netplan apply`
