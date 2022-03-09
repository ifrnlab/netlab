# Exibe o endereço IPv4 usado para se conectar à Internet

# Roteador padrão da rede IPv4
$roteador4 = (Get-NetRoute "0.0.0.0/0").NextHop

# Endereços IPv4 com respectivo comprimento do prefixo
$ends_IPv4 = Get-NetIPAddress -AddressFamily IPv4 | select -Property IPAddress,PrefixLength

# Vetor com o valor decimal de cada um dos 4 octetos o end. IPv4 do roteador padrão (Gateway)
$octs_rot4 = $roteador4.Split('.')

# PARA CADA um dos endereços coletados FAÇA
# "for each" significa "para cada" em inglês
# $ip é a variável que armazenará o valor de cada um dos endereços
# $ends_IPv4 é o vetor de coletado na linha 7

foreach ($ip in $ends_IPv4) {
    
    # Vetor com o valor decimal de cada um dos 4 octetos o end. IPv4 analisado
    $octs_ip = $ip.IPAddress.Split('.')

    # A fórmula abaixo só funciona para comprimentos de prefixo múltiplos de 8
    if (($ip.PrefixLength % 8) -eq 0) {

        # Quantos octetos são utilizados para máscara?
        [int] $qt_octs = $ip.PrefixLength / 8

        # Os N octetos de cada um dos vetores são idênticos?
        # N: $qt_octs
        $resultado = Compare-Object $octs_rot4[0..($qt_octs-1)] $octs_ip[0..($qt_octs-1)] -SyncWindow 0

        # O comando anterio devolve NULL se os vetores forem idênticos
        if ($resultado -eq $null) {
            Write-Host $ip.IPAddress
        }
    }
}
