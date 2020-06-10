# https://github.com/RamblingCookieMonster/PSDeploy
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
        Write-Verbose -Message "Resolving Module $($ModuleName)"

        If ($Module) {
            $Version = $Module | Measure-Object -Property Version -Maximum | Select-Object -ExpandProperty Maximum
            $GalleryVersion = Find-Module -Name $ModuleName -Repository PSGallery | Measure-Object -Property Version -Maximum | Select-Object -ExpandProperty Maximum

            If ($Version -lt $GalleryVersion) {

                If ((Get-PSRepository -Name PSGallery).InstallationPolicy -ne 'Trusted') { Set-PSRepository -Name PSGallery -InstallationPolicy Trusted }

                Write-Verbose -Message "$($ModuleName) Installed Version [$($Version.tostring())] is outdated. Installing Gallery Version [$($GalleryVersion.tostring())]"

                Install-Module -Name $ModuleName -Force
                Import-Module -Name $ModuleName -Force -RequiredVersion $GalleryVersion
            } else {
                Write-Verbose -Message "Module Installed, Importing $($ModuleName)"
                Import-Module -Name $ModuleName -Force -RequiredVersion $Version
            }
        } else {
            Write-Verbose -Message "$($ModuleName) Missing, installing Module"
            Install-Module -Name $ModuleName -Force
            Import-Module -Name $ModuleName -Force -RequiredVersion $Version
        }
    }
}
}

# Grab nuget bits, install modules, set build variables, start build.
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

Resolve-Module -Name Psake, PSDeploy, Pester, BuildHelpers

# From BuildHelpers
Set-BuildEnvironment -Force

Invoke-psake .\psake.ps1
exit ( [int]( -not $psake.build_success ) )
