function Get-IPPublico {
  (Invoke-WebRequest -Uri "https://ifconfig.me/ip" -UseBasicParsing).Content
} 
