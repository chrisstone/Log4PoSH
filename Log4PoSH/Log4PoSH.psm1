#### By Chris Stone <chris.stone@nuwavepartners.com> v0.0.4 2020-05-12 13:31:19
<#
.SYNOPSIS
    Powershell Log4Net Wrapper Module
    URL: https://github.com/chrisstone/Log4PoSH
#>
#requires -Version 2.0

$ModuleHome = Split-Path -Path $MyInvocation.MyCommand.Path -Parent

. "$ModuleHome\Public\Core.ps1"
. "$ModuleHome\Public\Config.ps1"