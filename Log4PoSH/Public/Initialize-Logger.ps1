#### By Chris Stone <chris.stone@nuwavepartners.com> v0.0.58 2020-06-11T19:53:03.148Z

function Initialize-Logger {
Param (
	[string] $DllPath = $PSScriptRoot + "\..\lib\$($PSVersionTable.CLRVersion.ToString(2))\log4net.dll"
)
	If ($null -ne ($l4n_assembly = [System.AppDomain]::CurrentDomain.GetAssemblies() |? {(($_.FullName -split ',')[0] -match 'log4net')})) {
		# Assembly already loaded
		If (((($l4n_assembly.FullName -split ',')[1] -split '=')[1] -as [version]) -lt (Get-ItemProperty -Path $DllPath).VersionInfo.FileVersion) {
			Throw "Old version of Log4Net Assembly already in AppDomain, cannot load Module!"
		}
	} else {
		# Load assembly
		[void][Reflection.Assembly]::LoadFile($DllPath);
	}
	Reset-Logger
}

Export-ModuleMember -Function Initialize-Logger
