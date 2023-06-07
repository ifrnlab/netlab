from argparse import ArgumentParser
from collections import OrderedDict
from pathlib import Path

parser = ArgumentParser()
parser.add_argument('arquivo', help='Arquivo com registro de comandos e resposta do protocolo FTP.')

args = parser.parse_args()
cam_arquivo = Path(args.arquivo)

resps_cmd = OrderedDict() # Resposta aos comandos
last_cmd = ''

if cam_arquivo.exists() and cam_arquivo.is_file():
    with cam_arquivo.open(mode='r', encoding='utf-8') as arq_log:
        linha = arq_log.readline().strip()
        last_cmd = linha
        responses = []

        while linha := arq_log.readline().strip():
            if linha.split()[0].isdigit():
                responses.append(linha)
            else:
                resps_cmd[last_cmd] = responses
                last_cmd = linha
                responses = []

    cliente = "Explorer"
    servidor = "VSFTPD"

    cam_arq_md = cam_arquivo.parent / f'{cam_arquivo.name[:-len(cam_arquivo.suffix)]}.md'
    
    with cam_arq_md.open(mode='w', encoding='utf-8') as arq_md:
        arq_md.write(f"""\
# {cam_arquivo.name}

```mermaid

sequenceDiagram

""")
        for cmd,responses in resps_cmd.items():
            arq_md.write(f'    {cliente} ->> {servidor}: {cmd}\n')
            for resp in responses:
                arq_md.write(f'    {servidor} -->> {cliente}: {resp}\n')    

        arq_md.write("```")



