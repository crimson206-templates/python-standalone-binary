# Windows PowerShell installation script for example-cli
param(
    [string]$InstallPath = "$env:USERPROFILE\bin"
)

# Exit on error
$ErrorActionPreference = "Stop"

# Define variables
$BinaryName = "example-cli"
$GitHubUser = "crimson206-templates"
$GitHubRepo = "python-standalone-binary"
$BinaryFilename = "$BinaryName-windows-amd64.exe"

Write-Host "Fetching latest release version..." -ForegroundColor Green

try {
    # Get the latest release version using GitHub API
    $releaseInfo = Invoke-RestMethod -Uri "https://api.github.com/repos/$GitHubUser/$GitHubRepo/releases/latest"
    $version = $releaseInfo.tag_name
    
    if (-not $version) {
        throw "Could not determine latest version"
    }
    
    Write-Host "Latest version is $version" -ForegroundColor Green
    Write-Host "Downloading $BinaryName..." -ForegroundColor Green
    
    # Download binary from GitHub releases
    $downloadUrl = "https://github.com/$GitHubUser/$GitHubRepo/releases/download/$version/$BinaryFilename"
    Write-Host "Downloading from: $downloadUrl" -ForegroundColor Yellow
    
    # Create install directory if it doesn't exist
    if (-not (Test-Path $InstallPath)) {
        New-Item -ItemType Directory -Path $InstallPath -Force | Out-Null
    }
    
    $destinationPath = Join-Path $InstallPath "$BinaryName.exe"
    
    # Download the binary
    Invoke-WebRequest -Uri $downloadUrl -OutFile $destinationPath
    
    Write-Host "$BinaryName version $version has been installed successfully!" -ForegroundColor Green
    Write-Host "Installed to: $destinationPath" -ForegroundColor Green
    
    # Check if install path is in PATH
    $currentPath = [Environment]::GetEnvironmentVariable("PATH", "User")
    if ($currentPath -notlike "*$InstallPath*") {
        Write-Host ""
        Write-Warning "The install directory is not in your PATH."
        Write-Host "To use '$BinaryName' from anywhere, run this command:" -ForegroundColor Yellow
        Write-Host "  [Environment]::SetEnvironmentVariable('PATH', `"$currentPath;$InstallPath`", 'User')" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "Or restart your PowerShell and add to PATH manually."
    } else {
        Write-Host "You can now run '$BinaryName' from anywhere!" -ForegroundColor Green
    }
}
catch {
    Write-Error "Installation failed: $_"
    exit 1
}