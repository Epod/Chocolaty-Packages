$ErrorActionPreference = 'Stop';

$InstallLocation = Get-EnvironmentVariable -Name ProgramFiles -Scope Process
$UserPathLocation = Get-EnvironmentVariable -Name USERPROFILE -Scope Process
$packageArgs = @{
  packageName  		= $env:ChocolateyPackageName

  url          		= 'https://github.com/TallDwarfs/bins/raw/main/ArsenalRecon/ImageMounter/Image%20Mounter.zip'
  checksum     		= 'C458AC113DE467ED78F00201947C4423C9F239E621144F6C3078A3503F1FF414'  
  checksumType 		= 'sha256'
  
  unzipLocation		= "$($InstallLocation)\Arsenal Image Mounter"
}

$shortcutArgs = @{
  targetPath  		= "$($InstallLocation)\Arsenal Image Mounter\ArsenalImageMounter.exe"
  shortcutFilePath	= "$($UserPathLocation)\Desktop\Arsenal Image Mounter.lnk"

}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut @shortcutArgs