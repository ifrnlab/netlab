Get-NetNeighbor -AddressFamily IPv4 | Select-Object -Property LinkLayerAddress,IPAddress | where {$_.LinkLayerAddress -ne ""} | ConvertTo-Csv | clip
