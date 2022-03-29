Get-NetTCPConnection -State Listen | Select-Object -Property LocalPort -Unique | where {$_.LocalPort -le 9999} | ConvertTo-Csv | clip
