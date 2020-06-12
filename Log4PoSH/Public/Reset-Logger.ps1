#### By Chris Stone <chris.stone@nuwavepartners.com> v0.0.54 2020-06-11T19:34:11.788Z



function Reset-Logger {
	[log4net.LogManager]::ResetConfiguration();
}


Export-ModuleMember -Function Reset-Logger
