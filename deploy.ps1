echo "Installing Chocolatey"

Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

echo "Installing SQL Server Express"
choco install sql-server-express -y