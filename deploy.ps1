echo "Installing Chocolatey"

Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


if (Test-Path "HKLM:\Software\Microsoft\Microsoft SQL Server\Instance Names\SQL") {
    echo "SQL Server already installed"
} Else {
    echo "SQL Server not found, installing"
    choco install -y sql-server-express
}

echo "Installing iisexpress"
choco install -y iisexpress

echo "Installing git"
choco install -y git