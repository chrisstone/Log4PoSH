#### By Chris Stone <chris.stone@nuwavepartners.com> v0.0.10 2020-06-11T15:02:07.088Z
# Based on https://github.com/RamblingCookieMonster/PSDeploy

function Get-CurrentFileName {
	If ($MyInvocation.CommandOrigin -eq 0) {
		Return $MyInvocation.CommandOrigin
	} else {
		Return $MyInvocation.MyCommand.Name
	}
};

function Resolve-Module {
[Cmdletbinding()]
param
(
    [Parameter(Mandatory)]
    [string[]]$Name
)

Process {
    Foreach ($ModuleName in $Name) {
        $Module = Get-Module -Name $ModuleName -ListAvailable
        Write-Host "Resolving Module $($ModuleName)"

        If ($Module) {
            $Version = $Module | Measure-Object -Property Version -Maximum | Select-Object -ExpandProperty Maximum
            $GalleryVersion = Find-Module -Name $ModuleName -Repository PSGallery | Measure-Object -Property Version -Maximum | Select-Object -ExpandProperty Maximum

            If ($Version -lt $GalleryVersion) {

                If ((Get-PSRepository -Name PSGallery).InstallationPolicy -ne 'Trusted') { Set-PSRepository -Name PSGallery -InstallationPolicy Trusted }

                Write-Host "$($ModuleName) Installed Version [$($Version.tostring())] is outdated. Installing Gallery Version [$($GalleryVersion.tostring())]"

                Install-Module -Name $ModuleName -Force
                Import-Module -Name $ModuleName -Force -RequiredVersion $GalleryVersion
            } else {
                Write-Host "Module Installed, Importing $($ModuleName)"
                Import-Module -Name $ModuleName -Force -RequiredVersion $Version
            }
        } else {
            Write-Host "$($ModuleName) Missing, installing Module"
            Install-Module -Name $ModuleName -Force
            Import-Module -Name $ModuleName -Force -RequiredVersion $Version
        }
    }
}
}

Write-Host ("$(Get-CurrentFileName) Started ").PadRight(80,'-')

# Grab nuget bits, install modules, set build variables, start build.
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

Resolve-Module -Name Psake, PSDeploy, Pester, BuildHelpers

# From BuildHelpers
Set-BuildEnvironment -Force

Invoke-psake "$env:BHProjectPath\psake.ps1"
exit ( [int]( -not $psake.build_success ) )
