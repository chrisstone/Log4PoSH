<#
.SYNOPSIS
Creates a new logger interface.

.DESCRIPTION
The New-Logger function creates a new logger interface using log4net.
If the log4net assembly is not already loaded, it will be initialized with the Initialize-Logger function.
By default, it gets the 'root' logger, but this can be changed by specifying a different name as a parameter.

.PARAMETER Name
The name of the logger interface to create. This defaults to 'root' if no other name is provided.

.EXAMPLE
New-Logger

This command creates a new 'root' logger interface.

.EXAMPLE
New-Logger -Name 'CustomLogger'

This command creates a new logger interface named 'CustomLogger'.
#>
function Get-Logger {
	[CmdletBinding()]
	Param (
		[string] $Name = 'root'
	)
	Begin {
		If ($null -eq ([System.AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { ($_.FullName -split ',')[0] -match 'log4net' })) {
			Initialize-Logger
		}
	}
	Process {
		return [log4net.LogManager]::GetLogger($Name);
	}
}
Export-ModuleMember -Function Get-Logger
