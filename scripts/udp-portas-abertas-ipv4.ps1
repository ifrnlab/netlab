 Get-NetUDPEndpoint -LocalAddress "0.0.0.0" | Select-Object -Property LocalPort | where {$_.LocalPort -le 9999} | ConvertTo-Csv | clip
