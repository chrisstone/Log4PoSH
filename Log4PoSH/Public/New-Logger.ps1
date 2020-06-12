#### By Chris Stone <chris.stone@nuwavepartners.com> v0.0.53 2020-06-11T19:33:45.004Z



function New-Logger {
Param (
	$Name = 'root'
)
	If ($null -eq ([System.AppDomain]::CurrentDomain.GetAssemblies() |? {(($_.FullName -split ',')[0] -match 'log4net')})) { Init-Logger }
	return [log4net.LogManager]::GetLogger($Name);
}

Export-ModuleMember -Function New-Logger
