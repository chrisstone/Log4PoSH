#### By Chris Stone <chris.stone@nuwavepartners.com> v0.0.53 2020-06-11T19:33:04.761Z


function Clear-LoggerBuffer {
	Return !([log4net.LogManager]::Flush())
}

Export-ModuleMember -Function Clear-LoggerBuffer
