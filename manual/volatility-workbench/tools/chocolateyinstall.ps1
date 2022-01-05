$ErrorActionPreference = 'Stop';

$InstallLocation = Get-EnvironmentVariable -Name ProgramFiles -Scope Process
$UserPathLocation = Get-EnvironmentVariable -Name USERPROFILE -Scope Process
$packageArgs = @{
  packageName  		= $env:ChocolateyPackageName

  url          		= 'https://www.osforensics.com/downloads/VolatilityWorkbench-v2.1.zip'
  checksum     		= '273B472CF2368495E5540C35F8573F55EF85F132F1457C4F21001F267CD7AD5A'  
  checksumType 		= 'sha256'
  
  unzipLocation		= "$($InstallLocation)\Volatility Workbench"
}

$shortcutArgs = @{
  targetPath  		= "$($InstallLocation)\Volatility Workbench\VolatilityWorkbench.exe"
  shortcutFilePath	= "$($UserPathLocation)\Desktop\Volatility Workbench.lnk"

}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut @shortcutArgs