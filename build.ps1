#### By Chris Stone <chris.stone@nuwavepartners.com> v0.0.30 2020-06-12T13:06:21.016Z
# Based on https://github.com/RamblingCookieMonster/PSDeploy

function Resolve-Module {
[Cmdletbinding()]
Param (
    [Parameter(Mandatory)]
    [string[]]	$Name
)

Process {
    Foreach ($ModuleName in $Name) {
		Write-Host "Resolving Module $($ModuleName)"
        $Module = Get-Module -Name $ModuleName -ListAvailable

        If ($Module) {
            $Version = $Module | Measure-Object -Property Version -Maximum | Select-Object -ExpandProperty Maximum
            $GalleryVersion = Find-Module -Name $ModuleName -Repository PSGallery | Measure-Object -Property Version -Maximum | Select-Object -ExpandProperty Maximum

            If ($Version -lt $GalleryVersion) {
                Write-Host "`tOutdated, Version [$($Version.tostring())] is installed. Updating to Gallery Version [$($GalleryVersion.tostring())]"
                Install-Module -Name $ModuleName -Force
                Import-Module -Name $ModuleName -Force -RequiredVersion $GalleryVersion
            } else {
                Write-Host "`tInstalled, Importing $($ModuleName)"
                Import-Module -Name $ModuleName -Force -RequiredVersion $Version
            }
        } else {
            Write-Host "`tMissing, installing Module"
            Install-Module -Name $ModuleName -Force
            Import-Module -Name $ModuleName -Force -RequiredVersion $Version
        }
    }
}
}

# Grab nuget bits, PSGallery, install modules
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null
If ((Get-PSRepository -Name PSGallery).InstallationPolicy -ne 'Trusted') { Set-PSRepository -Name PSGallery -InstallationPolicy Trusted }
Resolve-Module -Name Psake, PSDeploy, Pester, BuildHelpers

# From BuildHelpers
Set-BuildEnvironment -Force

# Go for a deployment in CI system
If ($env:BHBuildSystem -ne 'Unknown') { $BuildOpts = @{ taskList = 'Deploy' } }

# Everything else should be in PSAke
Invoke-PSAke -buildFile "$env:BHProjectPath\psake.ps1" @BuildOpts
Exit ( [int]( -not $psake.build_success ) )
