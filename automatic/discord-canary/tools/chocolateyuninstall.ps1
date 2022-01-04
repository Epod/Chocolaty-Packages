
$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Discord Canary'
  fileType      = 'EXE'
  silentArgs	= '--uninstall'
  validExitCodes= @(0)
}

$uninstallFile = "Update.exe"

$uninstalled = $false
[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']


if ($key.Count -eq 1) {
  $key | % { 
    $packageArgs['file'] = "$($_.InstallLocation)\$uninstallFile"
    Uninstall-ChocolateyPackage @packageArgs
	Write-Warning "Discord Uninstalled - However the uninstaller leaves files in $($_.InstallLocation). Attempting to delete..."
	Remove-Item $($_.InstallLocation) -Recurse

  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $($_.DisplayName)"}
}