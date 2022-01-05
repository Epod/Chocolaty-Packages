$ErrorActionPreference = 'Stop';

$InstallLocation = Get-EnvironmentVariable -Name ProgramFiles -Scope Process
$UserPathLocation = Get-EnvironmentVariable -Name USERPROFILE -Scope Process

Remove-Item "$($InstallLocation)\Volatility Workbench" -Recurse
Remove-Item "$($UserPathLocation)\Desktop\Volatility Workbench.lnk"