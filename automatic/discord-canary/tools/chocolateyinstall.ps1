$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  		= $env:ChocolateyPackageName
  fileType     		= 'EXE'

  url          		= 'https://discord.com/api/canary/download?platform=win'
  checksum     		= '22158659D27E0C704947689F3D9AF47439E02AB101AE446975A66172317152EB'  
  checksumType 		= 'sha256'
  
  url64bit          = 'https://discord.com/api/canary/download?platform=win'
  checksum64     	= '22158659D27E0C704947689F3D9AF47439E02AB101AE446975A66172317152EB'  
  checksumType64	= 'sha256'
  
  silentArgs   		= "-s"
}

Install-ChocolateyPackage @packageArgs