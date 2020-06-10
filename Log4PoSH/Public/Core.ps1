#### By Chris Stone <chris.stone@nuwavepartners.com> v0.0.45 2020-06-10T16:29:28.414Z

function Init-Logger {
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

function Reset-Logger {
	[log4net.LogManager]::ResetConfiguration();
}


function New-Logger {
Param (
	$Name = 'root'
)
	If ($null -eq ([System.AppDomain]::CurrentDomain.GetAssemblies() |? {(($_.FullName -split ',')[0] -match 'log4net')})) { Init-Logger }
	return [log4net.LogManager]::GetLogger($Name);
}

function Get-Logger {
Param (
	$Name = 'root',
	[switch] $All
)
	If ($null -eq ([System.AppDomain]::CurrentDomain.GetAssemblies() |? {(($_.FullName -split ',')[0] -match 'log4net')})) { Init-Logger }
	If ($All.IsPresent()) {
		return [log4net.LogManager]::GetCurrentLoggers()
	} else {
		return [log4net.LogManager]::Exists($Name);
	}
}

function Clear-LoggerBuffer {
	Return !([log4net.LogManager]::Flush())
}

Export-ModuleMember -Function Init-Logger, Reset-Logger, New-Logger, Get-Logger, Clear-LoggerBuffer
