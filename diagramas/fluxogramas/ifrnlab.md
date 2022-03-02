# IFRN Lab

```mermaid
graph TD

    %% Dispositivos
    subgraph Máquinas Virtuais
        alpiste[fa:fa-desktop Alpiste]
        dybian[fa:fa-server Dybian]
    end
    notebook[fa:fa-laptop Notebook]

    %% Redes
    subgraph Redes do VirtualBox
        ifrnlab(fa:fa-network-wired ifrnlab)
        hostonly("fa:fa-network-wired Host-only")
        nat[fa:fa-network-wired NAT]
    end

    internet(fa:fa-globe Internet)
    
    %% Ligações entre redes e dispositivos
    alpiste & dybian --- ifrnlab
    dybian --- hostonly & nat --- notebook --- internet
```
