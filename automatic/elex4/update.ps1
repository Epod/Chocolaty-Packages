import-module au

$releases = 'https://github.com/TallDwarfs/bins/raw/main/ELEX/elexsetup_4.9.exe'

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(?i)(^\s*packageName\s*=\s*)('.*')"    = "`$1'$($Latest.PackageName)'"
            "(?i)(^\s*url\s*=\s*)('.*')"            = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
        }
        'tools\chocolateyuninstall.ps1' = @{
            "(?i)(^\s*packageName\s*=\s*)('.*')"    = "`$1'$($Latest.PackageName)'"
        }
     }
}

function global:au_BeforeUpdate() { }

function global:au_AfterUpdate ($Package)  {
    Set-DescriptionFromReadme $Package -SkipFirst 2 
}

function global:au_GetLatest {
    $url = $releases

    while($true) {
    
        $request = [System.Net.WebRequest]::Create($url)
        $request.AllowAutoRedirect = $false
        
        $response = $request.GetResponse()
        $location = $response.GetResponseHeader('Location')
        
        if (!$location -or ($location -eq $url)) { 
            break 
        }
        
        $url = $location
    }    
    
    $url32 = $url
    $url64 = $url

    $version = ($url -replace '.exe' -split '_' | select -Last 1)
    
    $current_checksum = (gi $PSScriptRoot\tools\chocolateyInstall.ps1 | sls '\bchecksum\b') -split "=|'" | Select -Last 1 -Skip 1
    
    if ($current_checksum.Length -ne 64) { 
        throw "Can't find current checksum" 
    }
    
    $remote_checksum = Get-RemoteChecksum $url
        
    if ($current_checksum -ne $remote_checksum) {
        Write-Host 'Remote checksum is different then the current one, forcing update'
        
        $global:au_old_force = $global:au_force
        $global:au_force = $true
        #$global:au_Version = $version
    }
        
    $Latest = @{ 
                URL32       = $url32
                Version     = $version 
                Checksum32  = $remote_checksum 
              }  
    
    return $Latest
}

if ($MyInvocation.InvocationName -ne '.') {
    update -ChecksumFor none
    
    if ($global:au_old_force -is [bool]) { 
        $global:au_force = $global:au_old_force 
    }
} 