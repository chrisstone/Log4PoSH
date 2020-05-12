#### By Chris Stone <chris.stone@nuwavepartners.com> v0.0.38 2020-05-08T18:57:43.459Z

function Initialize-Log4PoSH {
Param (
	[string] $DllPath = $PSScriptRoot + "\..\lib\$($PSVersionTable.CLRVersion.ToString(2))\log4net.dll"
)
	$l4n_assembly = [System.AppDomain]::CurrentDomain.GetAssemblies() |? {(($_.FullName -split ',')[0] -match 'log4net')}
	If ($null -ne $l4n_assembly) {
		If ((($l4n_assembly.FullName -split '.')[1] -as [version]) -lt (Get-ItemProperty -Path $DllPath).VersionInfo.FileVersion) {
			Throw "Old version of Log4Net Assembly already in AppDomain!"
		}
		Return 0
	}
	[void][Reflection.Assembly]::LoadFile($DllPath);
	[log4net.LogManager]::ResetConfiguration();
}

function Reset-Log4PoSH {
	[log4net.LogManager]::ResetConfiguration();
}


function New-Log4PoSH {
Param (
	$Name = 'root'
)
	return [log4net.LogManager]::GetLogger($Name);
}

function Get-Log4PoSH {
Param (
	$Name = 'root'
)
	return [log4net.LogManager]::Exists($Name);
}

function Get-L4pLoggers {
	return [log4net.LogManager]::GetCurrentLoggers()
}

function Clear-Log4PoSHBuffer {
	Return !([log4net.LogManager]::Flush())
}
