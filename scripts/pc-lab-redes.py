#!/usr/bin/env python3

import fire
import netifaces
import subprocess

ifname = 'enp2s0'
net_id = '172.16.1'
prefix_length = 24
matriz_hostname = 'pc-lab-redes'

paises_africa = '''\
angola
argelia
burundi
egito
eritreia
etiopia
gabao
gana
lesoto
libia
madagascar
mali
marrocos
mauritania
mocambique
namibia
niger
nigeria
quenia
ruanda
senegal
somalia
sudao
tanzania
tunisia\
'''.splitlines()

class Comandos:

    @property
    def hosts(self):
        lista_formatada = []
        for i,h in enumerate(paises_africa, start=1):
            lista_formatada.append(f'{net_id}.{i}\t{h} pc-{i} pc{i} pc-{i:02d}')

        return '\n'.join(lista_formatada)

    @property
    def ip(self):
        return netifaces.ifaddresses(ifname)[2][0]['addr']

    @property
    def host_id(self):
        return self.ip.rsplit('.', maxsplit=1)[-1]

    @property
    def net_id(self):
        return self.ip.rsplit('.', maxsplit=1)[0]

    @property
    def name(self):
        host_id = int(self.host_id)
        if 0 < host_id < len(paises_africa)+1:
            return paises_africa[host_id+1]

    def set_hostname(self):
        nome_atual = open('/etc/hostname').read().split()[0]
        if nome_atual.strip() == matriz_hostname:
            nome_novo = self.name
            cmd = fr"sed -i 's/\b{nome_atual}\b/{nome_novo}/g' /etc/hostname /etc/hosts"

            return cmd
        else:
            return ''


def main():
    fire.Fire(Comandos)

if __name__ == '__main__':
    main()
