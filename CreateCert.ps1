param(
    [string]$Suffix = "kayee.nl"
)

# Hide progress bar to speed up installation
$global:ProgressPreference = 'silentlyContinue'
Clear-Host

# Import additional modules
$global:DEPLOYMENT_DIRECTORY = Split-Path $MyInvocation.MyCommand.Path
$modulesPath = ( Join-Path -Path $DEPLOYMENT_DIRECTORY -ChildPath "Modules" )
if ($env:PSModulePath -notlike "*$modulesPath*") {
    $p = $env:PSModulePath + ";" + $modulesPath
    [Environment]::SetEnvironmentVariable("PSModulePath", $p)
}

$params = @{
    Path               = Resolve-Path '.\\Certificates\Certificates.json'
    CertificateDnsName = "*.$Suffix"
    CertificateName    = "all.$Suffix"
    CertPath           = "c:\certificates"
    RootCertFileName   = "SitecoreRootCert"

   
}

Install-SitecoreConfiguration @params