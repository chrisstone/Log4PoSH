#### By Chris Stone <chris.stone@nuwavepartners.com> v0.0.11 2020-06-11T19:49:45.093Z
<#
.SYNOPSIS
    Powershell Log4Net Wrapper Module
    URL: https://github.com/chrisstone/Log4PoSH
#>

$ModuleHome = Split-Path -Path $MyInvocation.MyCommand.Path -Parent

Foreach ($ModFile in (Get-ChildItem -Filter '*.ps1' -Path "$ModuleHome\Public")) {
	. $($ModFile.FullName)
}
