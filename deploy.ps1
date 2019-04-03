echo "Checking if deps are already installed"
$install_sql = ! (Test-Path "HKLM:\Software\Microsoft\Microsoft SQL Server\Instance Names\SQL")
$install_iis = ! ((Get-WindowsFeature Web-Server).InstallState -eq "Installed")
$install_git = ! (Get-Command git)

if ($install_sql -or $install_iis -or $install_git ){
    echo "Installing Chocolatey"
    Set-ExecutionPolicy Bypass -Scope Process -Force
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

if ($install_sql) {
    echo "SQL Server not found, installing"
    choco install -y sql-server-express
} Else {
    echo "SQL Server already installed"
}

if ($install_iis) {
    echo "IIS not installed, installing iisexpress"
    choco install -y iisexpress
} else {
    Write-Host "IIS is already installed"
}

if($install_git){
    echo "Installing git"
    choco install -y git
} else {
    echo "git already installed"
}