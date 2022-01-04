$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  		= $env:ChocolateyPackageName
  fileType     		= 'EXE'

  url          		= 'https://github.com/TallDwarfs/bins/raw/main/ELEX/elexsetup_4.9.exe'
  checksum     		= '839D42349959B6F69CBF101A7D63C4567A4BF97027E6CD7C26DC11D4051D978B'  
  checksumType 		= 'sha256'
  
  silentArgs   		= "/SILENT"
}

Install-ChocolateyPackage @packageArgs