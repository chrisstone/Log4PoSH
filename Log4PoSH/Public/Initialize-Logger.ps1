<#
.SYNOPSIS
Initializes the logger by loading the log4net assembly and resetting the logger.

.DESCRIPTION
This function initializes the logger by loading the log4net assembly if it hasn't already been loaded.
If the log4net assembly is already loaded, it checks the version of the loaded assembly against the assembly in the specified path.
If the loaded assembly is an older version, the function throws an error.
If the log4net assembly isn't loaded or if the loaded assembly is the same version or newer, the function resets the logger.

.PARAMETER DllPath
The path to the log4net DLL. The default path is "..\lib\$($PSVersionTable.CLRVersion.ToString(2))\log4net.dll" relative to the script's root directory.

.EXAMPLE
Initialize-Logger

This command initializes the logger with the log4net DLL at the default path.

.EXAMPLE
Initialize-Logger -DllPath "C:\path\to\log4net.dll"

This command initializes the logger with the log4net DLL at the specified path.

.NOTES
This function is part of the Logging module.
#>
function Initialize-Logger {
	Param (
		[Parameter(
			Position = 0,
			Mandatory = $false,
			HelpMessage = "Path to the log4net.dll file."
		)]
		[ValidateScript({ Test-Path $_ -and (Split-Path $_ -Leaf) -eq "log4net.dll" })]
		[string] $DllPath = (Join-Path $PSScriptRoot ("\..\Log4PoSH\lib\{0}\log4net.dll" -f
				$(if ($PSVersionTable.CLRVersion) {
						("net" -f $PSVersionTable.CLRVersion.ToString(2))
					} else {
						'netstandard2.0'
					})))
	)

	If ($null -ne ($l4n_assembly = [System.AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { (($_.FullName -split ',')[0] -match 'log4net') })) {
		# Assembly already loaded
		If (((($l4n_assembly.FullName -split ',')[1] -split '=')[1] -as [version]) -lt (Get-ItemProperty -Path $DllPath).VersionInfo.FileVersion) {
			Throw "Old version of Log4Net Assembly already in AppDomain, cannot load Module!"
		}
	}

	# Load Log4Net
	[void][Reflection.Assembly]::LoadFile($DllPath);
	Reset-Logger
}
Export-ModuleMember -Function Initialize-Logger
