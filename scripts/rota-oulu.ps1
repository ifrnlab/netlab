Test-NetConnection -ComputerName oulu.ifrn.edu.br -TraceRoute | Select-Object -Property TraceRoute | %{$_.TraceRoute} | clip
