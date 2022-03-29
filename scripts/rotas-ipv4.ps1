Get-NetRoute -AddressFamily IPv4 | Select-Object -Property DestinationPrefix,NextHop -Unique | ConvertTo-Csv | clip
