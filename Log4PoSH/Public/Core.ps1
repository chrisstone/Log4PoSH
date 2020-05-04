#### By Chris Stone <chris.stone@nuwavepartners.com> v0.0.6 2020-05-01T19:14:34.058Z

New-Log4PoSH {
Param (
	$DllPath = $PSScriptRoot + "\..\Log4PoSH\lib\$($PSVersionTable.CLRVersion.ToString(2))\log4net.dll";
)
Process {
	[void][Reflection.Assembly]::LoadFile($DllPath);
	[log4net.LogManager]::ResetConfiguration();
}
End {
	return [log4net.LogManager]::GetLogger("root");
}
