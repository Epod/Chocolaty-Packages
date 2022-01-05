$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  		= $env:ChocolateyPackageName
  fileType     		= 'MSI'

  url          		= 'https://github.com/TallDwarfs/bins/raw/main/FTK/AccessData_FTK_Imager_(x64).msi'
  checksum     		= '730248FCF06BE70FEC7A9DF97B1860D8F2FA9855E5995AE0FD13C424FA02BD23'  
  checksumType 		= 'sha256'
  
  silentArgs   		= "/quiet"
}

Install-ChocolateyPackage @packageArgs