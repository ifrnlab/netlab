$matricula = Read-Host -Prompt "Matrícula: "
$email_escolar = Read-Host -Prompt "E-mail do GSA: "
$host_remoto = Read-Host -Prompt "Host remoto: "

$redes_ifrn = $env:USERPROFILE+"\Documents\IFRN\Redes\Nossas-Redes\Rede-" + $matricula

New-Item -ItemType Directory -Force -Path $redes_ifrn
Set-Location $redes_ifrn

Set-Location ..
explorer .
