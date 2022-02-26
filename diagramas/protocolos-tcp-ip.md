# Protocolos da arquitetura TCP/IP

```mermaid
  subgraph Aplicação
    http[HTTP]
    ssh[SSH]
    dns[DNS]
    dhcp[DHCP]
    cifs[CIFS]
    smtp[SMTP]
    pop3[POP3]
    imap[IMAP]
  end

  subgraph Transporte
    tcp[TCP]
    udp[UDP]
  end
  
  subgraph Rede
    ipv4[IPv4]
    ipv6[IPv6]
  end
  
  subgraph Enlace
    ethernet[Ethernet]
    wifi[Wifi]
  end
  
  subgraph Física
    fibra[Fibra ótica]
    cobre[Cabo de par trançado]
    ar[Ar]
  end
```
