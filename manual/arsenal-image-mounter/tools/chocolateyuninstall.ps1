$ErrorActionPreference = 'Stop';

$InstallLocation = Get-EnvironmentVariable -Name ProgramFiles -Scope Process
$UserPathLocation = Get-EnvironmentVariable -Name USERPROFILE -Scope Process

Remove-Item "$($InstallLocation)\Arsenal Image Mounter" -Recurse
Remove-Item "$($UserPathLocation)\Desktop\Arsenal Image Mounter.lnk"