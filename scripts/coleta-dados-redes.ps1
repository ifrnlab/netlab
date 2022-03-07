 $gateway_ipv4 =  (Get-NetRoute "0.0.0.0/0").NextHop
 $ipv4_e_prefixo = Get-NetIPAddress | select InterfaceAlias,IPv4Address,PrefixLength | where {$_.IPv4Address -ne $null}
 $portas_tcp_ipv4 = Get-NetTCPConnection -State Listen | select -Unique -Property LocalPort
 $portas_udp_ipv4 = Get-NetUDPEndpoint | Where {$_.LocalAddress -eq "0.0.0.0"} | select -Property LocalPort
 $mac_ipv4 = Get-NetNeighbor | select -Property LinkLayerAddress,IPAddress | Where {$_.IPAddress.Contains('.') -and $_.LinkLayerAddress.Length -ne 0}
